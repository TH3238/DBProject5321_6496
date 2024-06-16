-- Adding the NOT NULL constraint
ALTER TABLE Client
MODIFY Is_Club_Member NUMERIC(1) NOT NULL;

-- Attempting to insert a record without Is_Club_Member (this should fail)
INSERT INTO Client (Client_Id, Client_Name)
VALUES (101, 'John Doe');

-- This will generate an error: ORA-01400: cannot insert NULL into ("schema"."CLIENT"."IS_CLUB_MEMBER")
