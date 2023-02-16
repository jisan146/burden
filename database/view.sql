--------------------------------------------------------
--  File created - Tuesday-March-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View ALL_COLUMNS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."ALL_COLUMNS" ("TABLE_NAME", "COLUMN_NAME") AS 
  select table_name,column_name from all_tab_columns
where owner = 'ADMIN' and table_name  in (select view_name from all_views where owner = 'ADMIN')
and table_name!='ALL_TABLES' and table_name!='ALL_COLUMNS' and lower(table_name)!='all_procedures'
and table_name!='USER_SOURCES'
order by table_name WITH READ ONLY;
--------------------------------------------------------
--  DDL for View ALL_PROCEDURES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."ALL_PROCEDURES" ("OBJECT_NAME") AS 
  select 
case lower(synonym_name) when 't1' then  'T_EXECUTE_WILL_NOTICE'
when 't2' then 'T_MAINTAIN_TIME_SCHEDULE'
when 't3' then 'T_UPDATE_CODE_GENERATE'
when 't4' then 'T_DB_USER_LOG_ON'
when 't5' then 'T_DB_USER_LOG_OFF'
else synonym_name end
object_name 
from user_synonyms order by 1 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View ALL_TABLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."ALL_TABLES" ("TABLE_NAME") AS 
  select VIEW_NAME as table_name from user_views where 
VIEW_NAME!='ALL_TABLES' and VIEW_NAME!='ALL_COLUMNS' and VIEW_NAME!='USER_SOURCES'
and lower(view_name)!='all_procedures' order by table_name;
--------------------------------------------------------
--  DDL for View AMBASSADOR_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."AMBASSADOR_DETAILS" ("ID", "COUNTRY", "ADDRESS", "CONTACT_NUMBER", "INSERT_BY", "INSERT_DATE") AS 
  select 
cast(id as number) id ,country,cast(address as varchar2(100))address,CAST(phone as number) Contact_number,cast(insertby as number) insert_by,insertdate insert_date
from ambassador WITH READ ONLY;
--------------------------------------------------------
--  DDL for View APPLICATION_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."APPLICATION_USER" ("ID", "ACCOUNT_TYPE", "CREATE_BY", "CREATE_DATE", "PASSWORD", "SYSTEM_CONTACT_NUMBER", "FOREIGNER") AS 
  select 

cast(user_id as number) id,

cast(type as varchar2(10))account_type,
cast(create_by as number)create_by,
create_date,
password,
cast(temp_email as number) system_contact_number,
case lower(foreigner) when 'y' then 'YES'else 'No' end Foreigner


from tab_user order by id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View APPLICATION_USER_LOG_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."APPLICATION_USER_LOG_HISTORY" ("USER_ID", "ACTION", "LOG_DATE") AS 
  select 
cast(USERID as number) user_id,
cast(ACTION as varchar2(250))ACTION ,
LOG_DATE 
from schlogin WITH READ ONLY;
--------------------------------------------------------
--  DDL for View APPOINT_STUFF_FOR_BUS_OWNER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."APPOINT_STUFF_FOR_BUS_OWNER" ("BUS_OWNER", "STUFF_ID", "JOIN_DATE", "RESIGN_DATE", "STUFF_TYPE") AS 
  SELECT 
cast(bus_owner as number) bus_owner,
cast(stuff_id as number) stuff_id,
join_date,
resign_date,
type stuff_type
FROM x_appoint WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BALANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BALANCE" ("ID", "TK") AS 
  SELECT 
 cast(id as number)id,tk   
FROM
x_balance WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BALANCE_TRANSFER_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BALANCE_TRANSFER_HISTORY" ("SENDER", "RECEIVER", "TK", "TRANSFER_DATE") AS 
  SELECT 
   cast(sender as number) sender,
   cast(receiver as number) receiver,
   tk,
   transfer_date
