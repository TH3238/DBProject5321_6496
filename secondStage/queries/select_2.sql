SELECT 
    C.Category_Name,
    AVG(PR.Product_Price) AS Average_Price
FROM 
    Categorys C
JOIN 
    Products PR ON C.Category_Id = PR.Category_Id
GROUP BY 
    C.Category_Name
ORDER BY 
    Average_Price DESC;






