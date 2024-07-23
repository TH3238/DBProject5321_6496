CREATE VIEW ClientAtivityworker AS
SELECT 
  c.ClientId,
  c.ClientName,
  c.ClientLastName,
  a.ActionId,
  a.ActionName,
  a.ActionSum,
  a.ActionDate,
  w.WorkerId,
  w.WorkerName,
  w.WorkerRole
FROM 
  Client_bank c
JOIN 
  activity ac ON c.ClientId = ac.ClientId
JOIN 
  Actions a ON ac.ActionId = a.ActionId
JOIN 
  Worker_bank w ON ac.WorkerId = w.WorkerId

UNION ALL

SELECT 
  c.ClientId,
  c.ClientName,
  c.ClientLastName,
  a.ActionId,
  a.ActionName,
  a.ActionSum,
  a.ActionDate,
  NULL AS WorkerId,
  NULL AS WorkerName,
  NULL AS WorkerRole
FROM 
  Client_bank c
JOIN 
  activity ac ON c.ClientId = ac.ClientId
JOIN 
  Actions a ON ac.ActionId = a.ActionId
LEFT JOIN 
  Worker_bank w ON ac.WorkerId = w.WorkerId
WHERE 
  w.WorkerId IS NULL;