FROM
x_bal_his WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BANK_ACCOUNT_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BANK_ACCOUNT_INFORMATION" ("ID", "ACCOUNT_NO", "BANK_NAME", "REFERENCES", "NOMINY", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  select 
cast(id as number) id ,
cast(account_no as varchar2(30)) account_no,
cast(bank_name as varchar2(30)) bank_name,
cast(REFERENCES as number)REFERENCES,
cast(NOMINY as number)NOMINY,
cast(add_by as number) insert_by,
adate as insert_date,
sno s_no from bank WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BUS_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BUS_INFORMATION" ("OWNER_ID", "LICENSE_STATUS", "LICENSE_NO", "SERVICE_NAME", "SERVICE_TYPE", "RENT", "TOTAL_SIT", "TOTAL_STAND", "FITNESS", "TAX", "INSERT_BY", "INSERT_DATE") AS 
  SELECT 
    cast(owner_id as number) owner_id,
    case lower(license) when 'c' then 'Cancel' when 
   'a' then 'OK' end license_status,
    license_no,
   
    server_name service_name,
    service_type,
    rent,
    total_sit,
    total_stand,
    case lower(fitness) when 'c' then 'Cancel' when 'y'
    then 'OK' end fitness,
    cast(tax as varchar2(4)) tax,
    cast(insert_by as number)insert_by,
    insert_date
FROM 
x_bus_infromation WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BUS_STAND_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BUS_STAND_INFORMATION" ("STOP_POINT", "LOCATION_NAME", "ROAD_NO", "ROAD_NAME", "LATITUDE_1", "LONGITUDE_1", "LATITUDE_2", "LONGITUDE_2", "INSERT_BY", "INSERT_DATE") AS 
  SELECT 
 stop_point,
 location_name,
 road_no,
 road_name,
 l1 latitude_1,
 l2 longitude_1,
 l3 latitude_2,
 l4 longitude_2,
 cast(insert_by as number) insert_by
 ,ins_date insert_date
FROM 
x_stop_office WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BUS_STATUS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BUS_STATUS" ("LICENSE_NO", "LATITUDE", "LONGITUDE", "DESCRIPTION") AS 
  SELECT 
 cast (id as varchar2(50)) license_no,cast(substr(LATITUDE,14)as number)latitude ,cast(substr(LONGITUDE,13)as number)longitude,cast(description as varchar2(50))description  
FROM 
x_bus_status WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BUS_STUFF
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BUS_STUFF" ("BUS_LICENSE_NO", "STUFF_ID", "START_DUTY_TIME", "END_DUTY_TIME") AS 
  SELECT 
 cast (bus_license_no as varchar2(50))bus_license_no,
 cast(stuff_id as number)stuff_id , stime start_duty_time,etime end_duty_time   
FROM 
x_bus_stuff WITH READ ONLY;
--------------------------------------------------------
--  DDL for View BUS_TIME_SCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."BUS_TIME_SCHEDULE" ("S_NO", "BUS_LICENSE_NO", "BUS_STOP_POINT", "TIME", "PASS") AS 
  SELECT 
s_no,
 cast(bus_license_no as varchar2(50))bus_license_no,
 bus_stop_point,

 time,
 pass 
FROM 
x_time_schedule_c WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CANDIDATE_REPUTATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CANDIDATE_REPUTATION" ("ID", "GOOD_RANKING", "BAD_RANKING", "WIN_TIME", "TOTAL_PARTICIPATION", "COUNT_TOTAL_VOTE") AS 
  select 
cast(id as number) id,
good good_ranking,
bad bad_ranking,
win win_time,
TOTAL total_Participation,

countvote Count_total_vote

from reputation WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CITIZENS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CITIZENS" ("ID", "NAME_ENGLISH", "NAME_BANGLA", "GENDER", "FATHER_ID", "MOTHER_ID", "DOB", "DEAD", "BLOOD_GROUP") AS 
  select 
cast(id as number) id,
cast(name_eng as varchar2(40))name_english,
cast(NAME_BAN as varchar2(100))NAME_BANgla,
case lower(gender) when 'm' then 'MALE' when 'f'then 'FEMALE' else 'OTHER' end gender,
cast(father as number) Father_id, 
cast(MOTHER as number) MOTHER_id, 
dob,
dead,
cast(blood_group as varchar2(3))as blood_group


