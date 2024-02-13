Predefined PL / SQL Exceptions An internal exception is raised implicitly whenever your PL / SQL program violates an Oracle rule
or exceeds a system - dependent
limit
.PL / SQL declares predefined exceptions globally in package STANDARD,
  which defines the PL / SQL environment.So,
  you need not declare them yourself
  and write handlers for predefined exceptions using the names in the following list: ACCESS_INTO_NULL Your program attempts to assign
values
  to the attributes of an uninitialized (atomically null) object.CASE_NOT_FOUND None of the choices in the
  WHEN clauses of a CASE
    statement is selected,
    and there is no
    ELSE clause.COLLECTION_IS_NULL Your program attempts to apply collection methods other than EXISTS to an uninitialized (atomically null) nested table
    or varray,
    or the program attempts to assign
    values
      to the elements of an uninitialized nested table
      or varray.CURSOR_ALREADY_OPEN Your program attempts to open an already open cursor.A cursor must be closed before it can be reopened.A cursor FOR loop automatically opens the cursor to which it refers.So,
      your program cannot open that cursor inside the loop.DUP_VAL_ON_INDEX Your program attempts to store duplicate
    values
      in a database column that is constrained by a unique index.INVALID_CURSOR Your program attempts an illegal cursor operation such as closing an unopened cursor.INVALID_NUMBER In a SQL statement,
      the conversion of a character string into a number fails because the string does not represent a valid number.(In procedural statements, VALUE_ERROR is raised.) This exception is also raised
      when the
    LIMIT
      - clause expression in a bulk FETCH statement does not evaluate to a positive number.LOGIN_DENIED Your program attempts to log on to Oracle with an invalid username
      and /
      or password.NO_DATA_FOUND A
    SELECT
      INTO statement returns no rows,
      or your program references a deleted element in a nested table
      or an uninitialized element in an index - by table.SQL aggregate functions such as AVG
      and SUM always return a value
      or a null.So,
      a
    SELECT
      INTO statement that calls an aggregate function never raises NO_DATA_FOUND.The FETCH statement is expected to return no rows eventually,
      so
      when that happens,
      no exception is raised.NOT_LOGGED_ON Your program issues a database call without being connected to Oracle.PROGRAM_ERROR PL / SQL has an internal problem.ROWTYPE_MISMATCH The host cursor variable
      and PL / SQL cursor variable involved in an assignment have incompatible return types.For example,
      when an open host cursor variable is passed to a stored subprogram,
      the return types of the actual
      and formal parameters must be compatible.SELF_IS_NULL Your program attempts to call a MEMBER method on a null instance.That is,
      the built - in parameter SELF (
        which is always the first parameter passed to a MEMBER method
      ) is null.STORAGE_ERROR PL / SQL runs out of memory
      or memory has been corrupted.SUBSCRIPT_BEYOND_COUNT Your program references a nested table
      or varray element using an index number larger than the number of elements in the collection.SUBSCRIPT_OUTSIDE_LIMIT Your program references a nested table
      or varray element using an index number (-1 for example) that is outside the legal range.SYS_INVALID_ROWID The conversion of a character string into a universal rowid fails because the character string does not represent a valid rowid.TIMEOUT_ON_RESOURCE A time - out occurs while Oracle is waiting for a resource.TOO_MANY_ROWS A
    SELECT
      INTO statement returns more than one row.VALUE_ERROR An arithmetic,
      conversion,
      truncation,
      or size - constraint error occurs.For example,
      when your program selects a column value into a character variable,
      if the value is longer than the declared length of the variable,
      PL / SQL aborts the assignment
      and raises VALUE_ERROR.In procedural statements,
      VALUE_ERROR is raised if the conversion of a character string into a number fails.(In SQL statements, INVALID_NUMBER is raised.) ZERO_DIVIDE Your program attempts to divide a number by zero.