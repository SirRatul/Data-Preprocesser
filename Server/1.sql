SET VERIFY OFF;
SET SERVEROUTPUT ON;

create or replace view myview(view_A, view_B, view_C) as
SELECT H.id , H.actual_word, I.preprocessed_word FROM History@site H, History I WHERE H.id = I.id;

@"C:\Users\Ratul\OneDrive\Desktop\Project\Server\2.sql"