from people WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CODE_EXTRA_UPDATE_PRV_TO_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CODE_EXTRA_UPDATE_PRV_TO_USER" ("ID", "CODE") AS 
  select cast(ID as number) id,"CODE" from update_p_extra WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CODE_FOR_UPDATE_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CODE_FOR_UPDATE_INFORMATION" ("CODE", "COLUMN_NAME", "TABLE_NAME", "INSERT_DATE", "STATIC", "SEARCH_BY") AS 
  select 
code,cast(f2(TABLENAME,COLUMNNAME)as varchar2(30)) column_name,
cast(f1(TABLENAME) as varchar2(30)) TABLE_NAME,
idate insert_date,

case lower(static) when 'y' then 'YES' when 'n' then 'NO' end static,
cast(f2(TABLENAME,using)as varchar2(30)) search_by
from updatecode WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CODE_PRV_GRANT_FOR_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CODE_PRV_GRANT_FOR_USER" ("ID", "ROLE_NAME") AS 
  select cast(ID as number) id,"ROLE_NAME" from UPDATE_P_ROLE_FOR_USER WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CODE_PRV_ROLE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CODE_PRV_ROLE" ("ROLE_NAME", "CODE") AS 
  select "ROLE_NAME","CODE" from update_p_role WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CONTACTS_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CONTACTS_INFORMATION" ("ID", "CONTACT_NUMBER", "REFERENCE", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  select 
cast(id as number) id ,
cast(PHONE_NUMBER as number) contact_number,
cast(REFER as number )reference,
cast(ADD_BY as number) insert_by,
adate insert_date
,sno s_no from contacts WITH READ ONLY;
--------------------------------------------------------
--  DDL for View COUNT_CANDIDATE_REPUTAION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."COUNT_CANDIDATE_REPUTAION" ("VOTER_ID", "CANDIDATE_ID") AS 
  select 
  cast(id as number) voter_id ,cast(cid as number) candidate_id
from drep with read only;
--------------------------------------------------------
--  DDL for View COUNTER_STUFF
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."COUNTER_STUFF" ("STOP_POINT", "STUFF_ID", "START_DUTY_TIME", "END_DUTY_TIME") AS 
  SELECT 
location_id stop_point,cast(stuff_id as number)stuff_id,stime start_duty_time,etime end_duty_time 
FROM 
x_counter_stuff WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CRIMINAL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CRIMINAL" ("ID", "CRIME", "DETAILS", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  select 

cast(id as number) id ,
crime,
details,
cast(ADD_BY as number) insert_by, 
adate insert_date,
sno s_no
from crminal WITH READ ONLY;
--------------------------------------------------------
--  DDL for View CURRENT_ADDRESS_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."CURRENT_ADDRESS_DETAILS" ("ID", "ADDRESS", "INSERT_BY", "INSERT_DATE") AS 
  select 
  cast(id as number) id ,cast(address as varchar2(100)) address, cast(ADD_BY as number) insert_by, add_date insert_date
from current_address WITH READ ONLY;
--------------------------------------------------------
--  DDL for View DATABASE_USER_LOG_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."DATABASE_USER_LOG_HISTORY" ("USER_ID", "ACTION", "LOG_DATE") AS 
  select 
USERID user_id,
cast(ACTION as varchar2(10))ACTION ,
LOG_DATE 
from schlogin_1 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View DELETED_DATA
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."DELETED_DATA" ("DATA", "USER_ID", "PERFORM_DATE") AS 
  select "DATA",user_id,p_date perform_date from delete_his WITH READ ONLY;
--------------------------------------------------------
--  DDL for View DISABLE_PEOPLE_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."DISABLE_PEOPLE_INFORMATION" ("ID", "DETAILS", "INSERT_BY", "INSERT_DATE") AS 
  select 
  cast(user_id as number) id ,details, cast(ADD_BY as number) insert_by, a_date insert_date
