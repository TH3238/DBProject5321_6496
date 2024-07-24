CREATE VIEW ClientActivityworker AS

--Information about customers, actions and employees who performed actions.
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
  Client c
JOIN 
  activity ac ON c.ClientId = ac.ClientId
JOIN 
  Actions a ON ac.ActionId = a.ActionId
JOIN 
  Worker w ON ac.WorkerId = w.WorkerId;

UNION ALL

--Information about employees who did not perform actions.
SELECT 
  NULL AS ClientId,
  NULL AS ClientName,
  NULL AS ClientLastName,
  NULL AS ActionId,
  NULL AS ActionName,
  NULL AS ActionSum,
  NULL AS ActionDate,
  w.WorkerId,
  w.WorkerName,
  w.WorkerRole
FROM 
  Worker w
WHERE 
  w.WorkerId NOT IN (SELECT DISTINCT WorkerId FROM activity);
