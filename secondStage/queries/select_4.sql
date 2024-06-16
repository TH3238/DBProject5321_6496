SELECT w.Worker_Name, COUNT(ow.Order_Id) AS Assigned_Order_Count
FROM Worker w
LEFT JOIN Order_Worker ow ON w.Worker_Id = ow.Worker_Id
GROUP BY w.Worker_Name
