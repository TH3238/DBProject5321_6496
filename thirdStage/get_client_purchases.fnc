CREATE OR REPLACE FUNCTION get_client_purchases(p_client_id IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_result SYS_REFCURSOR;
    v_purchase_count NUMBER := 0;
    v_total_amount NUMBER := 0;
    v_client_name VARCHAR2(100);
    v_is_club_member NUMBER(1);
    v_high_value_purchases VARCHAR2(4000) := '';
    
    -- Custom exception
    client_not_found EXCEPTION;
    PRAGMA EXCEPTION_INIT(client_not_found, -20001);
    
    CURSOR c_purchases IS
        SELECT DISTINCT pc.Purchase_Id, SUM(p.Product_Price) as Total_Price
        FROM Purchase_Client pc
        JOIN Purchase_Product pp ON pc.Purchase_Id = pp.Purchase_Id
        JOIN Products p ON pp.Product_Id = p.Product_Id
        WHERE pc.Client_Id = p_client_id
        GROUP BY pc.Purchase_Id;
        
BEGIN
    -- Check if client exists and get client info
    BEGIN
        SELECT Client_Name, Is_Club_Member
        INTO v_client_name, v_is_club_member
        FROM Client
        WHERE Client_Id = p_client_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE client_not_found;
    END;
    
    -- Debug print: Display client info
    DBMS_OUTPUT.PUT_LINE('Debug Info - Collected Data:');
    DBMS_OUTPUT.PUT_LINE('Client ID: ' || p_client_id);
    DBMS_OUTPUT.PUT_LINE('Client Name: ' || v_client_name);
    DBMS_OUTPUT.PUT_LINE('Is Club Member: ' || CASE WHEN v_is_club_member = 1 THEN 'Yes' ELSE 'No' END);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Purchases:');
    
    -- Loop through purchases
    FOR purchase IN c_purchases LOOP
        v_purchase_count := v_purchase_count + 1;
        v_total_amount := v_total_amount + purchase.Total_Price;
        
        -- Print purchase info
        DBMS_OUTPUT.PUT_LINE('Purchase ID: ' || purchase.Purchase_Id || ', Price: ' || purchase.Total_Price);
        
        -- DML operation: Update purchase with a comment
        UPDATE Purchase
        SET Purchase_Date = Purchase_Date  -- This is a dummy update to demonstrate DML
        WHERE Purchase_Id = purchase.Purchase_Id;
        
        -- Conditional logic
        IF purchase.Total_Price > 1000 THEN
            v_high_value_purchases := v_high_value_purchases || purchase.Purchase_Id || ', ';
        END IF;
    END LOOP;
    
    
    -- Prepare result
    OPEN v_result FOR
        SELECT 
            v_client_name AS Client_Name,
            v_purchase_count AS Purchase_Count,
            v_total_amount AS Total_Amount,
            CASE 
                WHEN v_is_club_member = 1 THEN 'Yes'
                ELSE 'No'
            END AS Is_Club_Member
        FROM DUAL;
    
    -- Debug print: Display summary
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    DBMS_OUTPUT.PUT_LINE('Summary:');
    DBMS_OUTPUT.PUT_LINE('Purchase Count: ' || v_purchase_count);
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || v_total_amount);
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
    
    RETURN v_result;
    
EXCEPTION
    WHEN client_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: No client found with ID: ' || p_client_id);
        RAISE_APPLICATION_ERROR(-20001, 'No client found with ID: ' || p_client_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