from disable_people with read only;
--------------------------------------------------------
--  DDL for View DUE_VOTER_VOTE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."DUE_VOTER_VOTE" ("VOTER_ID", "POST") AS 
  select 
  cast(id as number) voter_id ,post
from duevote with read only;
--------------------------------------------------------
--  DDL for View EDUCATION_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."EDUCATION_DETAILS" ("ID", "DETAILS", "INSTITUTE_CODE", "EDUCATION_LEVEL", "INSERT_DATE", "INSRT_BY", "GRADUATE", "S_NO") AS 
  select
cast(id as number) id ,
cast(details as varchar2(150)) details ,
academic_code as institute_code,
lev  education_level,
add_date insert_date,
cast(add_by as number) as insrt_by,
case lower(GRADUATE ) when 'y' then 'YES' else 'No' end GRADUATE  ,
sno s_no
from education WITH READ ONLY;
--------------------------------------------------------
--  DDL for View ELECTION_CANDIDATE_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."ELECTION_CANDIDATE_DETAILS" ("ID", "SYMBOL_NAME", "SYMBOL_IMAGE", "POST", "ZONE", "SELECTED", "INSERT_BY", "INSERT_DATE") AS 
  select 
cast(user_id as number) id,
cast(SYMBOL_NAME as varchar2(10))SYMBOL_NAME,
symbol_image ,
cast(post as varchar2(15)) post,
zone,
case lower(current_) when 'y' then 'yes' else 'No' end selected  ,



cast(insert_by as number)insert_by,
idate insert_date
from election_candidate WITH READ ONLY;
--------------------------------------------------------
--  DDL for View FINGER_PRINT_USED_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."FINGER_PRINT_USED_HISTORY" ("ID", "USED_BY", "LINK", "USED_DATE") AS 
  select 

cast(PEOPLE_ID as number) id,
cast(user_id as number)used_by,
cast(page as varchar2(25))link,

sdate used_date

from SEARCH_FINGER WITH READ ONLY;
--------------------------------------------------------
--  DDL for View FOREIGNER_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."FOREIGNER_DETAILS" ("ID", "NAME", "PASSPORT_NO", "COUNTRY", "CONTACT_NUMBER", "BLOOD_GROUP") AS 
  select 
cast(ID as number) id,
name ,
cast(PASSPORT  as varchar2(25)) PASSPORT_no ,
COUNTRY ,
cast(CONTACT as number) contact_number,
cast(BLOOD_GROUP as varchar2(3)) blood_group


from FOREIGNER WITH READ ONLY;
--------------------------------------------------------
--  DDL for View LINK_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."LINK_DETAILS" ("ID", "LINK", "ALIAS", "INSERT_DATE") AS 
  select 
cast(id as number) id,cast(link as varchar2(100)) link,cast(alias as varchar2(30))alias ,a_date insert_date
from link order by id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View LINK_EXTRA_GRANTED_FOR_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."LINK_EXTRA_GRANTED_FOR_USER" ("ID", "LINK_ID") AS 
  select 
cast(id as number) id,
cast(l_id as number) link_id

from g_liink WITH READ ONLY;
--------------------------------------------------------
--  DDL for View LINK_ROLE_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."LINK_ROLE_DETAILS" ("ROLE_NAME", "LINK_ID") AS 
  select 
name role_name,
cast(LINKID as number) link_id

from role order by link_id WITH READ ONLY;
--------------------------------------------------------
--  DDL for View LINK_ROLE_FOR_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."LINK_ROLE_FOR_USER" ("ID", "ROLE") AS 
  select 
cast(id as number)id,role
from user_role WITH READ ONLY;
--------------------------------------------------------
--  DDL for View LOAN_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."LOAN_DETAILS" ("CREDITOR", "DEBTOR", "DETAILS", "CLEAR_DATE", "REFERNCES", "NOMINY", "INSERT_BY", "LOAN_DATE", "DOCUMENT_ID", "S_NO") AS 
  select 
