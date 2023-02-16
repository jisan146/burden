--------------------------------------------------------
--  File created - Tuesday-March-07-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure APP_LOGIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."APP_LOGIN" 
 (v out varchar2) is
 begin
 v:='DATA SOURCE=localhost:1521/orcl;PASSWORD=123;USER ID=ADMIN';
 end;

/
--------------------------------------------------------
--  DDL for Procedure C_CHECK_QUERY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."C_CHECK_QUERY" 
(e varchar2,b varchar2,f out number)
is
c number;
d number;
a varchar2(4000);
aa varchar2(100):=e;
bb varchar2(100);
cc varchar2(100);
dd varchar2(100);
ee number;
ff number;
begin

select instr(b,'from'),instr(b,'where')into c,d from dual;
if (d=0) then
select substr(b,c+4) into a from dual;
else
select substr(b,c+4,d-c-4) into a from dual;
end if;
select replace(a, chr(32), '')into a from dual;
--f:=instr(e,a);
bb:=a||',';
ee:=0;

for i in 1..length(bb) loop
ee:=ee+1;
select substr(bb,ee,1) into dd from dual;

if(dd=',')then
select substr(bb,0,instr(bb,',')-1) into cc from dual;
select substr(bb,length(cc)+2) into bb from dual;

ee:=0;
end if;
ff:=instr(lower(aa),lower(cc));
exit when ff=0;


end loop;
if(ff>0)then
f:=1;
else
f:=0;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure C_PASS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."C_PASS" 
(
v_id varchaR2,
v_password varchaR2,
v_n_pass varchaR2,
v_out out varchaR2
)
IS
c number;
BEGIN
SELECT COUNT(*) into c FROM TAB_USER WHERE user_id=v_id and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_password));
if(length(v_n_pass)>5)then
if (c=1) then
update tab_user set password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_n_pass)) where user_id=v_id;
v_out:='SUCCESSFUL';
commit;
else
v_out:='Current password not match';
end if;
else
v_out:='Password Minimum length 6';
end if;


END;

/
--------------------------------------------------------
--  DDL for Procedure CHECK_LL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."CHECK_LL" 
(V_id varchar2,V_pass varchar2, c out number) IS

BEGIN
select count(*) into c from tab_user where USER_ID=V_id and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(V_pass)) and lower(type)='open' ;

end;

/
--------------------------------------------------------
--  DDL for Procedure CRIME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."CRIME" 
(
vid VARCHAR2,
vc VARCHAR2,
vd VARCHAR2,
va VARCHAR2
)
is
BEGIN
INSERT  INTO crminal values (vid,vc,vd,va,sysdate,up.nextval);
commit;
END;

/
--------------------------------------------------------
--  DDL for Procedure FPF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."FPF" 
(
v_id VARCHAR2,
v_print VARCHAR2,
v_add_by VARCHAR2,
v_out out VARCHAR2,
vp VARCHAR2,
age out number
)
IS
c NUMBER;
vv varchar2(10);

BEGIN
SELECT count(ID),id into c,vv FROM finger_print where PRINT=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_print)) group by id;
v_out:=vv;

if(c=1)then
select trunc((sysdate-dob)/365) into age from people where id=vv;
end if;

if(c!=1) then
insert into finger_print values(v_id,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_print)),v_add_by,sysdate);
commit;
else
insert into  p_finger values(vv,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_print)),(select update_date from finger_print where id=vv));
update finger_print set print=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_print)) ,update_by=v_add_by ,UPDATE_DATE=sysdate where id=vv;

commit;
end if;
insert into  search_finger values(vv,v_add_by,sysdate,vp);
commit;
EXCEPTION
WHEN OTHERS THEN
C:=0;
END;

/
--------------------------------------------------------
--  DDL for Procedure G_L
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."G_L" 
(
v_id varchar2,
v_l_id varchar2,
v_date date,
vib varchar2
)
is
c number;
begin
select count(l_id) into c from g_liink where id=v_id and l_id=v_l_id;
if (c=0)then
insert into g_liink values(v_id,v_l_id);
commit;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure G_L_D
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."G_L_D" 
(
v_id varchar2,
v_l_id varchar2
)
is
begin
delete from g_liink where id=v_id and l_id=v_l_id ;
end;

/
--------------------------------------------------------
--  DDL for Procedure GRA_L
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."GRA_L" 
 (
 a VARCHAR2,
 b VARCHAR2,
 c OUT NUMBER
 )
 IS
 BEGIN

 select count(link) into c from
(select initcap(link) link,initcap(alias) alias from link where id  in(select l_id from g_liink) or  id in( select linkid from role where lower(name)in(select lower(role) from user_role where id=b)) order by initcap(alias))
where lower(link)=lower(a);
 END;

/
--------------------------------------------------------
--  DDL for Procedure INS_BANK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."INS_BANK" 
 (
 v_id varchar2,
 v_acc varchar2,
 v_n varchar2,
 v_r varchar2,
 v_nom varchar2,
 v_aa varchar2
 )
 is
 a number;
 begin
 insert into bank values(v_id,v_acc,v_n,v_r,v_nom,v_aa,sysdate,up.nextval);
 commit;
 exception
 when others then
 a:=0;
 end;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_IMAGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."INSERT_IMAGE" 
(v_id VARCHAR2,v_image CLOB,v_insert_by VARCHAR2,v_date DATE,b VARCHAR2,c out number) IS
ttt VARCHAR2(4);
BEGIN
select count(*) into c from tab_user where USER_ID=v_insert_by and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;

if (c=1) then
INSERT INTO image VALUES (v_id,v_image,v_insert_by,v_date);
delete  from image  where id=v_id and length(image)<5;
commit;
end if;
EXCEPTION
WHEN OTHERS THEN
rollback;

end;

/
--------------------------------------------------------
--  DDL for Procedure LOG_ACT_TIME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."LOG_ACT_TIME" 
(
id varchar2,
action varchar2
)
is
begin
insert into schlogin values(id,action,sysdate);
for i in(select * from NOTICE where (EXEDATE<=sysdate or to_char(exedate,'dd-mm-rr')=to_char(sysdate,'dd-mm-rr'))  and (exe is null or lower(exe)!='y' ))loop
insert into sms values(i.noticefor,'You have a notice by '||i.noticeby,sysdate,(select TEMP_EMAIL from tab_user where USER_ID=i.noticefor));
end loop;
update NOTICE set exe='y' where to_char(exedate,'dd-mm-rr')=to_char(sysdate,'dd-mm-rr') or exedate<=sysdate;
end;

/
--------------------------------------------------------
--  DDL for Procedure MARGE_TICKET_P
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."MARGE_TICKET_P" 
is
begin
merge into x_ticket_p p using x_ticket t on(p.s_no=t.s_no)
when matched then
update
set

p.sit=t.sit


