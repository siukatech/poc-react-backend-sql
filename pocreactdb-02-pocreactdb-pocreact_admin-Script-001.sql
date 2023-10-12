
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


--this is for existing tables
--grant select, insert, update, delete on all tables in schema public to pocreact_user;
--grant usage, select on all sequences in schema public to pocreact_user;
--this is for future tables
--grant usage on schema public to pocreact_user;
alter default privileges in schema public grant select, insert, update, delete on tables to pocreact_user;
alter default privileges in schema public grant usage, select on sequences to pocreact_user;



select current_user;
select * from pg_catalog.pg_sequences;


select oid::regprocedure as function, pg_get_userbyid(proowner) as owner
from pg_catalog.pg_proc where 1=1 and oid = 'text(boolean)'::regprocedure
;


-- https://postgresql.org/docs/16/functions-uuid.html
select gen_random_uuid();

-- *** need to create the extension manually
-- https://postgresql.org/docs/16/uuid-ossp.html
create extension "uuid-ossp";
select uuid_generate_v1();
select uuid_generate_v5('', 'i18n');



drop index if exists i18n_idx1_message_key;
drop table if exists i18n;
drop table if exists user_role_permissions;
drop table if exists user_role_users;


drop index if exists notis_idx1_status;
drop index if exists notis_idx2_rel;
drop table if exists notis;

drop table if exists instant_msgs;


drop index if exists items_fk1_shop_uid;
drop table if exists items;


drop table if exists users;


drop index if exists shops_idx1_mid;
drop table if exists shops;

--drop table if exists shop_groups;

drop index if exists merchants_idx1_mid;
drop table if exists merchants;


drop table if exists app_resources;
drop table if exists applications;


drop table if exists user_roles;



create table if not exists i18n (
  id serial not null
  , message_key varchar(350) not null
  , message_en text null
  , message_zh text null
  , message_cn text null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
);
create index i18n_idx1_message_key on i18n(message_key);


--alter table i18n add column version_no int null;
--update i18n set version_no = 0;
--alter table i18n alter column version_no set not null;

--alter table merchants add column version_no int null;
--update merchants set version_no = 0;
--alter table merchants alter column version_no set not null;
--alter table shops add column version_no int null;
--update shops set version_no = 0;
--alter table shops alter column version_no set not null;
--alter table items add column version_no int null;
--update items set version_no = 0;
--alter table items alter column version_no set not null;




create table if not exists users (
  id serial not null
  , login_id varchar(350) not null
  , name varchar(350) not null
  , public_key text
  , private_key text
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
);

--alter table users rename column user_id to username;
--alter table users rename column username to login_id;
create index users_idx1_login_id on users(login_id);



create table if not exists merchants (
  id serial not null
  , mid varchar(150) not null
  , name varchar(350) not null
  , website varchar(550)
  , description text
  , status varchar(50) not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
);
create unique index merchants_idx1_mid on merchants(mid);


--select max(id) + 1 from merchants where 1=1;
--alter sequence merchants_id_seq restart with 6;



create table if not exists shops (
  id serial not null
--  , mid varchar(150) not null
  , name varchar(350) not null
  , address_full varchar(550)
  , description text
  , status varchar(50) not null
  , merchant_id int
--  , merchant_mid varchar(150)
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint shops_fk1_merchant_id foreign key(merchant_id) references merchants(id) on delete set null
--  , constraint shops_fk1_merchant_mid foreign key(merchant_mid) references merchants(mid) on delete set null
);
--create unique index shops_idx1_mid on shops(mid);

--alter table shops drop constraint shops_fk1_shop_group_id;
--alter table shops rename column shop_group_id to merchant_id;
--alter table shops add constraint shops_fk1_merchant_id foreign key(merchant_id) references merchants(id) on delete set null;




create table if not exists items (
  id serial not null
  , name varchar(350) not null
  , purchased_date timestamp null
  , target_release_date timestamp null
  , actual_release_date timestamp null
  , price numeric(12,2) null
  , down_payment numeric(12,2) null
  , remaining_payment numeric(12,2) null
  , description text null
  , status varchar(50) null
  , shop_id int null
  , user_id int null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint items_fk1_shop_id foreign key(shop_id) references shops(id) on delete set null
  , constraint items_fk2_user_id foreign key(user_id) references users(id) on delete set null
);

--drop trigger items_post_update_remaining_payment_1 ;
--create or replace trigger items_post_update_remaining_payment_1 after insert or update of price, down_payment on items; 
--alter table items add column user_id int;
--alter table items add constraint items_fk2_user_id foreign key(user_id) references users(id) on delete set null;






create table if not exists applications (
  id serial not null
  , mid varchar(150) not null
  , name varchar(350) not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
);
create unique index applications_idx1_mid on applications(mid);


create table if not exists app_resources (
  id serial not null
  , mid varchar(150) not null
  , name varchar(350) not null
  , app_mid varchar(150) not null
  , access_right varchar(150) not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint app_resources_fk1_app_mid foreign key(app_mid) references applications(mid) on delete set null
);
comment on column app_resources.access_right is 'Resource requires access right';
create unique index app_resources_idx1_mid on app_resources(app_mid, mid);




create table if not exists user_roles (
  id serial not null
  , mid varchar(150) not null
  , name varchar(350) not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
);
create unique index user_roles_idx1_mid on user_roles(mid);




create table if not exists user_role_users (
  id serial not null
  , user_role_id int not null
  , user_id int not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint user_role_users_fk1_user_role_id foreign key(user_role_id) references user_roles(id) on delete set null
  , constraint user_role_users_fk2_user_id foreign key(user_id) references users(id) on delete set null
);


create table if not exists user_role_permissions (
  id serial not null
  , user_role_mid varchar(150) not null
  , app_mid varchar(150) not null
  , resource_mid varchar(150) not null
  , access_right varchar(150) not null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint user_role_users_fk1_user_role_mid foreign key(user_role_mid) references user_roles(mid) on delete set null
  , constraint user_role_users_fk2_app_resource_mid foreign key(app_mid, resource_mid) references app_resources(app_mid, mid) on delete set null
);




create table if not exists notis (
  id serial not null
  , subject varchar(350) not null
  , message varchar(500) not null
  , status varchar(50) null
  , rel_type varchar(50) not null
  , rel_id int null
  , user_id int null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint notis_fk1_user_id foreign key(user_id) references users(id) on delete set null
);


comment on column notis.rel_id is 'Record id of the correspond type of this noti';
comment on column notis.rel_type is 'Type of noti, such INSTANT_MSG, SENDING_ERROR and etc';
comment on column notis.status is 'Status of this noti, such as READ, UNREAD';

create index notis_idx1_status on notis(status);
create index notis_idx2_rel on notis(rel_type, rel_id);



create table if not exists instant_msgs (
  id serial not null
  , subject varchar(350) not null
  , message varchar(500) not null
  , status varchar(50) null
  , user_id int null
  , sender_id int null
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint instant_msgs_fk1_user_id foreign key(user_id) references users(id) on delete set null
  , constraint instant_msgs_fk2_sender_id foreign key(sender_id) references users(id) on delete set null
);


comment on column instant_msgs.sender_id is 'Sender of this message';
comment on column instant_msgs.user_id is 'Recipient of this message';

create index instant_msgs_idx1_status on instant_msgs(status);
create index instant_msgs_idx2_sender_id on instant_msgs(sender_id);





