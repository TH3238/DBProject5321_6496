CREATE VIEW ClientPurchaseWorkerOrder AS

-- Customer details and their purchases (including purchase and delivery dates)
SELECT 
  c.Client_Id,
  c.Client_Name,
  c.Is_Club_Member,
  p.Purchase_Id,
  p.Purchase_Date,
  p.Dellivery_Date,
  NULL AS Worker_Id,
  NULL AS Worker_Name,
  NULL AS Order_Id,
  NULL AS Order_Date
FROM 
  Client_s c
JOIN 
  Purchase_Client pc ON c.Client_Id = pc.Client_Id
JOIN 
  Purchase p ON pc.Purchase_Id = p.Purchase_Id

UNION ALL

--Details of employees and the orders they handled (including order dates)
SELECT 
  NULL AS Client_Id,
  NULL AS Client_Name,
  NULL AS Is_Club_Member,
  NULL AS Purchase_Id,
  NULL AS Purchase_Date,
  NULL AS Dellivery_Date,
  w.Worker_Id,
  w.Worker_Name,
  o.Order_Id,
  o.Order_Date
FROM 
  Worker_s w
JOIN 
  Order_Worker ow ON w.Worker_Id = ow.Worker_Id
JOIN 
  Orders o ON ow.Order_Id = o.Order_Id;