when not matched then
insert values (t.s_no,t.bus_license_no,t.pessenger_id,t.travel_date,t.sfrom,t.stime,t.eto,t.etime,t.km,t.taka,t.sit,t.ss_no,t.es_no);
----
merge into x_ticket_p p using x_ticket_1 t on(p.s_no=t.s_no)
when matched then
update
set

p.sit=t.sit


when not matched then
insert values (t.s_no,t.bus_license_no,t.pessenger_id,t.travel_date,t.sfrom,t.stime,t.eto,t.etime,t.km,t.taka,t.sit,t.ss_no,t.es_no);

end;

/
--------------------------------------------------------
--  DDL for Procedure MARGER_X_TIME_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."MARGER_X_TIME_SCHEDULE" is
begin
merge into x_time_schedule_c a using x_time_schedule b on(a.s_no=b.pass)
when matched then
update
set
a.bus_license_no=b.bus_license_no,
a.bus_stop_point=b.bus_stop_point,

a.time=b.time

when not matched then

insert values (b.pass,b.bus_license_no,b.bus_stop_point,b.time,null);

merge into x_time_schedule_c a using x_time_schedule_1 b on(a.s_no=b.pass)
when matched then
update
set
a.bus_license_no=b.bus_license_no,
a.bus_stop_point=b.bus_stop_point,

a.time=b.time

when not matched then
insert values (b.pass,b.bus_license_no,b.bus_stop_point,b.time,null);
end;

/
--------------------------------------------------------
--  DDL for Procedure P_ADD_ADDRESS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_ADD_ADDRESS" 
(
v_id VARCHAR2,
v_address VARCHAR2,
v_add_By VARCHAR2,
b VARCHAR2,c out VARCHAR2) IS ttt VARCHAR2(4);
BEGIN
select TYPE into ttt from tab_user where USER_ID=v_add_By and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;
c:=ttt;
if (lower(ttt)='open') then
INSERT INTO current_address VALUES(v_id,v_address,v_add_By,sysdate);
commit;
end if;

END;

/
--------------------------------------------------------
--  DDL for Procedure P_AMBASSY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_AMBASSY" 
(
v_id varchar2,
v_c varchar2,
v_a varchar2,
v_p varchar2,
v_i varchar2,

v_m out varchar2

)
is
rand_num NUMBER;
f number;
l number;
begin



insert into AMBASSADOR values(v_id,v_c,v_a,v_p,v_i,sysdate);




commit;
v_m:='Save';



exception
when others then
v_m:='Already Register';

end;

/
--------------------------------------------------------
--  DDL for Procedure P_CANDIDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_CANDIDATE" 
(
vid varchar2,
vsn varchar2,

vp varchar2,

vz number,

vib  varchar2,
vsi clob

)
is
c number;
begin
select count(*) into c from ELECTION_CANDIDATE where USER_ID=vid;
if(c=0) then

INSERT INTO ELECTION_CANDIDATE VALUES(vid,vsn,vsi,vp,vz,null,vib,sysdate);
insert into reputation values(vid,0,0,0,1,0);
else
update ELECTION_CANDIDATE set SYMBOL_NAME=vsn, SYMBOL_IMAGE=vsi,  post=vp, zone=vz,insert_by=vib,idate=sysdate where USER_ID=vid;
update reputation set total=total+1,COUNTVOTE=0 where ID=vid;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_CONTACTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_CONTACTS" 
(
id VARCHAR2,
num VARCHAR2,
refer VARCHAR2,
add_by VARCHAR2,
b VARCHAR2,c out VARCHAR2) IS ttt VARCHAR2(4);
BEGIN
select TYPE into ttt from tab_user where USER_ID=add_by and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;
c:=ttt;
if (lower(ttt)='open') then
INSERT INTO contacts VALUES(id,num,refer,add_by,sysdate,up.nextval);
commit;
end if;
EXCEPTION
when others then
rollback;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_CRIME_RECORD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_CRIME_RECORD" 
(
vid varchar2,

vno out number
)
is
begin
select count(*) into vno from CRMINAL where ID=id;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_D_UPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_D_UPDATE" 
(
a out number,
c out number,
d out varchar2,
e  out varchar2,
f out varchar2,
b number,
aid varchar2

)
is
j number;
begin
 select count(code) into j from
(select code from updatecode  where code in(select code from update_p_extra) or  code in( select code from update_p_role where lower(role_name)in(select lower(role_name) from update_p_role_for_user where id=aid)) )
where code=b;
if(j>0)then
select count(*) into a from updatecode where code=b and lower(static)=lower('y');
select count(*) into c from updatecode where code=b and lower(static)=lower('n');
if(c=1)then
select columnname , tablename,using into d,e,f from updatecode where code=b;
end if;
else
a:=15;
c:=15;
d:=15;
e:=15;
end if;

end;

/
--------------------------------------------------------
--  DDL for Procedure P_DIS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_DIS" 
 (
 vi VARCHAR2,
 vd VARCHAR2,
 va VARCHAR2

 )
 IS
 BEGIN
 INSERT INTO disable_people VALUES(vi,vd,va,sysdate);
 END;

/
--------------------------------------------------------
--  DDL for Procedure P_EDU
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_EDU" 
    (
v_id VARCHAR2,
v_det VARCHAR2,
a_code VARCHAR2,
a_lev VARCHAR2,
a_by VARCHAR2,

b VARCHAR2,c out VARCHAR2,vvg VARCHAR2) IS ttt VARCHAR2(4);
BEGIN
select TYPE into ttt from tab_user where USER_ID=a_by and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;
c:=ttt;
if (lower(ttt)='open') then
insert into education values(v_id,v_det,a_code,sysdate,a_lev,a_by,vvg,up.NEXTVAL);
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_FOREIGNER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_FOREIGNER" 
(
v_user_id varchar2,
V_type varchar2,
V_name_eng clob,
v_contact varchar2,
v_passport varchar2,
v_country varchar2,
V_blood_group varchar2,
v_email varchar2,
v_m out varchar2,
v_data out varchar2,
v_f VARCHAR2
)
is
iimage clob:='n/a';
rand_num NUMBER;
f number;
l number;
begin
rand_num:=TRUNC(DBMS_RANDOM.value(low => 1111111111, high => 9999999999));
insert into tab_user
values(user_id.nextval,'open',v_user_id ,sysdate,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(rand_num)),v_email,'y');
f:=sql%rowcount;

insert into FOREIGNER values(user_id.currval,V_name_eng,v_passport,v_country,v_contact,V_blood_group,sysdate,v_user_id);
insert into x_balance values(user_id.currval,0);
INSERT INTO USER_ROLE values(user_id.currval,'foreigner');
INSERT INTO USER_view values(user_id.currval,'foreigner');
insert into image values(user_id.currval,iimage,v_user_id,sysdate);
insert into FINGER_PRINT values(user_id.currval,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_f)),v_user_id,sysdate);
l:=sql%rowcount;
if (f>0 and l>0) then
commit;
v_m:='Save';
v_data:='We are Team BURDEN and Your login ID: '||user_id.currval||' and password: '|| rand_num;
else
rollback;
end if;
exception
when others then
null;

