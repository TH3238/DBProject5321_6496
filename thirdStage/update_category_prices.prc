CREATE OR REPLACE PROCEDURE update_category_prices(
    p_category_id IN NUMBER,
    p_price_increase_percent IN NUMBER
)
IS
    CURSOR product_cursor IS
        SELECT Product_Id, Product_Name, Product_Price
        FROM Products
        WHERE Category_Id = p_category_id
        FOR UPDATE OF Product_Price;
    
    v_old_price NUMBER;
    v_new_price NUMBER;
    v_updated_count NUMBER := 0;
    v_category_name Categorys.Category_Name%TYPE;
    
    category_not_found EXCEPTION;
    invalid_price_increase EXCEPTION;
    PRAGMA EXCEPTION_INIT(category_not_found, -20001);
    PRAGMA EXCEPTION_INIT(invalid_price_increase, -20002);
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Price increase percentage: ' || p_price_increase_percent);

    IF p_price_increase_percent < -100 OR p_price_increase_percent > 100 THEN
        RAISE invalid_price_increase;
    END IF;
    
    BEGIN
        SELECT Category_Name INTO v_category_name
        FROM Categorys
        WHERE Category_Id = p_category_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE category_not_found;
    END;
    
    FOR product_rec IN product_cursor LOOP
        v_old_price := product_rec.Product_Price;
        
        DBMS_OUTPUT.PUT_LINE('Product: ' || product_rec.Product_Name);
        DBMS_OUTPUT.PUT_LINE('Old price: ' || v_old_price);
        DBMS_OUTPUT.PUT_LINE('Multiplier: ' || TO_CHAR((1 + p_price_increase_percent / 100), '9.99'));
        
        v_new_price := v_old_price * (1 + p_price_increase_percent / 100);
        
        DBMS_OUTPUT.PUT_LINE('New price before rounding: ' || TO_CHAR(v_new_price, '999.99'));
        
        v_new_price := ROUND(v_new_price, 2);
        
        DBMS_OUTPUT.PUT_LINE('New price after rounding: ' || v_new_price);
        
        UPDATE Products
        SET Product_Price = v_new_price
        WHERE CURRENT OF product_cursor;
        
        v_updated_count := v_updated_count + 1;
        
        DBMS_OUTPUT.PUT_LINE('Updated product: ' || product_rec.Product_Name || 
                             ', Old price: ' || v_old_price || 
                             ', New price: ' || v_new_price);
        DBMS_OUTPUT.PUT_LINE('--------------------');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Total updated products in category ' || v_category_name || ': ' || v_updated_count);
    
    COMMIT;
    
EXCEPTION
    WHEN category_not_found THEN
        RAISE_APPLICATION_ERROR(-20001, 'Category not found: ' || p_category_id);
    WHEN invalid_price_increase THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid price increase percentage. Please enter a value between -100 and 100.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END;
/