cast(doner as number)Creditor,
cast(receiver as number)Debtor,
details,
cleardate clear_date,
cast(REFERNCES as number)REFERNCES ,
cast(NOMINY as number)NOMINY ,
cast(INSERTBY as number) insert_by,
idate as loan_date,cast(SCANFILE as number) document_id 
,sno s_no
from loan WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MARRIED_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."MARRIED_INFORMATION" ("MALE", "FEMALE", "DETAILS", "INSERT_BY", "MARRIED_DATE", "DIVORCE", "S_NO") AS 
  select 
cast(male as number) male ,
cast(female as number)female ,
details,
cast(ADD_BY as number) insert_by,
m_date married_date,
devorse DIVORCE


,sno s_no
from married WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PASSPORT_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PASSPORT_INFORMATION" ("PASSPORT_NO", "VERIFIED_BY", "VERIFIED_DATE", "PASSPORT_TYPE") AS 
  select 
cast(user_id as number)passport_no,


cast(VERIFIED_BY as number)VERIFIED_BY,
VDATE VERIFIED_date,
PASSPORT_TYPE 
from passport WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PERMANENT_ADDRESS_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PERMANENT_ADDRESS_DETAILS" ("ID", "ADDRESS", "INSERT_BY", "INSERT_DATE") AS 
  select 
cast(id as number) id,cast(address as varchar2(150))address,cast(add_by as number)insert_by,add_date as insert_date

from PERMANENT_ADDRESS WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PESSENGER_TICKETS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PESSENGER_TICKETS" ("TICKET_NO", "BUS_LICENSE_NO", "PESSENGER_ID", "TRAVEL_DATE", "START_FROM", "START_TIME", "END_TO", "END_TIME", "KM", "TAKA", "SIT") AS 
  SELECT 
   s_no ticket_no,
  bus_license_no,
  pessenger_id,
  travel_date,
  sfrom start_from,
  stime start_time,
  eto end_to,
  etime end_time,
  km,
  taka,
  sit  
FROM 
x_ticket_p WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PREVIOUS_FINGER_PRINT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PREVIOUS_FINGER_PRINT" ("ID", "DATA", "UPDATE_DATE") AS 
  select 