end;

/
--------------------------------------------------------
--  DDL for Procedure P_LOAN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_LOAN" 
(
vd varchar2,
vr varchar2,
vdt varchar2,


vrr varchar2,
vn varchar2,
vi varchar2,
v_im clob
)

is
b number;
begin
if(vd!=vr ) then
p_scanfile(v_im,'Loan',b);
INSERT INTO loan VALUES(vd,vr,vdt,null,vrr,vn,vi,sysdate,b,up.nextval);
commit;

end if;
exception when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_LOGIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_LOGIN" (id varchar2,pass varchar2,type out varchar2,vf out VARCHAR2,cnum out varchar2) is
b EXCEPTION;
PRAGMA EXCEPTION_INIT(B,-00054);
begin
select lower(TYPE),lower(FOREIGNER),temp_email into type,vf,cnum from tab_user where USER_ID=id and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(pass)) for update nowait;

exception
WHEN B THEN
type:='Already open from other session';
when others then
type:=null;

end;

/
--------------------------------------------------------
--  DDL for Procedure P_MARRIED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_MARRIED" 
(
v_m VARCHAR2,
v_f VARCHAR2,
v_b VARCHAR2,
v_d VARCHAR2,
vout out VARCHAR2
)
IS
vf VARCHAR2(5);
vm VARCHAR2(5);
BEGIN
select lower(gender) into vf  from people where id=v_f;
select lower(gender) into vm from people  where id=v_m;
if (vf!=vm) then
INSERT INTO married VALUES(v_m,v_f,v_b,v_d,sysdate,null,up.nextval);
commit;
vout:=null;
else
vout:='Not possible by avalable rule. only possible when one male and one female';
end if;
END;

/
--------------------------------------------------------
--  DDL for Procedure P_NEW_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_NEW_USER" 
(
v_user_id varchar2,
V_type varchar2,
V_name_eng clob,
V_name_ban clob,
V_gender varchar2,
V_f_name varchar2,
V_m_name varchar2,
v_dob date,
V_dead date,
V_blood_group varchar2,
v_email varchar2,
v_m out varchar2,
v_data out varchar2,
v_f VARCHAR2
)
is
iimage clob:='n/a';
rand_num NUMBER;
f number;
l number;
begin
rand_num:=TRUNC(DBMS_RANDOM.value(low => 1111111111, high => 9999999999));
insert into tab_user
values(user_id.nextval,V_type,v_user_id ,sysdate,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(rand_num)),v_email,'n');
f:=sql%rowcount;
insert into people values(user_id.currval,V_name_eng,V_name_ban,V_gender,V_f_name,V_m_name,v_dob,V_dead,V_blood_group);
insert into x_balance values(user_id.currval,0);
INSERT INTO USER_ROLE values(user_id.currval,'public');
INSERT INTO USER_view values(user_id.currval,'public');
insert into FINGER_PRINT values(user_id.currval,DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(v_f)),v_user_id,sysdate);
insert into image values(user_id.currval,iimage,v_user_id,sysdate);
l:=sql%rowcount;
if (f>0 and l>0) then
commit;
v_m:='Save';
v_data:='We are Team BURDEN and Your login ID: '||user_id.currval||' and password: '|| rand_num;
else
rollback;
end if;
exception
when others then
v_m:='check date format, Father or Mother ID. IF they have not user id blank those field';

end;

/
--------------------------------------------------------
--  DDL for Procedure P_NOTICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_NOTICE" 
(
vnb varchar2,
vnf varchar2,
vd varchar2,
ved varchar2,
v_im clob
)
is
b number;
begin
p_scanfile(v_im,'notice',b);
if(ved='d')then
INSERT INTO notice VALUES(vnb,vnf,vd,null,sysdate,b,null);
else
INSERT INTO notice VALUES(vnb,vnf,vd,ved,sysdate,b,null);
end if;

end;

/
--------------------------------------------------------
--  DDL for Procedure P_O_CANDIDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_O_CANDIDATE" 
(
vid varchar2,
v_out out varchar2

)
IS
vvo varchar2(100);
c number;
vp varchar2(20);
vn varchar2(100);
vage number;
vg number;
vb number;
vw number;
vt number;
cursor cur is select distinct upper(lev) l from education where id=vid and lower(GRADUATE)='y';

BEGIN
select name_eng,trunc((sysdate-dob)/365) into vn,vage from people where id=vid;
select post  into vp from ELECTION_CANDIDATE where user_id=vid;

select count(*) into c from crminal where id=vid;
select good,bad,win,total into vg,vb,vw,vt from reputation  where id=vid;


for i in cur loop
vvo:=vvo||'  '||i.l;
end loop;

if(vvo=null) then
vvo:='Uneducated';
end if;

v_out:='Name: '|| vn ||'***Age: '||vage||'***Candidate: '||vp||'***Criminal Record: '||c||'***Educational Background: '||vvo||'***Good Reputation: '||vg||'***Bad Reputation: '||vb||'***Total Win: '||vw ||'***Total Election: '||vt;
exception
when others then
v_out:=null;
END;

/
--------------------------------------------------------
--  DDL for Procedure P_PASSPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_PASSPORT" 
(
v_id varchar2,

v_a varchar2
)
IS
c number;
tt varchar2(10);
BEGIN
select to_number(trunc((sysdate-dob)/365)) into c from people where id=v_id;
if(c>=18)then
tt:='citizen';
else
tt:='child';
end if;



INSERT INTO PASSPORT VALUES(v_id,v_a,sysdate,tt);

commit;
END;

/
--------------------------------------------------------
--  DDL for Procedure P_PERMANENT_ADDRESS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_PERMANENT_ADDRESS" 
    (
    v_id VARCHAR2,
    v_address VARCHAR2,
    v_add_By VARCHAR2,
   b VARCHAR2,c out VARCHAR2) IS ttt VARCHAR2(4);
BEGIN
select TYPE into ttt from tab_user where USER_ID=v_add_By and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;
c:=ttt;
if (lower(ttt)='open') then
    INSERT INTO permanent_address VALUES(v_id,v_address,v_add_By,sysdate);
   commit;
   end if;
   END;

/
--------------------------------------------------------
--  DDL for Procedure P_PROPERTY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_PROPERTY" 
(
v_id varchar2,
v_c varchar2,
v_d varchar2,
v_im clob,
v_ib varchar2
)
is
b number;
begin
p_scanfile(v_im,'PROPERTY',b);
INSERT INTO PROPERTY VALUES(v_id,b,v_c,v_d,v_ib,sysdate,up.nextval);

end;

/
--------------------------------------------------------
--  DDL for Procedure P_SCANFILE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_SCANFILE" 
(v_im clob,tn varchar2,a out number)is
pragma autonomous_transaction;
begin
INSERT INTO SCANING VALUES(up.nextval,v_im,tn);
commit;
select up.currval into a from dual;
end ;

