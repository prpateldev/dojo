DECLARE -- This is single line comment
/*
 This is multiline comment
 */
-- You can declare variables here
begin -- This is execution space
end;

-- Simple block to execute is 
DECLARE num1 number := 1;

begin dbms_output.put_line('Patrent block variable num1: ' || num1);

-- Declare another child or nested block here
DECLARE num2 number := 2;

begin -- You can access parent block's variable in child block
dbms_output.put_line('Child block variable num1: ' || num1);

-- But the variables declared in the child block considered as local variables
-- and the scope of the varibale is limited to the child block
-- you can not access local variables in parent block
dbms_output.put_line('Child block variable num2: ' || num2);

end;

end;

-- If then elseif endif example
DECLARE total_amount number := 201;

discount number := 0;

begin if total_amount > 200 then discount := total_amount * 0.2;

elsif total_amount > 100 then discount := total_amount * 0.1;

else discount := total_amount * 0.05;

end if;

dbms_output.put_line('Discount offered is ' || discount);

end;

-- CASE
DECLARE total_amount number := 201;

discount number := 0;

begin case
  when total_amount > 200 then discount := total_amount * 0.2;

when total_amount > 100 then discount := total_amount * 0.1;

else discount := total_amount * 0.05;

end case
;

dbms_output.put_line('Discount offered is ' || discount);

end;

-- While Loop example
DECLARE counter number(2) := 20;

begin WHILE counter < 20 loop dbms_output.put_line('Counter is ' || counter);

counter := counter + 1;

end loop
end;

-- For Loop Example
Declare begin for counter in 10..20 loop dbms_output.put_line('Counter is ' || counter);

end loop -- reverse for loop
for counter in REVERSE 10..20 loop dbms_output.put_line('Counter is ' || counter);

end loop
end;

-- READING from database
DECLARE c_id number := 10;

c_name varchar(50);

c_country varchar(50);

begin
SELECT
  first_name,
  country INTO c_name,
  c_country
FROM
  customer
WHERE
  customer_id = c_id;

dbms.output.put_line('Customer name: ' || c_name);

dbms.output.put_line('Customer country: ' || c_country);

end;

-- What is %Type same type as defined for table.coulmn name will be given to var_name
DECLARE c_id customer.customer_id % type := 10;

c_name customer.first_name % type;

-- Same type as customer.first_name given to c_name
c_country customer.country % type;

-- Same type as customer.first_name given to c_name
begin
SELECT
  first_name,
  country INTO c_name,
  c_country
FROM
  customer
WHERE
  customer_id = c_id;

dbms.output.put_line('Customer name: ' || c_name);

dbms.output.put_line('Customer country: ' || c_country);

end;

-- Inserting row into table example using %Type
DECLARE S_DATE SALES.SALES_DATE % TYPE := TO_DATE('01-JAN-2016', 'DD-MON-YYYY');

S_ORDERID SALES.ORDER_ID % TYPE := 129512;

S_PRODUCTID SALES.PRODUCT_ID % TYPE := 200;

S_CUSTOMERID SALES.CUSTOMER_ID % TYPE := 12;

S_SALESPERSONID SALES.SALESPERSON_ID % TYPE := 1000;

S_QUANTITY SALES.QUANTITY % TYPE := 20;

S_UNITPRICE SALES.UNIT_PRICE % TYPE := 30;

S_SALESAMOUNT SALES.SALES_AMOUNT % TYPE := 600;

S_TAXAMOUNT SALES.TAX_AMOUNT % TYPE := 60;

S_TOTALAMOUNT SALES.TOTAL_AMOUNT % TYPE := 660;

BEGIN
INSERT INTO
  SALES(
    SALES_DATE,
    ORDER_ID,
    PRODUCT_ID,
    CUSTOMER_ID,
    SALESPERSON_ID,
    QUANTITY,
    UNIT_PRICE,
    SALES_AMOUNT,
    TAX_AMOUNT,
    TOTAL_AMOUNT
  )
VALUES
  (
    S_DATE,
    S_ORDERID,
    S_PRODUCTID,
    S_CUSTOMERID,
    S_SALESPERSONID,
    S_QUANTITY,
    S_UNITPRICE,
    S_SALESAMOUNT,
    S_TAXAMOUNT,
    S_TOTALAMOUNT
  );

