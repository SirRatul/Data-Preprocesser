SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION removePunctuation(A IN VARCHAR2) 
RETURN VARCHAR2
IS
	B VARCHAR2(256);
BEGIN
	SELECT REGEXP_REPLACE(REGEXP_REPLACE(A, '[(][A-Z]+[)]', ''), '[^a-zA-Z ]', NULL) into B FROM dual;
	RETURN B;
END removePunctuation;
/
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\6.sql"