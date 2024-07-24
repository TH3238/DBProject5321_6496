SELECT 
  WorkerId,
  WorkerName,
  WorkerRole
FROM 
  ClientActivityworker
WHERE 
  ClientId IS NULL;