cast(id as number)id, print data ,cast(ch_date as date)update_date
from p_finger WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PROCEDURE_EXECUTE_BY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PROCEDURE_EXECUTE_BY" ("USER_ID", "PROCEDURE_NAME", "DATA", "PERFORM_DATE") AS 
  select "NAME" user_id,"P_NAME" procedure_name,"DATA","PDATE" perform_date from e_p_by WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PROCEDURE_FOR_DB_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PROCEDURE_FOR_DB_USER" ("PROCEDURE_NAME", "PARAMETER", "ACTION_AFTER_EXECUTE") AS 
  select upper(PROCEDURE_NAME)PROCEDURE_NAME,upper(PARAMETER)PARAMETER,case lower(LOCK_USER) when 'y' then 'LOCK USER' else LOCK_USER end action_after_execute from procedure_dbm order by 1 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View PROPERTY_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."PROPERTY_INFORMATION" ("ID", "DOCUMENT_ID", "CURRENT_STATUS", "DETAILS", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  select 
cast(id as number) id,
cast(propertyid as number)document_id,
currentstatus current_status,
details,
cast(insertby as number)insert_by,
idate insert_date,
sno s_no
from property WITH READ ONLY;
--------------------------------------------------------
--  DDL for View REPORT_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."REPORT_DETAILS" ("REPORT_ID", "QUERY", "ALIAS", "INSERT_DATE", "SEARCH") AS 
  select 
view_id report_id,query ,alias,adate insert_date,
case lower(a)
when 'y' then 'YES' 

when 'f' then 'Full' 
when 'i' then 'IMAGE' 
when 'd' then 'DOCUMENT' 
when 'u' then 'User Private Document' 
when 'p' then upper('Selected Tables') 
else null
end Search
from allview WITH READ ONLY;
--------------------------------------------------------
--  DDL for View QUERY_BY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."QUERY_BY" ("QUERY", "PERFORM_BY", "PERFORM_DATE") AS 
  select substr(query,2,length(query)-2)query,cast(perform_by as number)perform_by,p_date perform_date from vactivity WITH READ ONLY;
--------------------------------------------------------
--  DDL for View REPORT_EXTRA_GRANTED_FOR_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."REPORT_EXTRA_GRANTED_FOR_USER" ("USER_ID", "REPORT_ID") AS 
  select 
cast(USER_ID as number)USER_ID ,"VIEW_ID" report_id
from g_view WITH READ ONLY;
--------------------------------------------------------
--  DDL for View REPORT_ROLE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."REPORT_ROLE" ("NAME", "REPORT_ID") AS 
  select 
name,cast(view_id as number)report_id
from vrole with read only;
--------------------------------------------------------
--  DDL for View REPORT_ROLE_FOR_USER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."REPORT_ROLE_FOR_USER" ("ID", "ROLE_NAME") AS 
  select 
cast(id as number)id,viewname role_name
from user_view WITH READ ONLY;
--------------------------------------------------------
--  DDL for View SCANNING_FILE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."SCANNING_FILE" ("ID", "DOCUMENT", "TABLE_NAME") AS 
  select 
cast(id as number) id,image document,cast(f1(TABLENAME) as varchar2(30))table_name

from SCANING WITH READ ONLY;
--------------------------------------------------------
--  DDL for View SELECTED_STAND_FOR_BUS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."SELECTED_STAND_FOR_BUS" ("BUS_LICENSE_NO", "BUS_STOP_POINT", "STOP_POINT_SERIAL", "TOTAL_KM", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  SELECT 
bus_license_no,bus_stop_point,s_no stop_point_serial,
km total_km,
cast(ins_by as number) insert_by,
ins_date insert_date,autonumber s_no

FROM 
x_bus_has_stop_office WITH READ ONLY;
--------------------------------------------------------
--  DDL for View SEND_SMS_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."SEND_SMS_T" ("USER_ID", "SMS", "INS_DATE", "PHONE") AS 
  select cast(id as number)user_id,"SMS","SDATE" ins_date,cast(PHONE as number) phone from sms;
--------------------------------------------------------
--  DDL for View TAX
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TAX" ("ID", "AMOUNT_TK", "DUE_TK") AS 
  select 
cast(id as number)id,AMMOUNT amount_tk,due due_tk
from tex with read only;
--------------------------------------------------------
--  DDL for View TAX_PAYMENT_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TAX_PAYMENT_INFORMATION" ("ID", "AMMOUNT", "INSERT_BY", "INSERT_DATE") AS 
  select 
cast(id as number)id,
ammount ,
cast(add_by as number)insert_by,
a_date insert_date
from pay_tax WITH READ ONLY;
--------------------------------------------------------
--  DDL for View TICKET_FORWARD_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TICKET_FORWARD_T" ("TICKET_NO", "BUS_LICENSE_NO", "PESSENGER_ID", "TRAVEL_DATE", "START_FROM", "START_TIME", "END_TO", "END_TIME", "KM", "TAKA", "SIT") AS 
  SELECT 
  s_no ticket_no,
  bus_license_no,
  pessenger_id,
  travel_date,
  sfrom start_from,
  stime start_time,
  eto end_to,
  etime end_time,
  km,
  taka,
  sit
FROM 
x_ticket WITH READ ONLY;
--------------------------------------------------------
--  DDL for View TICKET_RETURN_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TICKET_RETURN_T" ("TICKET_NO", "BUS_LICENSE_NO", "PESSENGER_ID", "TRAVEL_DATE", "START_FROM", "START_TIME", "END_TO", "END_TIME", "KM", "TAKA", "SIT") AS 
  select
s_no ticket_no,
  bus_license_no,
  pessenger_id,
  travel_date,
  sfrom start_from,
  stime start_time,
  eto end_to,
  etime end_time,
  km,
  taka,
  sit
  from 
  x_ticket_1 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View TIME_SCHEDULE_FORWARD_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TIME_SCHEDULE_FORWARD_T" ("BUS_LICENSE_NO", "BUS_STOP_POINT", "TIME", "S_NO") AS 
  SELECT 
 bus_license_no,
 bus_stop_point,

 time,
 pass s_no
FROM 
x_time_schedule WITH READ ONLY;
--------------------------------------------------------
--  DDL for View TIME_SCHEDULE_RETURN_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."TIME_SCHEDULE_RETURN_T" ("BUS_LICENSE_NO", "BUS_STOP_POINT", "TIME", "S_NO") AS 
  SELECT 
 bus_license_no,
 bus_stop_point,

 time,
 pass s_no
FROM 
x_time_schedule_1 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View USER_ACTIVITY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."USER_ACTIVITY" ("UNIQUE_VALUE", "TABLE_NAME", "COLUMN_NAME", "OLD_DATA", "NEW_DATA", "PERFORM_BY", "PERFORM_DATE") AS 
  select CAST(userid as varchar2(50)) unique_value,
cast(f1(TABLE_NAME) as varchar2(30))table_name,
cast(f2(TABLE_NAME,COLUMN_NAME)as varchar2(30)) column_name,
old_date  old_data,new_data  new_data,cast(performby as number)perform_by,pdate perform_date from ACTIVITY WITH READ ONLY;
--------------------------------------------------------
--  DDL for View USER_FINGER_PRINT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."USER_FINGER_PRINT" ("ID", "DATA", "LAST_UPDATE_BY", "LAST_UPDATE_DATE") AS 
  select 
cast(id as number) id,print data,cast(update_by as number) last_update_by,update_date last_update_date    
from FINGER_PRINT with read only;
--------------------------------------------------------
--  DDL for View USER_IMAGE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."USER_IMAGE" ("ID", "IMAGE", "INSERT_BY", "INSERT_DATE") AS 
  select 
cast(id as number) id,image,cast(insert_by as number) insert_by ,i_date insert_date
from image with read only;
--------------------------------------------------------
--  DDL for View USER_SOURCES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."USER_SOURCES" ("OBJECT_NAME", "TEXT") AS 
  select USER_DEPENDENCIES.name Object_name,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(text)) text from USER_DEPENDENCIES,all_procedures,user_source
where all_procedures.OBJECT_NAME=USER_DEPENDENCIES.NAME and user_source.name=USER_DEPENDENCIES.REFERENCED_NAME
and upper(USER_DEPENDENCIES.name)not in ('INS_FOREIGNER_DETAILS','INS_CITIZENS');
--------------------------------------------------------
--  DDL for View VISA_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."VISA_INFORMATION" ("ID", "COUNTRY", "VISA_TYPE", "START_DATE", "EXPIRE_DATE", "APPROVED_BY", "APPROVED_DATE", "VISA_NO") AS 
  select 
cast(id as number)id,
country,
reason visa_type,
sdate start_date,
edate expire_date,
cast(APROVEBY as number) approved_by,
adate approved_date,
cast(visano as number)as visa_no






from visa WITH READ ONLY;
--------------------------------------------------------
--  DDL for View VOTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."VOTER" ("ID", "ZONE") AS 
  select 
cast(id as number)id,zone
from voter_list with read only;
--------------------------------------------------------
--  DDL for View WILL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."WILL" ("APPLICANT", "NOMINEE", "DETAILS", "EXECUTE_DATE", "INSERT_DATE", "DOCUMENT_ID", "EXECUTE") AS 
  select 
cast(NOTICEBY as number)applicant,
cast (NOTICEFOR as number) as nominee ,
details
,exedate as execute_date,
insertdate as insert_date,
cast(SCAFILEID as number)document_id,
case lower (exe) when 'y' then 'YES' else null end execute
from notice WITH READ ONLY;
--------------------------------------------------------
--  DDL for View WORK_INFORMATION
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ADMIN"."WORK_INFORMATION" ("ID", "DETAILS", "SALARY", "JOIN_DATE", "RESIGN_DATE", "INSERT_BY", "INSERT_DATE", "S_NO") AS 
  select 
cast(id as number)id,
details,
salary,
join join_date,
resign resign_date,

cast(add_by as number) insert_by ,
adate insert_date,
sno s_no
from work WITH READ ONLY;