COMMIT;

END;

-- Exceptions
DECLARE -- some declaration statements
BEGIN -- some execution statements
EXCEPTION
WHEN exception1 THEN -- exception execution statements
WHEN exception2 THEN -- exception execution statements
WHEN others THEN -- exception execution statements
END;

-- Exception examples
CREATE
OR REPLACE PROCEDURE FETCH_SALES (S_ORDERID NUMBER) AS L_DATE SALES.SALES_DATE % TYPE;

L_ORDERID SALES.ORDER_ID % TYPE;

L_PRODUCTID SALES.PRODUCT_ID % TYPE;

L_CUSTOMERID SALES.CUSTOMER_ID % TYPE;

L_SALESPERSONID SALES.SALESPERSON_ID % TYPE;

L_QUANTITY SALES.QUANTITY % TYPE;

L_UNITPRICE SALES.UNIT_PRICE % TYPE;

L_SALESAMOUNT SALES.SALES_AMOUNT % TYPE;

L_TAXAMOUNT SALES.TAX_AMOUNT % TYPE;

L_TOTALAMOUNT SALES.TOTAL_AMOUNT % TYPE;

BEGIN
SELECT
  SALES_DATE,
  ORDER_ID,
  PRODUCT_ID,
  CUSTOMER_ID,
  SALESPERSON_ID,
  QUANTITY,
  UNIT_PRICE,
  SALES_AMOUNT,
  TAX_AMOUNT,
  TOTAL_AMOUNT INTO L_DATE,
  L_ORDERID,
  L_PRODUCTID,
  L_CUSTOMERID,
  L_SALESPERSONID,
  L_QUANTITY,
  L_UNITPRICE,
  L_SALESAMOUNT,
  L_TAXAMOUNT,
  L_TOTALAMOUNT
FROM
  SALES
WHERE
  ORDER_ID = S_ORDERID;

DBMS_OUTPUT.PUT_LINE (L_DATE);

DBMS_OUTPUT.PUT_LINE (L_ORDERID);

DBMS_OUTPUT.PUT_LINE (L_PRODUCTID);

DBMS_OUTPUT.PUT_LINE (L_CUSTOMERID);

DBMS_OUTPUT.PUT_LINE (L_SALESPERSONID);

DBMS_OUTPUT.PUT_LINE (L_QUANTITY);

DBMS_OUTPUT.PUT_LINE (L_UNITPRICE);

DBMS_OUTPUT.PUT_LINE (L_SALESAMOUNT);

DBMS_OUTPUT.PUT_LINE (L_TAXAMOUNT);

DBMS_OUTPUT.PUT_LINE (L_TOTALAMOUNT);

EXCEPTION
WHEN no_data_found THEN dbms_output.put_line('No such Order!');

WHEN too_many_rows THEN dbms_output.put_line('You got more than 1 row!');

WHEN others THEN dbms_output.put_line('Error!');

END;

EXEC FETCH_SALES (1269);

-- Exception example 2
CREATE
OR REPLACE PROCEDURE FETCH_SALES (S_ORDERID IN NUMBER, L_TOTALROWS OUT NUMBER) AS L_DATE SALES.SALES_DATE % TYPE;

L_ORDERID SALES.ORDER_ID % TYPE;

L_PRODUCTID SALES.PRODUCT_ID % TYPE;

L_CUSTOMERID SALES.CUSTOMER_ID % TYPE;

L_SALESPERSONID SALES.SALESPERSON_ID % TYPE;

L_QUANTITY SALES.QUANTITY % TYPE;

L_UNITPRICE SALES.UNIT_PRICE % TYPE;

L_SALESAMOUNT SALES.SALES_AMOUNT % TYPE;

L_TAXAMOUNT SALES.TAX_AMOUNT % TYPE;

L_TOTALAMOUNT SALES.TOTAL_AMOUNT % TYPE;

