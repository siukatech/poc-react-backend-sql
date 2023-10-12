--this is for existing tables and sequences
--grant all privileges on all tables in schema public to toyuser;
--grant usage, select on all sequences in schema public to toyuser;

--this is for future new created stuff, here toyuser is the role name;
--alter default privileges in schema public revoke all privileges on tables from toyuser;
--alter default privileges in schema public revoke all privileges on sequences from toyuser;
--revoke all privileges on all tables in schema public from toyuser;
--revoke all privileges on all sequences in schema public from toyuser;
--revoke all privileges on schema public from toyuser;

--alter default privileges in schema public revoke all privileges on tables from toyrole;
--alter default privileges in schema public revoke all privileges on sequences from toyrole;
--revoke all privileges on all tables in schema public from toyrole;
--revoke all privileges on all sequences in schema public from toyrole;
--revoke all privileges on schema public from toyrole;

--***** 1)
--alter default privileges in schema public revoke all privileges on tables from toy_role;
--alter default privileges in schema public revoke all privileges on sequences from toy_role;
--revoke all privileges on all tables in schema public from toy_role;
--revoke all privileges on all sequences in schema public from toy_role;
--revoke all privileges on schema public from toy_role;

alter default privileges in schema public revoke all privileges on tables from toy_user;
alter default privileges in schema public revoke all privileges on sequences from toy_user;
revoke all privileges on all tables in schema public from toy_user;
revoke all privileges on all sequences in schema public from toy_user;
revoke all privileges on schema public from toy_user;


alter default privileges in schema public revoke all privileges on tables from toy_admin;
alter default privileges in schema public revoke all privileges on sequences from toy_admin;
revoke all privileges on all tables in schema public from toy_admin;
revoke all privileges on all sequences in schema public from toy_admin;
revoke all privileges on schema public from toy_admin;
revoke all privileges on database toydb from toy_admin;

--alter default privileges for role toy_admin in schema public revoke all privileges on tables from toy_admin;
--alter default privileges for role toy_admin in schema public revoke all privileges on sequences from toy_admin;



-- ==========================================

select current_user;

select oid::regprocedure as function, pg_get_userbyid(proowner) as owner
from pg_catalog.pg_proc where 1=1 and oid = 'text(boolean)'::regprocedure
;


--this is for existing tables
--grant select, insert, update, delete on all tables in schema public to toy_user;
--grant usage, select on all sequences in schema public to toy_user;
--this is for future tables
--grant usage on schema public to toy_user;
--alter default privileges in schema public grant select, insert, update, delete on tables to toy_user;
--alter default privileges in schema public grant usage, select on sequences to toy_user;


--grant all privileges on all tables in schema public to toy_user;
--grant all privileges on all sequences in schema public to toy_user;
grant all privileges on schema public to toy_admin;
alter default privileges in schema public grant all privileges on tables to toy_admin;
alter default privileges in schema public grant all privileges on sequences to toy_admin;



--drop table if exists toys;
--create table if not exists toys (
--	id serial not null
--	, title text not null
--	, purchased_date timestamp not null
--	, created_by text not null
--	, created_date timestamp not null default now()
--	, lastmodified_by text not null
--	, lastmodified_date timestamp not null default now()
--	, primary key (id)
--);
--drop table if exists toys2;
--create table if not exists toys2 (
--	id serial not null
--	, title text not null
--	, purchased_date timestamp not null
--	, created_by text not null
--	, created_date timestamp not null default now()
--	, lastmodified_by text not null
--	, lastmodified_date timestamp not null default now()
--	, primary key (id)
--);


reindex database toydb;


select * from toys;
select * from information_schema.table_privileges where 1=1 and table_name like 'toys%' and grantee != 'postgres';


