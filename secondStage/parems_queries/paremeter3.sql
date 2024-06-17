SELECT
  C.client_id,
  C.client_name,
  C.is_club_member
FROM 
  client C
WHERE 
  C.Client_Id=&<name="clientID" hint="client id value between 0-999">;
