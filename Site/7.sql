SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION removeRepeatedWord(A IN VARCHAR2) 
RETURN VARCHAR2
IS
	TYPE wordsarray IS TABLE OF NUMBER INDEX BY VARCHAR2(255); 
	words wordsarray;
	B VARCHAR2(256);
	C VARCHAR2(256);
	temp VARCHAR2(256);
	NUM int := 1;
BEGIN
	C := ' ';
	LOOP
		SELECT REGEXP_SUBSTR(A , '[^ ]+' , 1 , NUM) into B FROM dual;
		temp := words.FIRST; 
		IF temp IS null THEN
			C := C || ' ' || B;
			words(B) := 1;
		ELSE
			WHILE temp IS NOT null LOOP
				IF temp = B THEN
					EXIT;
				END IF;
				temp := words.NEXT(temp); 
				IF temp IS null THEN
					IF B IS NOT null THEN	
						C := C || ' ' || B;
						words(B) := 1;
					END IF;
				END IF;
			END LOOP;
		END IF;
		IF B IS NULL THEN 
			EXIT;
		END IF;
		NUM := NUM + 1;
	END LOOP;
	RETURN C;
END removeRepeatedWord;
/
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\8.sql"