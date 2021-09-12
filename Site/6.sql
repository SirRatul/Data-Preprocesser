SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION removeExtraWhiteSpace(A IN VARCHAR2) 
RETURN VARCHAR2
IS
	B VARCHAR2(256);
BEGIN
	SELECT REGEXP_REPLACE(A, '\s+', ' ') into B FROM dual;
	RETURN B;
END removeExtraWhiteSpace;
/
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\7.sql"