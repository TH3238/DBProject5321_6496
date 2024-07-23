SELECT 
  Worker_Id,
  Worker_Name,
  Order_Id,
  Order_Date
FROM 
  ClientPurchaseWorkerOrder
WHERE 
  Worker_Id IS NOT NULL;
