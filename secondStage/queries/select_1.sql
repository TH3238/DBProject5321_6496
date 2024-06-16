SELECT c.Client_Name, COUNT(pc.Purchase_ID) AS Total_Purchase
FROM Client c
INNER JOIN Purchase_Client pc ON c.client_id=pc.client_id
WHERE c.is_club_member=1
GROUP BY c.client_name;