BEGIN
SELECT
  SALES_DATE,
  ORDER_ID,
  PRODUCT_ID,
  CUSTOMER_ID,
  SALESPERSON_ID,
  QUANTITY,
  UNIT_PRICE,
  SALES_AMOUNT,
  TAX_AMOUNT,
  TOTAL_AMOUNT INTO L_DATE,
  L_ORDERID,
  L_PRODUCTID,
  L_CUSTOMERID,
  L_SALESPERSONID,
  L_QUANTITY,
  L_UNITPRICE,
  L_SALESAMOUNT,
  L_TAXAMOUNT,
  L_TOTALAMOUNT
FROM
  SALES
WHERE
  ORDER_ID = S_ORDERID;

DBMS_OUTPUT.PUT_LINE (L_DATE);

DBMS_OUTPUT.PUT_LINE (L_ORDERID);

DBMS_OUTPUT.PUT_LINE (L_PRODUCTID);

DBMS_OUTPUT.PUT_LINE (L_CUSTOMERID);

DBMS_OUTPUT.PUT_LINE (L_SALESPERSONID);

DBMS_OUTPUT.PUT_LINE (L_QUANTITY);

DBMS_OUTPUT.PUT_LINE (L_UNITPRICE);

DBMS_OUTPUT.PUT_LINE (L_SALESAMOUNT);

DBMS_OUTPUT.PUT_LINE (L_TAXAMOUNT);

DBMS_OUTPUT.PUT_LINE (L_TOTALAMOUNT);

SELECT
  COUNT(1) INTO L_TOTALROWS
FROM
  SALES
WHERE
  SALES_DATE = L_DATE;

EXCEPTION
WHEN no_data_found THEN dbms_output.put_line('No such Order!');

WHEN too_many_rows THEN dbms_output.put_line('You got more than 1 row!');

WHEN others THEN dbms_output.put_line('Error!');

END;

DECLARE TOTAL_ROWS NUMBER;

BEGIN FETCH_SALES (1269, TOTAL_ROWS);

DBMS_OUTPUT.PUT_LINE ('Total Number of rows: ' || TOTAL_ROWS);

END;

-- Exception example 3
CREATE
OR REPLACE FUNCTION MY_POWER (N1 IN NUMBER, N2 IN NUMBER) RETURN NUMBER AS POWER_VALUE NUMBER := 1;

BEGIN FOR LCNTR IN 1..N2 LOOP POWER_VALUE := POWER_VALUE * N1;

END LOOP;

RETURN POWER_VALUE;

EXCEPTION
WHEN others THEN dbms_output.put_line('Error!');

END;

SELECT
  MY_POWER(10, 3)
FROM
  DUAL;

-- Exception example 4
CREATE
OR REPLACE FUNCTION GET_COUNT (S_DATE DATE) RETURN NUMBER AS T_ROWS NUMBER;

BEGIN
SELECT
  COUNT(1) INTO T_ROWS
FROM
  SALES
WHERE
  SALES_DATE = S_DATE;

RETURN T_ROWS;

EXCEPTION
WHEN no_data_found THEN dbms_output.put_line('No orders for the given date!');

WHEN others THEN dbms_output.put_line('Error!');

END;

SELECT
  GET_COUNT (TO_DATE ('01-JAN-2015', 'DD-MON-YYYY'))
FROM
  DUAL -- Exception example II
  CREATE
  OR REPLACE FUNCTION MY_POWER (N1 IN NUMBER, N2 IN NUMBER) RETURN NUMBER AS POWER_VALUE NUMBER := 1;

EXCEP_ZERO EXCEPTION;

EXCEP_GREAT_100 EXCEPTION;

BEGIN IF (
  N1 IS NULL
  OR N1 = 0
  OR N2 IS NULL
  OR N2 = 0
) THEN RAISE EXCEP_ZERO;

END IF;

IF N1 > 100
OR N2 > 100 THEN RAISE EXCEP_GREAT_100;

END IF;

FOR LCNTR IN 1..N2 LOOP POWER_VALUE := POWER_VALUE * N1;

END LOOP;

RETURN POWER_VALUE;

EXCEPTION
WHEN EXCEP_ZERO THEN dbms_output.put_line('N1 or N2 is null or zero!');

RETURN 0;

WHEN EXCEP_GREAT_100 THEN dbms_output.put_line('N1 OR N2 is greater than 100!');

RETURN 0;

WHEN others THEN dbms_output.put_line('Error!');

END;