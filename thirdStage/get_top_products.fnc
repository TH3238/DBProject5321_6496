CREATE OR REPLACE FUNCTION get_top_products(p_category_id IN NUMBER, p_limit IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_result SYS_REFCURSOR;
    v_category_name Categorys.Category_Name%TYPE;
BEGIN
    -- Get category name
    SELECT Category_Name INTO v_category_name
    FROM Categorys
    WHERE Category_Id = p_category_id;

    -- Open cursor for top products
    OPEN v_result FOR
        SELECT * FROM (
            SELECT p.Product_Name, p.Product_Price, 
                   COUNT(pp.Product_Id) AS Total_Sold
            FROM Products p
            JOIN Purchase_Product pp ON p.Product_Id = pp.Product_Id
            JOIN Purchase pu ON pp.Purchase_Id = pu.Purchase_Id
            WHERE p.Category_Id = p_category_id
            GROUP BY p.Product_Name, p.Product_Price
            ORDER BY COUNT(pp.Product_Id) DESC
        )
        WHERE ROWNUM <= p_limit;

    -- Log the operation (commented out as the table doesn't exist)
    -- INSERT INTO Operation_Log (Operation_Type, Description)
    -- VALUES ('Get Top Products', 'Retrieved top ' || p_limit || ' products for category: ' || v_category_name);

    RETURN v_result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No category found with ID: ' || p_category_id);
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN NULL;
END;
/
