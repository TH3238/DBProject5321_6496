CREATE OR REPLACE PROCEDURE MAIN2 IS
    -- Variables for get_client_purchases
    v_client_id NUMBER := 1;  -- Assume we have a client with ID 1
    v_client_cursor SYS_REFCURSOR;
    v_client_name VARCHAR2(100);
    v_purchase_count NUMBER;
    v_total_amount NUMBER;
    v_is_club_member VARCHAR2(3);
    
    -- Variables for analyze_supplier_orders
    v_supplier_id NUMBER := 130;  -- Assume we have a supplier with ID 130
    
    -- Additional variables for interesting analysis
    v_avg_purchase_amount NUMBER;
    v_supplier_product_count NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Client Purchase Analysis ===');
    
    -- Call get_client_purchases function
    v_client_cursor := get_client_purchases(v_client_id);
    
    -- Fetch results from the cursor
    FETCH v_client_cursor INTO v_client_name, v_purchase_count, v_total_amount, v_is_club_member;
    CLOSE v_client_cursor;
    
    -- Display results
    DBMS_OUTPUT.PUT_LINE('Client Name: ' || v_client_name);
    DBMS_OUTPUT.PUT_LINE('Total Purchases: ' || v_purchase_count);
    DBMS_OUTPUT.PUT_LINE('Total Amount Spent: $' || TO_CHAR(v_total_amount, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('Club Member: ' || v_is_club_member);
    
    -- Calculate average purchase amount
    IF v_purchase_count > 0 THEN
        v_avg_purchase_amount := v_total_amount / v_purchase_count;
        DBMS_OUTPUT.PUT_LINE('Average Purchase Amount: $' || TO_CHAR(v_avg_purchase_amount, '999,999.99'));
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('=== Supplier Order Analysis ===');
    
    -- Call analyze_supplier_orders procedure
    analyze_supplier_orders(v_supplier_id);
    
    -- Additional interesting analysis
    -- Count how many products from this supplier the client has purchased
    SELECT COUNT(DISTINCT p.Product_Id)
    INTO v_supplier_product_count
    FROM Purchase_Client pc
    JOIN Purchase_Product pp ON pc.Purchase_Id = pp.Purchase_Id
    JOIN Products p ON pp.Product_Id = p.Product_Id
    JOIN Order_Product op ON p.Product_Id = op.Product_Id
    JOIN Order_Supplier os ON op.Order_Id = os.Order_Id
    WHERE pc.Client_Id = v_client_id AND os.Supplier_Id = v_supplier_id;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('=== Interesting Insights ===');
    DBMS_OUTPUT.PUT_LINE('Number of products from Supplier ' || v_supplier_id || 
                         ' purchased by Client ' || v_client_id || ': ' || v_supplier_product_count);
    
    -- Suggest if the client should become a club member based on their purchases
    IF v_is_club_member = 'No' AND v_total_amount > 2 THEN
        DBMS_OUTPUT.PUT_LINE('Suggestion: Consider offering Club Membership to ' || v_client_name || 
                             ' based on their high purchase volume.');
    END IF;
    
    -- Suggest if we should order more from this supplier based on client's purchases
    IF v_supplier_product_count > 2 THEN
        DBMS_OUTPUT.PUT_LINE('Suggestion: Consider increasing orders from Supplier ' || v_supplier_id || 
                             ' as their products are popular with Client ' || v_client_id || '.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END MAIN2;
/
