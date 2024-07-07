CREATE OR REPLACE PROCEDURE main1(
    p_category_id IN NUMBER,
    p_supplier_id IN NUMBER,
    p_price_increase IN NUMBER
)
IS
    v_top_products SYS_REFCURSOR;
    v_product_name Products.Product_Name%TYPE;
    v_product_price Products.Product_Price%TYPE;
    v_total_sold NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting analysis and processing for category ' || p_category_id || ' and supplier ' || p_supplier_id);
    
    -- Call procedure to update prices in the category
    update_category_prices(p_category_id, p_price_increase);
    
    -- Get top products in the category after the update
    v_top_products := get_top_products(p_category_id, 5);
    
    DBMS_OUTPUT.PUT_LINE('Top products in the category after price update:');
    LOOP
        FETCH v_top_products INTO v_product_name, v_product_price, v_total_sold;
        EXIT WHEN v_top_products%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_product_name || ' - Price: ' || v_product_price || ', Amount sold: ' || v_total_sold);
    END LOOP;
    CLOSE v_top_products;
    
    DBMS_OUTPUT.PUT_LINE('Completed analysis and processing for category');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END main1;
/
