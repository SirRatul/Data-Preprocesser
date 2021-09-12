SET VERIFY OFF;
SET SERVEROUTPUT ON;

BEGIN
	DBMS_OUTPUT.PUT_LINE(CHR(9)||CHR(9)||CHR(9)||'Data Preprocessor Admin Panel');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'1.View Site History');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'2.View Stopword List');
END;
/

accept x char prompt 'Enter choice:'

DECLARE
	Choice NUMBER;
	A NUMBER;
	B VARCHAR2(256);
	C VARCHAR2(256);
	ratul EXCEPTION;
BEGIN
	Choice := &x;
	IF Choice = 1 THEN
		FOR R IN (SELECT * FROM myview) LOOP
			A := R.view_A;
			B := R.view_B;
			C := R.view_C;
			DBMS_OUTPUT.PUT_LINE(A || ' ' || B  || ' ' || C);
		END LOOP;
	ELSIF Choice = 2 THEN
		FOR R IN (SELECT * FROM STOPWORD) LOOP
			A := R.id;
			B := R.word ;
			DBMS_OUTPUT.PUT_LINE(A || ' ' || B);
		END LOOP;
	ELSE
		RAISE ratul;
	END IF;
EXCEPTION
	WHEN ratul THEN
		DBMS_OUTPUT.PUT_LINE('You have select wrong Choice');
END;
/