/
--------------------------------------------------------
--  DDL for Procedure P_SMS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_SMS" (vnum out varchar2, vsms out varchar2)is
begin
select phone,sms into vnum,vsms from sms where ROWNUM=1;

delete from sms where ROWNUM=1;
exception when others then vnum:=0;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_UPDATE_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_UPDATE_DATA" 
(
vid varchar2,
vcode varchar2,
vvdata varchar2,
vpb varchar2
)
is
oldd varchar2(500);
vdata varchar2(500);
vvid varchar2(500);
m number;
sal number;
g number;
begin
vdata:=vvdata;
if(lower(vvdata)='null') then
vdata:=null;
end if;
-----tab_user

if(vcode=111221) then
select type into oldd from tab_user where user_id=vid;
update tab_user set TYPE=vdata where user_id=vid;
insert into activity values(vid,upper('tab_user'),upper('type'),oldd,vdata,vpb,sysdate);

elsif(vcode=111222) then
select TEMP_EMAIL into oldd from tab_user where user_id=vid;
update tab_user set TEMP_EMAIL=vdata where user_id=vid;
insert into activity values(vid,upper('tab_user'),upper('TEMP_EMAIL'),oldd,vdata,vpb,sysdate);



elsif(vcode=111225) then
select count(*) into g from people where  id=vvdata and lower(gender)='m';
if(g=1 and vid!=vvdata)then
select  FATHER into oldd from  PEOPLE where id=vid;
update  PEOPLE set  FATHER=vvdata where id=vid;
insert into activity values(vid,upper('PEOPLE'),upper('FATHER'),oldd,vdata,vpb,sysdate);
end if;

elsif(vcode=111226) then
select count(*) into g from people where  id=vvdata and lower(gender)='f';
if(g=1 and vid!=vvdata)then
select  MOTHER into oldd from  PEOPLE where id=vid;
update  PEOPLE set  MOTHER=vvdata where id=vid;
insert into activity values(vid,upper('PEOPLE'),upper('MOTHER'),oldd,vdata,vpb,sysdate);
end if;

elsif(vcode=111223) then
select license into oldd from X_BUS_INFROMATION where license_no=vid;
update X_BUS_INFROMATION set license=vdata where license_no=vid;
insert into activity values(vid,upper('X_BUS_INFROMATION'),upper('license'),oldd,vdata,vpb,sysdate);
if(lower(vdata)='c')then
x_cancel_ticket(vid);
end if;
end if;
EXCEPTION
WHEN OTHERS THEN
NULL;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_VISA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_VISA" 
(
v_id varchar2,
v_c varchar2,
v_r varchar2,
v_s_d varchar2,
v_e_d varchar2,
v_a_b varchar2,
v_n varchar2,
v_O out varchar2

)
is
begin
insert into visa values(v_id,v_c,v_r,v_s_d,v_e_d,v_a_b,sysdate,v_n);
commit;
EXCEPTION
WHEN OTHERS THEN
v_O:='passport number not found';
end;

/
--------------------------------------------------------
--  DDL for Procedure P_VOTE_COUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_VOTE_COUNT" 
(
vid varchar2,
vpost varchar2,
vcid varchar2

)
is
c number;
begin
select count(*) into c from duevote where id=vid and lower(post)=lower(vpost);
if (c=0) then
insert into duevote values(vid,vpost);
update reputation set countvote=countvote+1 where id=vcid;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_VOTE_ON
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_VOTE_ON" 
(
vout out number
)
is
begin
vout:=0;
end;

/
--------------------------------------------------------
--  DDL for Procedure P_VOTER_LIST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_VOTER_LIST" 
(
vi varchar2,

vz varchar2
)
is
c number;
BEGIN
select count(*) into c from voter_list where id=vi;
if(c=0) then
INSERT INTO VOTER_LIST values(vi,vz);
else
update voter_list set zone=vz where id=vi;
end if;
delete from g_liink where id=vi and l_id='29';
END;

/
--------------------------------------------------------
--  DDL for Procedure P_WORK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."P_WORK" 
           (
        v_id VARCHAR2,
        v_det VARCHAR2,
        sal number,
        v_join date,
        a_by VARCHAR2,
        b VARCHAR2,c out VARCHAR2) IS ttt VARCHAR2(4);
        d number;
      m NUMBER;
      BEGIN

      select TYPE into ttt from tab_user where USER_ID=a_by and password=DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(b)) and lower(type)='open' ;
      select count(*) into d from tex where id=v_id ;
       SELECT  12-TO_NUMBER(TO_CHAR(SYSDATE,'MM')) INTO m FROM DUAL;
      c:=ttt;
      if (lower(ttt)='open') then
      insert into work values(v_id,v_det,sal,v_join,null,a_by,sysdate,up.nextval);
      if (d=0) then
      insert into tex values(v_id, sal*.02*12,sal*.02*m);
      else
      update tex set ammount=ammount+(sal*.02*12), DUE=DUE+ (sal*.02*m) WHERE ID=v_id;

      end if;
      commit;
      end if;
      end;

/
--------------------------------------------------------
--  DDL for Procedure PARENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."PARENT" 
(
V_ID VARCHAR2,
V_P VARCHAR2
)
is
V_G VARCHAR2(5);
BEGIN
SELECT LOWER(gender) INTO V_G FROM people WHERE ID=V_P;
IF (V_G='m') THEN
UPDATE people SET father=V_P WHERE id=V_ID;
ELSE
UPDATE people SET mother=V_P WHERE id=V_ID;
END IF;


END;

/
--------------------------------------------------------
--  DDL for Procedure PAY_TEX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."PAY_TEX" 
(
v_id VARCHAR2,
v_tk NUMBER,
v_a VARCHAR2
)
is
v_due  NUMBER;
BEGIN

SELECT due into v_due from tex where id=v_id;
if(v_tk>0 AND v_due>0) THEN

UPDATE TEX SET DUE=DUE-v_tk where id=v_id;
INSERT INTO PAY_TAX VALUES(v_id,v_tk, v_a,sysdate);

END IF;
exception
when others then
INSERT INTO PAY_TAX VALUES(v_id,v_tk, v_a,sysdate);
END;

/
--------------------------------------------------------
--  DDL for Procedure PG_REP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."PG_REP" 
(
vid varchar2,
vcid varchar2,
vg varchar2,
vb varchar2

)
is
c number;
begin
select count(*) into c from drep where id=vid and cid=vcid;
if (c=0) then
insert into drep values(vid,vcid);
update reputation set good=good+vg ,bad=bad+vb where id=vcid;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_ALL_VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_ALL_VIEW" 
(b varchar2,c varchar2,d varchar2)
is
f varchar2(2000);
g varchar2(30);
h varchar2(5);
l number;
ll number;
begin

