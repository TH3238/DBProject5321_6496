SELECT 
  Client_Id,
  Client_Name,
  Is_Club_Member,
  Purchase_Id,
  Purchase_Date,
  Dellivery_Date
FROM 
  ClientPurchaseWorkerOrder
WHERE 
  Client_Id IS NOT NULL;
