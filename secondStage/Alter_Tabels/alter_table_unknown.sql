ALTER TABLE Supplier
MODIFY Region DEFAULT 'Unknown';

INSERT INTO Supplier (Supplier_Id, Supplier_Name)
VALUES (998, 'ABC Suppliers');
