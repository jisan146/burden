--------------------------------------------------------
--  File created - Tuesday-March-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger BUS_PASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMIN"."BUS_PASS" after update on x_bus_status
for each row
begin
X_PASS(:old.id);

end;
/
ALTER TRIGGER "ADMIN"."BUS_PASS" DISABLE;
--------------------------------------------------------
--  DDL for Trigger EXECUTE_WILL_NOTICE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMIN"."EXECUTE_WILL_NOTICE" after update of dead on people
for each row
begin



if(:new.dead is null)then
update tab_user set type='lock' where user_id=:old.id;
else
update notice set exedate=sysdate where noticeby=:old.id and exedate is null;
update tab_user set type='dead' where user_id=:old.id;
end if;
end;
/
ALTER TRIGGER "ADMIN"."EXECUTE_WILL_NOTICE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MAINTAIN_TIME_SCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMIN"."MAINTAIN_TIME_SCHEDULE" after insert or delete or update on x_time_schedule_c
for each row
begin
if inserting then
update X_BUS_INFROMATION set license='c' where LICENSE_NO=:new.bus_license_no;
elsif deleting then
update X_BUS_INFROMATION set license='c' where LICENSE_NO=:old.bus_license_no;
x_cancel_ticket(:old.bus_license_no);

else
update X_BUS_INFROMATION set license='c' where LICENSE_NO=:old.bus_license_no;
x_cancel_ticket(:old.bus_license_no);
end if;
end;
/
ALTER TRIGGER "ADMIN"."MAINTAIN_TIME_SCHEDULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_CODE_GENERATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMIN"."UPDATE_CODE_GENERATE" before insert on updatecode
      for each row
    begin
      select code.nextval,upper(:new.columnname),upper(:new.tablename),upper(:new.using)
        into :new.code,:new.columnname,:new.tablename,:new.using
        from dual;
    end;
/
ALTER TRIGGER "ADMIN"."UPDATE_CODE_GENERATE" ENABLE;
