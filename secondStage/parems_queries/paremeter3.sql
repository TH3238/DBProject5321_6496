SELECT 
    PR.Product_Id, 
    PR.Product_Name, 
    PR.Product_Price, 
    C.Category_Name 
FROM 
    Products PR
JOIN 
    Categorys C ON PR.Category_Id = C.Category_Id
WHERE 
    C.Category_Name IN ('&category1', '&category2', '&category3');
