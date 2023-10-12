
-- https://postgresql.org/docs/16/functions-uuid.html
select gen_random_uuid();

-- *** need to create the extension manually
-- https://postgresql.org/docs/16/uuid-ossp.html
create extension "uuid-ossp";
select uuid_generate_v1();
select uuid_generate_v5('', 'i18n');


drop index if exists i18n_idx1_message_key;
drop table if exists i18n;
create table if not exists i18n (
  id serial not null
--  uid uuid default uuid_generate_v5(gen_random_uuid(), '') not null
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
--  , primary key (uid)
);
create index i18n_idx1_message_key on i18n(message_key);

select * from i18n;

insert into i18n (message_key, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('hello', 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('hello', 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', 'admin', 'admin', 1)
, ('item.title', 'Title', '標題', '标题', 'admin', 'admin', 1)
, ('item.purchasedDate', 'Purchased Date', '購買日期', '购买日期', 'admin', 'admin', 1)


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


drop table if exists users;
create table if not exists users (
  id serial not null
  , username varchar(350) not null
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


drop table if exists shop_groups;

drop table if exists merchants;
create table if not exists merchants (
  id serial not null
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


--select max(id) + 1 from merchants where 1=1;
--alter sequence merchants_id_seq restart with 6;



drop table if exists shops;
create table if not exists shops (
  id serial not null
  , name varchar(350) not null
  , address_full varchar(550)
  , description text
  , status varchar(50) not null
  , merchant_id int
  , created_by varchar(150) not null
  , created_datetime timestamp not null default now()
  , last_modified_by varchar(150) not null
  , last_modified_datetime timestamp not null default now()
  , version_no int not null
  , primary key (id)
  , constraint shops_fk1_merchant_id foreign key(merchant_id) references merchants(id) on delete set null
);

--alter table shops drop constraint shops_fk1_shop_group_id;
--alter table shops rename column shop_group_id to merchant_id;
--alter table shops add constraint shops_fk1_merchant_id foreign key(merchant_id) references merchants(id) on delete set null;


drop index if exists items_fk1_shop_id;
drop table if exists items;
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

alter table items add column user_id int;
alter table items add constraint items_fk2_user_id foreign key(user_id) references users(id) on delete set null;



drop table if exists notis;
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

comment on column notis.rel_type is 'Type of noti, such INSTANT_MSG, SENDING_ERROR and etc';
comment on column notis.rel_id is 'Record id of the correspond type of this noti';
comment on column notis.status is 'Status of this noti, such as READ, UNREAD';

create index notis_idx1_status on notis(status);
create index notis_idx2_rel on notis(rel_type, rel_id);



drop table if exists instant_msgs;
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
);

comment on column instant_msgs.sender_id is 'Sender of this message';
comment on column instant_msgs.user_id is 'Recipient of this message';

create index instant_msgs_idx1_status on instant_msgs(status);
create index instant_msgs_idx2_sender_id on instant_msgs(sender_id);



drop table if exists applications;
create table if not exists applications (
  id serial not null

);


drop table if exists app_permissions;
create table if not exists app_permissions (
  id serial not null
  , app_id id varchar(150) not null
  , resource_id varchar(250) not null
  , access_right varchar(150) not null
);





