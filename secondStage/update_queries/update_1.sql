--UPDATE Products
select * from Products
--SET Product_Price = Product_Price * 1.10
WHERE Category_Id = (
    SELECT Category_Id
    FROM Categorys
    WHERE Category_Name = 'irure ipsum do.'
);