select count(*)into l from allview where QUERY=b or ALIAS=c;
if(l=0)then
insert into allview values(view_no.nextval,b,c,sysdate,d);
insert into e_p_by values(user,'MAKE_QUERY_FOR_REPORT',b||' '||c||' '||d,sysdate);
dbms_output.put_line('succesfull');
else
select query,alias,a,view_id into f,g,h,ll  from allview where QUERY=b or ALIAS=c;
if(lower(c)=lower(g))then
dbms_output.put_line('Your alias use in view_id: '||ll );
elsif(lower(b)=lower(f))then
dbms_output.put_line('Your query use in view_id: '||ll );
end if;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_D_G__LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_D_G__LINK" 
(a number, b number)
is
c number;
d varchar2(100);
begin
select id into d from g_liink where ID=a and L_ID=b;
delete from g_liink where ID=a and L_ID=b;
insert into e_p_by values(user,'DELETE_EXTRA_GRANTED_LINK',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
exception when others then
dbms_output.put_line('No Data Found');
end;

/
--------------------------------------------------------
--  DDL for Procedure U_D_G__VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_D_G__VIEW" 
(a number, b number)
is
c number;
d varchar2(100);
begin
select user_ID into d from g_view where user_ID=a and view_ID=b;
delete from g_view where user_ID=a and view_ID=b;
insert into e_p_by values(user,'DELETE_EXTRA_GRANTED_REPORT',a||' '||b,sysdate);

dbms_output.put_line('Successfull');
exception when others then
dbms_output.put_line('No Data Found');
end;

/
--------------------------------------------------------
--  DDL for Procedure U_D_USER_ROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_D_USER_ROLE" 
(a number, b varchar2) 
is
d varchar2(100);
begin

delete from user_role where id=a and role =b;
insert into e_p_by values(user,'DELETE_USER_LINK_ROLE',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
exception when others then
dbms_output.put_line('No Data Found');
end;

/
--------------------------------------------------------
--  DDL for Procedure U_D_USER_VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_D_USER_VIEW" 
(a number, b varchar2) 
is
d varchar2(100);
begin

delete from user_view where id=a and viewname=b;
insert into e_p_by values(user,'DELETE_USER_REPORT_ROLE',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
exception when others then
dbms_output.put_line('No Data Found');
end;

/
--------------------------------------------------------
--  DDL for Procedure U_G__LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_G__LINK" 
(a number, b number)
is
c number;
begin
select count(*) into c from g_liink where id=a and l_id=b;
if(c=0)then
u_lock_user(a);
insert into g_liink values(a,b);
insert into e_p_by values(user,'EXTRA_LINK_GRANT_FOR_USER',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already inserted');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_G__VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_G__VIEW" 
(a number, b number)
is
c number;
begin
select count(*) into c from g_view where user_id=a and view_id=b;
if(c=0)then
u_lock_user(a);
insert into g_view values(a,b);
insert into e_p_by values(user,'EXTRA_REPORT_GRANT_FOR_USER',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already inserted');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_LOCK_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_LOCK_USER" (a number)
is begin
update tab_user set type='lock' where user_id=a;
insert into e_p_by values(user,'LOCK_USER_ACCOUNT',a,sysdate);
end;

/
--------------------------------------------------------
--  DDL for Procedure U_OPEN_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_OPEN_USER" (a number)
is begin
update tab_user set type='open' where user_id=a;
insert into e_p_by values(user,'UNLOCK_USER_ACCOUNT',a,sysdate);
end;

/
--------------------------------------------------------
--  DDL for Procedure U_P_EXTRA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_P_EXTRA" 
(a number, b number)
is
c number;
begin
select count(*) into c from UPDATE_P_EXTRA where id=a and code=b;
if(c=0)then
u_lock_user(a);
insert into UPDATE_P_EXTRA values(a,b);
insert into e_p_by values(user,'EXTRA_UPDATE_CODE_FOR_USER',a||' '||b,sysdate);
DBMS_OUTPUT.PUT_LINE('Save');
else
DBMS_OUTPUT.PUT_LINE('Already Insert');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_P_ROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_P_ROLE" 
(a varchar2, b number)
is
c number;
begin
select count(*) into c from UPDATE_P_ROLE where ROLE_NAME=a and code=b;
if(c=0)then
insert into UPDATE_P_ROLE values(a,b);
insert into e_p_by values(user,'UPDATE_CODE_ROLE',a||' '||b,sysdate);
DBMS_OUTPUT.PUT_LINE('Save');
else
DBMS_OUTPUT.PUT_LINE('Already Insert');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_P_ROLE_FOR_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_P_ROLE_FOR_USER" 
(a number, b varchar2)
is
c number;
begin
select count(*) into c from UPDATE_P_ROLE_FOR_USER where ROLE_NAME=b and id=a;
if(c=0)then
u_lock_user(a);
insert into UPDATE_P_ROLE_FOR_USER values(a,b);
insert into e_p_by values(user,'UPDATE_CODE_ROLE_FOR_USER',a||' '||b,sysdate);
DBMS_OUTPUT.PUT_LINE('Save');
else
DBMS_OUTPUT.PUT_LINE('Already Insert');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_ROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_ROLE" 
(a varchar2, b number) 
is
c number;
begin
select count(*) into c from role where NAME=a and LINKID=b;
if(c=0)then
insert into role values (a,b);
insert into e_p_by values(user,'ACCESS_LINK_ROLE',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already insered');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_UPDATECODE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_UPDATECODE" 
(
a varchar2,b varchar2,c varchar2
)is
d number;
begin
select count(*)into d from UPDATECODE where columnname=f4(upper(a),upper(b)) and tablename=f3(upper(a));
if(d=0)then
insert into UPDATECODE(columnname,tablename,using) values(f4(upper(a),upper(b)),f3(upper(a)),upper(c));
insert into e_p_by values(user,'MAKE_UPDATE_CODE',a||' '||b||' '||c,sysdate);
dbms_output.put_line('Save');
else
dbms_output.put_line('Already inserted');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_USER_ROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_USER_ROLE" 
(a number, b varchar2) 
is
c number;
begin
select count(*) into c from user_role where id=a and lower(role)=lower(b);

if(c=0)then
u_lock_user(a) ;
insert into user_role values (a,b);
insert into e_p_by values(user,'GRANT_LINK_ROLE_TO_USER',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already insered');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_USER_VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_USER_VIEW" 
(a number, b varchar2) 
is
c number;
begin
select count(*) into c from user_view where id=a and lower(viewname)=lower(b);

if(c=0)then
u_lock_user(a);
insert into user_view values (a,b);
insert into e_p_by values(user,'GRANT_REPORT_ROLE_TO_USER',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already insered');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure U_VOTE_ON
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_VOTE_ON" 
(a varchar2)
is
b number;
begin
if (a=lower('vote on'))then
b:=1;
elsif (a=lower('vote off'))then
b:=0;
end if;
execute immediate(
'create or replace PROCEDURE P_vote_on
(
vout out number
)
is
begin
vout:='||b||';
end;');
insert into e_p_by values(user,'CONTROL_VOTE_LINK',a,sysdate);
end;

/
--------------------------------------------------------
--  DDL for Procedure U_VROLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."U_VROLE" 
(a varchar2, b number) 
is
c number;
begin
select count(*) into c from vrole  where NAME=a and view_ID=b;
if(c=0)then
insert into vrole  values (a,b);
insert into e_p_by values(user,'MAKE_REPORT_ROLE',a||' '||b,sysdate);
dbms_output.put_line('Successfull');
else
dbms_output.put_line('Already insered');
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_TIME
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."UPDATE_TIME" 

is
begin
update x_TIME_SCHEDULE_c set time =to_date(to_char(time,'hh:mi am'),'hh:mi am');
update x_TIME_SCHEDULE_1 set time =to_date(to_char(time,'hh:mi am'),'hh:mi am');
update x_TIME_SCHEDULE set time =to_date(to_char(time,'hh:mi am'),'hh:mi am');
insert into e_p_by values(user,'MODIFY_TIME',null,sysdate);
end;

/
--------------------------------------------------------
--  DDL for Procedure X__CHECK_TICKET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X__CHECK_TICKET" 
(
ln varchar2,
f varchar2,
ft varchar2,
t varchar2,
tt varchar2,
k varchar2,
ttk varchar2,
pid varchar2,
td varchar2,
vvbal out varchar2,
b_lock out number 
)
is 
vdate varchar2(50);
ts number;
tsc number;
cts number;
ctsc number;
vsit number;
vbal number;
vss_no number;
ves_no number;

begin
select s_no into vss_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(f) and bus_license_no=ln;
select s_no into ves_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(t) and bus_license_no=ln;
select tk into vbal from x_balance where id=pid;
select total_sit,total_stand into ts,tsc from x_bus_infromation where license_no=ln;

if( vss_no<ves_no)then
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));

 if(vbal<ttk)then
vvbal:='Not enough money for Buy This Ticket';
b_lock:=0;
else
b_lock:=1;
if(ts-cts>0)then
vvbal:='Sit Avalable. Just Click For Buy';
elsif(tsc-ctsc>0)then
vvbal:='Stand Ticket Avalable. Just Click For Buy';
else
vvbal:='No Ticket';
b_lock:=0;
end if;
end if;
else
--------------
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));

 if(vbal<ttk)then
vvbal:='Not enough money for Buy This Ticket';
b_lock:=0;
else
b_lock:=1;
if(ts-cts>0)then
vvbal:='Sit Avalable. Just Click For Buy';
elsif(tsc-ctsc>0)then
vvbal:='Stand Ticket Avalable. Just Click For Buy';
else
vvbal:='No Ticket';
b_lock:=0;
end if;
end if;
end if;

exception when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X__CHECK_TICKET_COUNTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X__CHECK_TICKET_COUNTER" 
(
ln varchar2,
f varchar2,
ft varchar2,
t varchar2,
tt varchar2,
k varchar2,
ttk varchar2,
pid varchar2,
td varchar2,
vvbal out varchar2,
b_lock out number 
)
is 
vdate varchar2(50);
ts number;
tsc number;
cts number;
ctsc number;
vsit number;
vbal number;
vss_no number;
ves_no number;

begin
select s_no into vss_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(f) and bus_license_no=ln;
select s_no into ves_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(t) and bus_license_no=ln;

select total_sit,total_stand into ts,tsc from x_bus_infromation where license_no=ln;

if( vss_no<ves_no)then
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));



b_lock:=1;
if(ts-cts>0)then
vvbal:='Sit Avalable. Just Click For Sell';
elsif(tsc-ctsc>0)then
vvbal:='Stand Ticket Avalable. Just Click For Sell';
else
vvbal:='No Ticket';
b_lock:=0;
end if;

else
--------------
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));



b_lock:=1;
if(ts-cts>0)then
vvbal:='Sit Avalable. Just Click For Sell';
elsif(tsc-ctsc>0)then
vvbal:='Stand Ticket Avalable. Just Click For Sell';
else
vvbal:='No Ticket';
b_lock:=0;
end if;

end if;

exception when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X__TICKET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X__TICKET" 
(
ln varchar2,
f varchar2,
ft varchar2,
t varchar2,
tt varchar2,
k varchar2,
ttk varchar2,
pid varchar2,
td varchar2
)
is 
vss_no number;
ves_no number;
vdate varchar2(50);
ts number;
tsc number;
cts number;

ctsc number;
vsit number;
vbal number;

begin
select s_no into vss_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(f) and bus_license_no=ln;
select s_no into ves_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(t) and bus_license_no=ln;
select tk into vbal from x_balance where id=pid;--lower(sit)='stand-'||i      --lower(sit)='sit-'||i 
select total_sit,total_stand into ts,tsc from x_bus_infromation where license_no=ln;

if( vss_no<ves_no)then
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
 if(vbal>=ttk)then
if(ts-cts>0)then
for i in 1..ts loop
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='sit-'||i 
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when cts=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;
update x_balance set tk=tk+ttk where id=(select owner_id from X_BUS_INFROMATION where LICENSE_NO=ln);
update x_balance set tk=tk-ttk where id=pid;
insert into x_ticket values(ticket.nextval,ln,pid,to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'sit-'||vsit,vss_no,ves_no);
elsif(tsc-ctsc>0)then
for i in 1..tsc loop
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='stand-'||i
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when ctsc=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;
update x_balance set tk=tk+ttk where id=(select owner_id from X_BUS_INFROMATION where LICENSE_NO=ln);
update x_balance set tk=tk-ttk where id=pid;
insert into x_ticket values(ticket.nextval,ln,pid,to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'stand-'||vsit,vss_no,ves_no);
end if;
end if;
------
else
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
 if(vbal>=ttk)then
if(ts-cts>0)then
for i in 1..ts loop
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='sit-'||i 
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when cts=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;
update x_balance set tk=tk+ttk where id=(select owner_id from X_BUS_INFROMATION where LICENSE_NO=ln);
update x_balance set tk=tk-ttk where id=pid;
insert into x_ticket_1 values(ticket.nextval,ln,pid,to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'sit-'||vsit,vss_no,ves_no);
elsif(tsc-ctsc>0)then
for i in 1..tsc loop
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='stand-'||i
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when ctsc=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;
update x_balance set tk=tk+ttk where id=(select owner_id from X_BUS_INFROMATION where LICENSE_NO=ln);
update x_balance set tk=tk-ttk where id=pid;
insert into x_ticket_1 values(ticket.nextval,ln,pid,to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'stand-'||vsit,vss_no,ves_no);
end if;
end if;
end if;
marge_ticket_p;
exception when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X__TICKET_COUNTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X__TICKET_COUNTER" 
(
ln varchar2,
f varchar2,
ft varchar2,
t varchar2,
tt varchar2,
k varchar2,
ttk varchar2,
pid varchar2,
td varchar2
)
is 
vss_no number;
ves_no number;
vdate varchar2(50);
ts number;
tsc number;
cts number;

ctsc number;
vsit number;
vbal number;

begin
select s_no into vss_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(f) and bus_license_no=ln;
select s_no into ves_no from x_bus_has_stop_office,x_stop_office where bus_stop_point=stop_point and lower(location_name)=lower(t) and bus_license_no=ln;

select total_sit,total_stand into ts,tsc from x_bus_infromation where license_no=ln;

if( vss_no<ves_no)then
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
 
if(ts-cts>0)then
for i in 1..ts loop
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='sit-'||i 
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when cts=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;

insert into x_ticket values(ticket.nextval,ln,pid||'-c',to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'sit-'||vsit,vss_no,ves_no);
elsif(tsc-ctsc>0)then
for i in 1..tsc loop
select count(*) into ctsc  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='stand-'||i
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when ctsc=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;

insert into x_ticket values(ticket.nextval,ln,pid||'-c',to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'stand-'||vsit,vss_no,ves_no);
end if;

------
else
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%sit%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit) like '%stand%'
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
 

