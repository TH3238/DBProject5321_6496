SELECT 
    O.Order_Id, 
    O.Order_Date, 
    O.Dellivery_Date 
FROM 
    Orders O
JOIN 
    Purchase_Client PC ON O.Order_Id = PC.Purchase_Id
JOIN 
    Client C ON PC.Client_Id = C.Client_Id
WHERE 
    C.Client_Name = '&client_name';
