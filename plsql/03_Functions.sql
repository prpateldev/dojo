-- Function syntax
CREATE
OR REPLACE FUNCTION MY_POWER (N1 IN NUMBER, N2 IN NUMBER) RETURN NUMBER AS POWER_VALUE NUMBER := 1;

BEGIN FOR LCNTR IN 1..N2 LOOP POWER_VALUE := POWER_VALUE * N1;

END LOOP;

RETURN POWER_VALUE;

END;

SELECT
  MY_POWER(10, 3)
FROM
  DUAL;

-- Function declaration example
CREATE
OR REPLACE FUNCTION find_salescount (p_sales_date IN DATE) RETURN number AS number_of_sales number := 0;

BEGIN
SELECT
  COUNT(*) INTO number_of_sales
FROM
  sales
WHERE
  sales_date = p_sales_date;

RETURN number_of_sales;

END find_salescount;

-- to call above function as statement
SELECT
  find_salescount(TO_DATE('01-jan-2024', 'dd-mon-yyyy'))
from
  dual;

DECLARE count number := 0;

BEGIN count := find_salescount(TO_DATE('01-jan-2024', 'dd-mon-yyyy'));

DBMS_OUTPUT.PUT_LINE('COUNT IS ' || count);

END;