if(ts-cts>0)then
for i in 1..ts loop
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='sit-'||i 
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when cts=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;

insert into x_ticket_1 values(ticket.nextval,ln,pid||'-c',to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'sit-'||vsit,vss_no,ves_no);
elsif(tsc-ctsc>0)then
for i in 1..tsc loop
select count(*) into ctsc  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(td,'dd-mm-yy') and lower(sit)='stand-'||i
and ((stime>=to_date(ft,'hh:mi am')  and etime<=to_date(tt,'hh:mi am')) or (stime<= to_date(ft,'hh:mi am') and  etime>=to_date(tt,'hh:mi am')));
vsit:=i;
exit when ctsc=0;
end loop;
if(lower(td)='today') then
vdate:=to_char(sysdate,'dd-mm-rr');
else 
vdate:=td;
end if;

insert into x_ticket_1 values(ticket.nextval,ln,pid||'-c',to_date(vdate,'dd-mm-rr'),f,to_date(ft,'hh:mi am'),t,to_date(tt,'hh:mi am'),k,ttk,'stand-'||vsit,vss_no,ves_no);
end if;

end if;
marge_ticket_p;
exception when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X__TIME_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X__TIME_SCHEDULE" 
(
bln varchar2,
bsp number,
sid number,
t varchar2,
iby varchar2,
ty varchar2
)
is
a number;
b number;
c number;
begin
if (lower(ty)=lower('return'))then
select count(*)into a from x_appoint where bus_owner =iby and stuff_id=sid and lower(type)=lower('Counter Stuff');
select count(*)into b from X_TIME_SCHEDULE_1 where BUS_LICENSE_NO=bln  and BUS_STOP_POINT=bsp and to_char(time,'hh:mi am')=t;
if (b=0) then
insert into x_time_schedule_1 values(bln,bsp,to_date(t,'hh:mi am'),up.nextval);
end if;
else
select count(*)into a from x_appoint where bus_owner =iby and stuff_id=sid and lower(type)=lower('Counter Stuff');
select count(*)into b from X_TIME_SCHEDULE where BUS_LICENSE_NO=bln  and BUS_STOP_POINT=bsp and to_char(time,'hh:mi am')=t;
if ( b=0) then
insert into x_time_schedule values(bln,bsp,to_date(t,'hh:mi am'),up.nextval);
end if;
end if;
update X_BUS_INFROMATION set license='c' where LICENSE_NO=bln;
marger_x_time_schedule;
exception when others 
then
null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_APPOINT_X
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_APPOINT_X" 
(vid number,aid number,vdate date,t varchar2)
is
a number;
begin
select count(*) into a from x_appoint where bus_owner=vid and stuff_id=aid; 
if(a=0)then
insert into x_appoint values(vid,aid,vdate,null,t);
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_B_HAS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_B_HAS" 
(
bln varchar2,
bsp number,
sno number,
vkm number,
iby number
)
is
a number;
begin
select count(*) into a from X_BUS_HAS_STOP_OFFICE where bus_license_no=bln and bus_stop_point=bsp;
if(a=0)then
insert into X_BUS_HAS_STOP_OFFICE values(bln,bsp,sno,vkm,iby,sysdate,stop.nextval);
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_BALANCE_TRA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_BALANCE_TRA" (vid number,rid number,vtk number)

