CREATE OR REPLACE PROCEDURE analyze_supplier_orders(
    p_supplier_id IN Supplier.Supplier_Id%TYPE
)
IS
    v_supplier_name Supplier.Supplier_Name%TYPE;
    v_order_count NUMBER := 0;
    v_total_products NUMBER := 0;
    v_most_ordered_product Products.Product_Name%TYPE;
    v_most_ordered_quantity NUMBER := 0;
    v_last_order_date Orders.Order_Date%TYPE;
    v_current_order_id Orders.Order_Id%TYPE := -1;
    CURSOR c_orders IS
        SELECT o.Order_Id, o.Order_Date, p.Product_Id, p.Product_Name
        FROM Orders o
        JOIN Order_Supplier os ON o.Order_Id = os.Order_Id
        JOIN Order_Product op ON o.Order_Id = op.Order_Id
        JOIN Products p ON op.Product_Id = p.Product_Id
        WHERE os.Supplier_Id = p_supplier_id
        ORDER BY o.Order_Date DESC;
    TYPE product_count_type IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    v_product_counts product_count_type;
BEGIN
    -- Get supplier name
    BEGIN
        SELECT Supplier_Name INTO v_supplier_name
        FROM Supplier
        WHERE Supplier_Id = p_supplier_id;
        
        DBMS_OUTPUT.PUT_LINE('Analyzing orders for supplier: ' || v_supplier_name);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No supplier found with ID: ' || p_supplier_id);
            RETURN;
    END;

    -- Analyze orders
    FOR order_rec IN c_orders LOOP
        IF order_rec.Order_Id != v_current_order_id THEN
            v_order_count := v_order_count + 1;
            v_current_order_id := order_rec.Order_Id;
            
            -- Set last order date (will be the first in the cursor due to DESC order)
            IF v_order_count = 1 THEN
                v_last_order_date := order_rec.Order_Date;
            END IF;
        END IF;
        
        v_total_products := v_total_products + 1;
        
        -- Count products
        IF v_product_counts.EXISTS(order_rec.Product_Id) THEN
            v_product_counts(order_rec.Product_Id) := v_product_counts(order_rec.Product_Id) + 1;
        ELSE
            v_product_counts(order_rec.Product_Id) := 1;
        END IF;
        
        -- Update most ordered product
        IF v_product_counts(order_rec.Product_Id) > v_most_ordered_quantity THEN
            v_most_ordered_product := order_rec.Product_Name;
            v_most_ordered_quantity := v_product_counts(order_rec.Product_Id);
        END IF;
    END LOOP;

    -- Print results
    DBMS_OUTPUT.PUT_LINE('Analysis for supplier: ' || v_supplier_name);
    DBMS_OUTPUT.PUT_LINE('Total orders: ' || v_order_count);
    DBMS_OUTPUT.PUT_LINE('Total products ordered: ' || v_total_products);
    IF v_most_ordered_product IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Most ordered product: ' || v_most_ordered_product || ' (Ordered ' || v_most_ordered_quantity || ' times)');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No products found in orders');
    END IF;
    IF v_last_order_date IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Last order date: ' || TO_CHAR(v_last_order_date, 'YYYY-MM-DD'));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No order date found');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
