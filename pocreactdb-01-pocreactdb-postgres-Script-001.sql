--this is for existing tables and sequences
--grant all privileges on all tables in schema public to pocreactuser;
--grant usage, select on all sequences in schema public to pocreactuser;

--this is for future new created stuff, here pocreactuser is the role name;
--alter default privileges in schema public revoke all privileges on tables from pocreactuser;
--alter default privileges in schema public revoke all privileges on sequences from pocreactuser;
--revoke all privileges on all tables in schema public from pocreactuser;
--revoke all privileges on all sequences in schema public from pocreactuser;
--revoke all privileges on schema public from pocreactuser;

--alter default privileges in schema public revoke all privileges on tables from pocreactrole;
--alter default privileges in schema public revoke all privileges on sequences from pocreactrole;
--revoke all privileges on all tables in schema public from pocreactrole;
--revoke all privileges on all sequences in schema public from pocreactrole;
--revoke all privileges on schema public from pocreactrole;

--***** 1)
--alter default privileges in schema public revoke all privileges on tables from pocreact_role;
--alter default privileges in schema public revoke all privileges on sequences from pocreact_role;
--revoke all privileges on all tables in schema public from pocreact_role;
--revoke all privileges on all sequences in schema public from pocreact_role;
--revoke all privileges on schema public from pocreact_role;

alter default privileges in schema public revoke all privileges on tables from pocreact_user;
alter default privileges in schema public revoke all privileges on sequences from pocreact_user;
revoke all privileges on all tables in schema public from pocreact_user;
revoke all privileges on all sequences in schema public from pocreact_user;
revoke all privileges on schema public from pocreact_user;


alter default privileges in schema public revoke all privileges on tables from pocreact_admin;
alter default privileges in schema public revoke all privileges on sequences from pocreact_admin;
revoke all privileges on all tables in schema public from pocreact_admin;
revoke all privileges on all sequences in schema public from pocreact_admin;
revoke all privileges on schema public from pocreact_admin;
revoke all privileges on database pocreactdb from pocreact_admin;

--alter default privileges for role pocreact_admin in schema public revoke all privileges on tables from pocreact_admin;
--alter default privileges for role pocreact_admin in schema public revoke all privileges on sequences from pocreact_admin;



-- ==========================================

select current_user;

select oid::regprocedure as function, pg_get_userbyid(proowner) as owner
from pg_catalog.pg_proc where 1=1 and oid = 'text(boolean)'::regprocedure
;


--this is for existing tables
--grant select, insert, update, delete on all tables in schema public to pocreact_user;
--grant usage, select on all sequences in schema public to pocreact_user;
--this is for future tables
--grant usage on schema public to pocreact_user;
--alter default privileges in schema public grant select, insert, update, delete on tables to pocreact_user;
--alter default privileges in schema public grant usage, select on sequences to pocreact_user;


--grant all privileges on all tables in schema public to pocreact_user;
--grant all privileges on all sequences in schema public to pocreact_user;
grant all privileges on schema public to pocreact_admin;
alter default privileges in schema public grant all privileges on tables to pocreact_admin;
alter default privileges in schema public grant all privileges on sequences to pocreact_admin;



--drop table if exists pocreacts;
--create table if not exists pocreacts (
--  id serial not null
--  , title text not null
--  , purchased_date timestamp not null
--  , created_by text not null
--  , created_date timestamp not null default now()
--  , lastmodified_by text not null
--  , lastmodified_date timestamp not null default now()
--  , primary key (id)
--);
--drop table if exists pocreacts2;
--create table if not exists pocreacts2 (
--  id serial not null
--  , title text not null
--  , purchased_date timestamp not null
--  , created_by text not null
--  , created_date timestamp not null default now()
--  , lastmodified_by text not null
--  , lastmodified_date timestamp not null default now()
--  , primary key (id)
--);


reindex database pocreactdb;


select * from pocreacts;
select * from information_schema.table_privileges where 1=1 and table_name like 'pocreacts%' and grantee != 'postgres';