is
a number;
begin
select count(*)into a from x_balance where id=rid;
if(a>0) then
update x_balance set tk=tk+vtk where id=rid;
update x_balance set tk=tk-vtk where id=vid;
insert into x_bal_his values(vid,rid,vtk,sysdate);
end if;
exception when others then
null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_BUS__STUFF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_BUS__STUFF" 
(
sid number,
bln varchar2,
st varchar2,
et varchar2,
iby number
)
is
a number;
b number;
begin
select count(*) into a from x_appoint where  bus_owner=iby and stuff_id=sid and (lower(type)=lower('Bus Driver')or lower(type)=lower('Helper') );
select count(*) into b from x_bus_stuff where BUS_LICENSE_NO=bln and stuff_id=sid;
if(lower(st)!=lower(et))then
if (a=1 and b=0) then
insert into x_bus_stuff values(bln,sid,to_date(st,'hh:mi am'),to_date(et,'hh:mi am'));
end if;
end if;
exception
when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_BUS_INFO_X
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_BUS_INFO_X" 

(
vowner number,
vlno varchar2,
vsn varchar2,
vst varchar2,
vr number,
ts number,
sc number,
iby number
)
is
c number;
begin
select count(*)into c from X_BUS_INFROMATION where owner_id=vowner and license_no=vlno;
if (c=0)then
insert into X_BUS_INFROMATION values(vowner,'c',vlno,vsn,vst,vr,ts,sc,'y',to_char(sysdate,'rrrr'),iby,sysdate);
insert into x_bus_status values(vlno,null,null,null);
end if;
exception when others
then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_BUS_STOP_OFFICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_BUS_STOP_OFFICE" 
(

ln varchar2,
rno varchar2,
rname varchar2,
vl1 number,
vl2 number,
vl3 number,
vl4 number,
iby varchar2

)
is
c number;
b number;
begin
select count(*) into c from x_stop_office where (l1 between vl1 and vl2) or (l2 between vl1 and vl2) or (l3 between vl3 and vl4) or (l4 between vl3 and vl4) ;
select count(*) into b from x_stop_office where (l1 between vl2 and vl1) or (l2 between vl2 and vl1) or (l3 between vl4 and vl3) or (l4 between vl4 and vl3) ;
if(c=0 and b=0)then
insert into x_stop_office values(stop.nextval,ln,rno,rname,vl1,vl2,vl3,vl4,iby,sysdate);
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_CANCEL_TICKET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_CANCEL_TICKET" 
(bl varchar2)
is
begin
for i in (select * from x_ticket_p where lower(sit)!='exp' and bus_license_no=bl and to_date(travel_date,'dd-mm-rr')>sysdate) loop
update x_balance set tk=tk+i.taka where id=i.pessenger_id;
update x_balance set tk=tk-i.taka where id=(select owner_id from x_bus_infromation where license_no=i.bus_license_no);
insert into sms select PESSENGER_ID,'Sorry your ticket '||s_no||' cancel for updating time',sysdate,(select TEMP_EMAIL from tab_user where USER_ID=i.PESSENGER_ID) from X_TICKET_P where s_no=i.s_no;
update x_ticket_p set sit='exp' where s_no=i.s_no;


