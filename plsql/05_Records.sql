-- A record is a composite data type that can hold more than one value
-- instead of reading each column you can read whole row in one record
CREATE
OR REPLACE PROCEDURE process_customer (c_id IN customer.customer_id % TYPE) IS c_rec customer % rowtype;

c_rec2 customer % rowtype;

begin
SELECT
  * INTO c_rec
FROM
  customer
WHERE
  customer_id = c_id;

--  copy all values into another record
c_rec2 := c_rec;

-- you can change the value of a column
c_rec.first_name := 'Some thing else';

DBMS_OUTPUT.PUT_LINE ('First Name ' || c_rec.first_name);

DBMS_OUTPUT.PUT_LINE ('Last Name ' || c_rec.last_name);

DBMS_OUTPUT.PUT_LINE ('First Name ' || c_rec2.first_name);

DBMS_OUTPUT.PUT_LINE ('Last Name ' || c_rec2.last_name);

end;

-- Inster using record %ROWTYPE
CREATE
OR REPLACE PROCEDURE insert_customer (c_rec IN customer % ROWTYPE) IS
begin
INSERT INTO
  customer
VALUES
  c_rec;

COMMIT;

end;

-- Update row using record %ROWTYPE
CREATE
OR REPLACE PROCEDURE insert_customer (c_rec IN customer % ROWTYPE) IS
begin
-- UPDATE
INSERT INTO
  customer
VALUES
  c_rec;

COMMIT;

end;