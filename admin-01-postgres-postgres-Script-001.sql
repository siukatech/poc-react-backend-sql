select * from pg_catalog.pg_stat_activity where 1=1 and datname = 'toydb';
select pg_terminate_backend(pid) from pg_catalog.pg_stat_activity where 1=1 and datname = 'toydb';
--drop database toydb;
drop database toydb with (force);


create database toydb;

--'create user' is a shortcut with LOGIN option to 'create role'
--that means user = role
create user toy_admin with LOGIN encrypted password 'mypass';
grant all privileges on database toydb to toy_admin;
create role toy_user with LOGIN;
create user toy_web with encrypted password 'mypass' in role toy_user;
grant connect on database toydb to toy_user;

--this is required to login as toy_webuser to update
--grant usage on schema public to toy_role;
--grant all privileges on all tables in schema public to toy_role;


select pr.oid, pr.* from pg_roles pr where 1=1 and rolname like 'toy_%';
select pu.usesysid, pu.usename , pu.* from pg_user pu where 1=1 and usename like 'toy_%';
select pr.rolname , pu.usename , * from pg_catalog.pg_auth_members pam, pg_catalog.pg_roles pr, pg_catalog.pg_user pu where 1=1
and pam.roleid = pr.oid and pam.member = pu.usesysid
;
select * from pg_catalog.pg_auth_members where 1=1;
select * from pg_database;

select * from information_schema.role_table_grants where 1=1 and grantee like 'toy%';
select * from information_schema.table_privileges where 1=1 and table_name not like 'pg%';
select * from information_schema.table_privileges where 1=1 and table_name = 'toys';
select * from information_schema.user_mappings where 1=1;
select * from pg_catalog.pg_auth_members where 1=1 and roleid in (select oid from pg_roles where 1=1 and rolname like 'toy%');
--select * from information_schema.role_table_grants where 1=1;
select pg_get_userbyid(pp.proowner), pp.* from pg_catalog.pg_proc pp where 1=1;
select pg_get_userbyid(pc.relowner), pc.* from pg_catalog.pg_class pc where 1=1;



--revoke all on schema public from toyuser;
--reassign owned by toyuser to toyrole;
--drop owned by toyuser;
--revoke all privileges on database toydb from toyuser;
--drop user toy_role;
--drop user toyuser;
--drop role toyuser;
--revoke all privileges on database toydb from toyrole;
--drop owned by toyrole;
--drop role toyrole;
--drop role toyappuser;
----drop user toydb;

--***** 2)
-----reassign owned by toy_role to postgres;
--revoke all privileges on database toydb from toy_role;
--drop owned by toy_role;
--drop role toy_role;
--drop role toy_webuser;

revoke all privileges on database toydb from toy_admin;
revoke all on database toydb from toy_admin;
drop owned by toy_admin;
drop role toy_admin;
revoke all privileges on database toydb from toy_user;
drop owned by toy_user;
drop role toy_user;
drop role toy_web;



--drop database toydb;


select * from pg_catalog.pg_roles where 1=1 and rolname like 'toy%';


select oid::regprocedure as function, pg_get_userbyid(proowner) as owner
from pg_catalog.pg_proc where 1=1 and oid = 'text(boolean)'::regprocedure
;


------------------------------------------------------------------------------


alter database postgres refresh collation version;
alter database template1 refresh collation version;
alter database toydb refresh collation version;
reindex database postgres;
--reindex database toydb;


select * from pg_catalog.pg_stat_activity where 1=1 and datname = 'pocreactdb';
select pg_terminate_backend(pid) from pg_catalog.pg_stat_activity where 1=1 and datname = 'pocreactdb';
--drop database pocreactdb;
drop database pocreactdb with (force);

create database pocreactdb;

--'create user' is a shortcut with LOGIN option to 'create role'
--that means user = role
create user pocreact_admin with LOGIN encrypted password 'mypass';
grant all privileges on database pocreactdb to pocreact_admin;
create role pocreact_user with LOGIN;
create user pocreact_web with encrypted password 'mypass' in role pocreact_user;
grant connect on database pocreactdb to pocreact_user;


revoke all privileges on database pocreactdb from pocreact_admin;
revoke all on database pocreactdb from pocreact_admin;
drop owned by pocreact_admin;
drop role pocreact_admin;
revoke all privileges on database pocreactdb from pocreact_user;
drop owned by pocreact_user;
drop role pocreact_user;
drop role pocreact_web;






































