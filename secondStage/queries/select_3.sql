SELECT 
    w.Worker_Name,
    COUNT(ow.Order_Id) AS Orders_Handled
FROM 
    Worker w
JOIN 
    Order_Worker ow ON w.Worker_Id = ow.Worker_Id
GROUP BY 
    w.Worker_Name
HAVING 
    COUNT(ow.Order_Id) > (
        SELECT AVG(Order_Count)
        FROM (
            SELECT COUNT(Order_Id) AS Order_Count
            FROM Order_Worker
            GROUP BY Worker_Id
        ) 
    )
ORDER BY 
    Orders_Handled DESC;
