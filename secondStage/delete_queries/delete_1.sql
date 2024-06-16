delete FROM Client
WHERE Client_Id IN (
    SELECT c.Client_Id
    FROM Client c
    LEFT JOIN Purchase_Client pc ON c.Client_Id = pc.Client_Id
    WHERE c.Is_Club_Member = 0 AND pc.Client_Id IS NULL
);
