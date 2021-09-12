SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500;

create or replace view myview(view_A, view_B, view_C) as
SELECT H.id , H.actual_word, I.preprocessed_word FROM History H, History@server I WHERE H.id = I.id;
@"C:\Users\samsu\OneDrive\Desktop\Project\Site\3.sql"