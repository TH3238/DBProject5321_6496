SELECT 
  ClientId,
  ClientName,
  ClientLastName,
  ActionId,
  ActionName,
  ActionSum,
  ActionDate
FROM 
  ClientAtivityworker
WHERE 
  WorkerId IS NULL;
