-- Adding the CHECK constraint
ALTER TABLE Products
ADD CONSTRAINT CHK_Quantity2 CHECK (Quantity >= 0);

-- Attempting to insert a product with Quantity = -1 (this should fail)
INSERT INTO Products (Product_Id, Product_Name, Quantity, Product_Price, Category_Id)
VALUES (101, 'Test Product',-1, 10, 1);
