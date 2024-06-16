-- Adding the DEFAULT constraint
ALTER TABLE Supplier
MODIFY Region VARCHAR(15) DEFAULT 'Unknown';

-- Inserting a supplier without specifying the Region (Region should default to 'Unknown')
INSERT INTO Supplier (Supplier_Id, Supplier_Name)
VALUES (226, 'ABC Suppliers');

-- Verifying the insertion
SELECT * FROM Supplier WHERE Supplier_Id = 226;
