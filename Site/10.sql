SET VERIFY OFF;
SET SERVEROUTPUT ON;

BEGIN
	DBMS_OUTPUT.PUT_LINE(CHR(9)||CHR(9)||'Data Preprocessor');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'1.Preprocess Raw Data');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'2.Text Lowercase');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'3.Numbers Remover');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'4.Duplicate Word Remover');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'5.Punctuation Remover');
	DBMS_OUTPUT.PUT_LINE(CHR(9)||'6.Stop Word Remover');
END;
/

accept x char prompt 'Enter choice:'
accept y char prompt 'Enter String:'

DECLARE
	Choice NUMBER;
	A VARCHAR2(256);
	String VARCHAR2(256);
	HistoryTableId int;
	ratul EXCEPTION;
BEGIN
	SELECT COUNT(id) into HistoryTableId FROM History;
	HistoryTableId := HistoryTableId + 1;
	Choice := &x;
	A := '&y';
	IF Choice = 1 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		preProcessProcedure(A);
		String := A;
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSIF Choice = 2 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		mypack.lowercase(A);
		String := A;
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSIF Choice = 3 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		removeNumber(A, String);
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSIF Choice = 4 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		String := removeRepeatedWord(A);
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSIF Choice = 5 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		String := removePunctuation(A);
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSIF Choice = 6 THEN
		INSERT INTO History(id, actual_word) VALUES (HistoryTableId, A);
		String := removeStopWord(A);
		INSERT INTO History@server(id, preprocessed_word) VALUES(HistoryTableId, String);
		COMMIT;
	ELSE
		RAISE ratul;
	END IF;
	DBMS_OUTPUT.PUT_LINE('After Processing');
	DBMS_OUTPUT.PUT_LINE(String);
EXCEPTION
	WHEN ratul THEN
		DBMS_OUTPUT.PUT_LINE('You have select wrong Choice');
END;
/

accept z char prompt 'Do you want to check your previous history? If yes then press 1 otherwise press anything.'
DECLARE
	Choice NUMBER;
	A NUMBER;
	B VARCHAR2(256);
	C VARCHAR2(256);
BEGIN
	Choice := &z;
	IF Choice = 1 THEN
		FOR R IN (SELECT * FROM myview) LOOP
			A := R.view_A;
			B := R.view_B;
			C := R.view_C;
			DBMS_OUTPUT.PUT_LINE(A || ' ' || B  || ' ' || C);
		END LOOP;
	ELSE
		DBMS_OUTPUT.PUT_LINE('You have select wrong choice.');
	END IF;
END;
/