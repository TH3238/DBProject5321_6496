select *
from Orders
WHERE Order_Id IN (
    SELECT os.Order_Id
    FROM Order_Supplier os
    JOIN Supplier s ON os.Supplier_Id = s.Supplier_Id
    WHERE s.Region = 'Boucherville'
);
