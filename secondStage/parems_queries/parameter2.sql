SELECT 
    W.Worker_Id, 
    W.Worker_Name, 
    W.Start_of_Work_date 
FROM 
    Worker W
WHERE 
    W.Start_of_Work_date >= TO_DATE('&start_date', 'dd/mm/yyyy')
    AND W.Start_of_Work_date <= TO_DATE('&end_date', 'dd/mm/yyyy');
