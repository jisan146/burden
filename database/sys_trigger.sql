--------------------------------------------------------
--  File created - Wednesday-March-08-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger LOG_OFF_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYS"."LOG_OFF_TRIG" 
before logoff on DATABASE
begin

insert into admin.schlogin_1 values(user,'Log Out',sysdate);
delete from admin.schlogin_1 where lower(USERID)=lower('DBSNMP');
end;
/
ALTER TRIGGER "SYS"."LOG_OFF_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOG_ON_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYS"."LOG_ON_TRIG" 
after logon on DATABASE
begin

insert into admin.schlogin_1 values(user,'Login',sysdate);
delete from admin.schlogin_1 where lower(USERID)=lower('DBSNMP');
end;
/
ALTER TRIGGER "SYS"."LOG_ON_TRIG" ENABLE;
