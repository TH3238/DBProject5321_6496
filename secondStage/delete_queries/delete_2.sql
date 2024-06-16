select * FROM Worker
WHERE Worker_Id IN (
    SELECT w.Worker_Id
    FROM Worker w
    LEFT JOIN Order_Worker ow ON w.Worker_Id = ow.Worker_Id
    LEFT JOIN Purchase_Worker pw ON w.Worker_Id = pw.Worker_Id
    WHERE ow.Worker_Id IS NULL AND pw.Worker_Id IS NULL
);

/*delete FROM Worker
WHERE Worker_Id IN (
    SELECT w.Worker_Id
    FROM Worker w
    LEFT JOIN Order_Worker ow ON w.Worker_Id = ow.Worker_Id
    LEFT JOIN Purchase_Worker pw ON w.Worker_Id = pw.Worker_Id
    WHERE ow.Worker_Id IS NULL AND pw.Worker_Id IS NULL
);/*
