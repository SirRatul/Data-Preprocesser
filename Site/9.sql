SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE preProcessProcedure(A IN OUT VARCHAR2) 
IS
	B VARCHAR2(256);
	C VARCHAR2(256);
	D VARCHAR2(256);
	E VARCHAR2(256);
	F VARCHAR2(256);
BEGIN
	mypack.lowercase(A);
	removeNumber(A, F);
	B := removePunctuation(F);
	C := removeExtraWhiteSpace(B);
	D := removeRepeatedWord(C);
	E := removeStopWord(D);
	A := E;
END preProcessProcedure;
/
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\10.sql"