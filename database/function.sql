--------------------------------------------------------
--  File created - Tuesday-March-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."F1" 
(a  varchar2) return varchar2
is
b varchar2(30);
begin
select name into b from user_DEPENDENCIES where REFERENCED_NAME=upper(a) and type='VIEW';
return b;
end;

/
--------------------------------------------------------
--  DDL for Function F2
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."F2" 

(a varchar2,b varchar2) return varchar2 is
c varchar2(30);
d varchar2(30);
e varchar2(30);
f VARCHAR2(30);
begin
select column_id,table_name into c,d from all_tab_columns where owner = 'ADMIN' and table_name=upper(a) and COLUMN_NAME=upper(b);
select name into e  from user_DEPENDENCIES where REFERENCED_NAME=d and type='VIEW';
select column_name into f from all_tab_columns where owner = 'ADMIN' and table_name=e and column_id=c ;
return f;
end;

/
--------------------------------------------------------
--  DDL for Function F3
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."F3" 
(a  varchar2) return varchar2
is
b varchar2(30);
begin
select REFERENCED_NAME into b from user_DEPENDENCIES where name=(a);
return b;
end;

/
--------------------------------------------------------
--  DDL for Function F4
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMIN"."F4" 

(a varchar2,b varchar2) return varchar2 is
c varchar2(30);
d varchar2(30);
e varchar2(30);
f VARCHAR2(30);
begin
select column_id,table_name into c,d from all_tab_columns where owner = 'ADMIN' and table_name=upper(a) and COLUMN_NAME=upper(b);
select REFERENCED_NAME into e  from user_DEPENDENCIES where NAME=d and type='VIEW';
select column_name into f from all_tab_columns where owner = 'ADMIN' and table_name=e and column_id=c ;
return f;
end;

/