end loop;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_COUNTER__STUFF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_COUNTER__STUFF" 
(
sid number,
bln varchar2,
st varchar2,
et varchar2,
iby number
)
is
a number;
b number;
cc number;
begin
select count(*) into a from x_appoint where  bus_owner=iby and stuff_id=sid and (lower(type)=lower('Counter Stuff') );

select stop_point into cc from X_STOP_OFFICE where lower(location_name)=lower(bln);
select count(*) into b from x_counter_stuff where location_id=cc and stuff_id=sid;
if(lower(st)!=lower(et))then
if (a=1 and b=0) then
insert into x_counter_stuff values(cc,sid,to_date(st,'hh:mi am'),to_date(et,'hh:mi am'));
end if;
end if;

exception
when others then null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_D_TIME_SCHEDULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_D_TIME_SCHEDULE" 
(a number)
is
d number;
begin
select s_no into d from X_TIME_SCHEDULE_C where s_no=a;
insert into delete_his select s_no||' '||BUS_LICENSE_NO||' '||BUS_STOP_POINT||' '||' '||to_char(TIME,'hh:mi am')||' '||pass,user,sysdate 
from X_TIME_SCHEDULE_C where s_no=a;
delete from X_TIME_SCHEDULE_1 where pass=a;
delete from X_TIME_SCHEDULE_C where s_no=a;
delete from X_TIME_SCHEDULE where pass=a;
insert into e_p_by values(user,'DELETE_BUS_TIME_SCHEDULE',a,sysdate);
dbms_output.put_line('Sucessfull');
exception when others then
dbms_output.put_line('No Data Found');
end;

/
--------------------------------------------------------
--  DDL for Procedure X_P_BALANCE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_P_BALANCE" (vid number,vtk out number)

is
begin
select tk into vtk from x_balance where id=vid;
exception when others then
null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_PASS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_PASS" 
(ln varchar2)
is
a NUMBER;
b number;
c varchar2(200);
d number;
e number;
f date;
g number;
ts number;

ct number;
cts number;
vsit number;
begin

select TOTAL_SIT into ts from X_BUS_INFROMATION where LICENSE_NO=ln;
select substr(LATITUDE,14) ,substr(LONGITUDE,13),DESCRIPTION into a,b,c from x_bus_status where  id=ln ;
select stop_point into d from x_stop_office where (a between l1 and l3) and  (b between l2 and l4);
select s_no,time into e,f from x_time_schedule_c where BUS_STOP_POINT=d and bus_license_no=ln  and  time=
(select min(time) from x_time_schedule_c where bus_license_no=ln  and  time>=to_date(to_char(sysdate,'hh:mi am'),'hh:mi am') and BUS_STOP_POINT=d and pass is null);
update x_time_schedule_c set pass=1 where s_no=e;
update x_ticket_p set sit='exp' where etime=f and to_char(travel_date,'dd-mm-rr')=to_char(sysdate,'dd-mm-rr');
select floor((to_date(to_char(sysdate,'hh:mi am'),'hh:mi am')-f)*24*60) into g from dual;



for i in (select * from x_ticket_p where bus_license_no=ln and  etime=(select min( etime) from x_ticket_p where etime<f and bus_license_no=ln )) loop

for j in 1..ts loop
if(i.ss_no<i.es_no)then
select count(*) into cts  from x_ticket where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(i.travel_date,'dd-mm-yy') and lower(sit)='sit-'||j 
and ((stime>=to_date(i.stime,'hh:mi am')  and etime<=to_date(i.etime,'hh:mi am')) or (stime<= to_date(i.stime,'hh:mi am') and  etime>=to_date(i.etime,'hh:mi am')));
else
select count(*) into cts  from x_ticket_1 where BUS_LICENSE_NO=ln  and to_date(TRAVEL_DATE,'dd-mm-yy')=to_date(i.travel_date,'dd-mm-yy') and lower(sit)='sit-'||j 
and ((stime>=to_date(i.stime,'hh:mi am')  and etime<=to_date(i.etime,'hh:mi am')) or (stime<= to_date(i.stime,'hh:mi am') and  etime>=to_date(i.etime,'hh:mi am')));
end if;
vsit:=j;
exit when cts=0;
end loop;
if(cts=0)then
update x_ticket_p set sit='sit-'||vsit where s_no=i.s_no;
end if;
end loop;


update x_bus_status set DESCRIPTION=g ;

exception when others then
null;
end;

/
--------------------------------------------------------
--  DDL for Procedure X_RETURN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ADMIN"."X_RETURN" 
(
f varchar2,
t varchar2,
vdate varchar2,
dis out number
)
is 
aa number:=0;
bb number:=0;
cc number:=0;
vvdate varchar2(50);
begin
if (lower(vdate)=lower('today') or vdate=to_char(sysdate,'dd-mm-rr'))then
vvdate:=to_char(sysdate,'dd-mm-rr');
else
vvdate:=vdate;
end if;
 select to_date(sysdate,'dd-mm-rr')-to_date(vvdate,'dd-mm-rr') into cc from dual;
select count(*) into aa from
(select b.bus_license_no l,location_name,s_no from x_bus_has_stop_office b,x_stop_office s where s.stop_point=b.bus_stop_point
and lower(s.LOCATION_NAME)=lower(f)) a,
(select b.bus_license_no l,location_name,s_no from x_bus_has_stop_office b,x_stop_office s where s.stop_point=b.bus_stop_point
and lower(s.LOCATION_NAME)=lower(t)) b where a.l=b.l and a.s_no-b.s_no<0;--forward
select count(*) into bb from
(select b.bus_license_no l,location_name,s_no from x_bus_has_stop_office b,x_stop_office s where s.stop_point=b.bus_stop_point
and lower(s.LOCATION_NAME)=lower(f)) a,
(select b.bus_license_no l,location_name,s_no from x_bus_has_stop_office b,x_stop_office s where s.stop_point=b.bus_stop_point
and lower(s.LOCATION_NAME)=lower(t)) b where a.l=b.l and a.s_no-b.s_no>0;--return
 if (cc<=-8)then
 dis:=0;
  elsif(cc=0 and aa>0 and bb=0)then
 dis:=1;
 elsif(cc=0 and aa=0 and bb>0)then
 dis:=3;
 elsif(cc<0 and aa>0 and bb=0)then
 dis:=2;
  elsif(cc<0 and aa=0 and bb>0)then
 dis:=4;

 end if;
 exception when others
 then null;
end;

/
