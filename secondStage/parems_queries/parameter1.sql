SELECT 
    O.Order_Id, 
    O.Order_Date, 
    O.Dellivery_Date, 
    C.Client_Name 
FROM 
    Orders O
JOIN 
    Purchase_Client PC ON O.Order_Id = PC.Purchase_Id
JOIN 
    Client C ON PC.Client_Id = C.Client_Id
WHERE 
    O.Order_Date >= TO_DATE('&order_date', 'dd/mm/yyyy');
