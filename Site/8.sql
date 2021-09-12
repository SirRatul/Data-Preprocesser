SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION removeStopWord(A IN VARCHAR2) 
RETURN VARCHAR2
IS
	B VARCHAR2(256);
	C VARCHAR2(256);
	D NUMBER;
	NUM int := 1;
BEGIN
	C := ' ';
	LOOP
		SELECT REGEXP_SUBSTR(A , '[^ ]+' , 1 , NUM) into B FROM dual;
		IF B IS NULL THEN 
			EXIT;
		END IF;
		SELECT COUNT(word) into D from STOPWORD@server where word = B;
		IF D = 0 THEN
			C := C || ' ' || B;
		END IF;
		NUM := NUM + 1;
	END LOOP;
	RETURN C;
END removeStopWord;
/
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\9.sql"