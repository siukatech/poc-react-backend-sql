select current_user;


--insert into toys (title, purchased_date, created_by, last_modified_by, version_no)
--values ('shf goku', now(), 'admin', 'admin', 1)
--, ('shf gohan', now(), 'admin', 'admin', 1)
--;

select current_user;

select * from toys where 1=1;
select * from toys2 where 1=1;




select
  *
from
  information_schema.table_privileges
where
  1 = 1
  and table_name like 'toys%'
  and grantee != 'postgres'
;

select
  *
from
  shop_groups sg
;
insert into shop_groups (id, name, status, created_by, last_modified_by, version_no)
values (1, '精品', 'ACTIVE', 'admin', 'admin', 1)
, (2, '孤注一扭', 'ACTIVE', 'admin', 'admin', 1)
, (3, 'Carousell', 'ACTIVE', 'admin', 'admin', 1)
, (4, 'G Point', 'ACTIVE', 'admin', 'admin', 1)
, (5, '五月玩具', 'ACTIVE', 'admin', 'admin', 1)
;

select *
from
  pg_catalog.pg_attrdef
where
  1 = 1
  and adrelid = (
    select
      oid
    from
      pg_catalog.pg_class
    where
      1 = 1
      and relname = 'shop_groups'
  );

select * from shop_groups sg where 1=1;


insert into shop_groups (name, status, created_by, last_modified_by, version_no)
values ('爆米', 'ACTIVE', 'admin', 'admin', 1)
, ('玩具模型倉', 'ACTIVE', 'admin', 'admin', 1)
;

, (3, 'Carousell', 'ACTIVE', 'admin', 'admin', 1)
, (4, 'G Point', 'ACTIVE', 'admin', 'admin', 1)
, (5, '五月玩具', 'ACTIVE', 'admin', 'admin', 1)


select * from shops where 1=1;
insert into shops (name, status, shop_group_id, created_by, last_modified_by, version_no)
values ('精品 荃灣', 'ACTIVE', 1, 'admin', 'admin', 1)
, ('孤仔 葵芳', 'ACTIVE', 2, 'admin', 'admin', 1)
, ('Carousell dlc4fun', 'ACTIVE', 3, 'admin', 'admin', 1)
, ('G Point 福仁', 'ACTIVE', 4, 'admin', 'admin', 1)
, ('五月 旺角', 'ACTIVE', 5, 'admin', 'admin', 1)
, ('爆米 Ins', 'ACTIVE', 6, 'admin', 'admin', 1)
, ('模倉 葵芳', 'ACTIVE', 7, 'admin', 'admin', 1)
;

select sg.name, s.name, s.id from shop_groups sg 
inner join shops s on 1=1 and sg.id = s.shop_group_id 
where 1=1
;

  id serial not null
  , name varchar(350) not null
  , purchased_date timestamp not null
  , target_release_date timestamp
  , actual_release_date timestamp
  , price numeric(12,2) not null
  , down_payment numeric(12,2) not null
  , remaining_payment numeric(12,2) not null
  , description text null
  , status varchar(50) not null
  , shop_id int

insert into items (name, purchased_date, price, down_payment, status, shop_id, created_by, last_modified_by, version_no)
values ('shf goku', now(), 'admin', 'admin', 1)
, ('shf gohan', now(), 'admin', 'admin', 1)
;

select * from i18n where 1=1 order by code;

insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('hello', 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', 'admin', 'admin', 1)
, ('toy.title', 'Title', '標題', '标题', 'admin', 'admin', 1)
, ('toy.purchasedDate', 'Purchased Date', '購買日期', '购买日期', 'admin', 'admin', 1)
, ('button.save', 'Save', '儲存', '储存', 'admin', 'admin', 1)
, ('toy.id', 'Id', 'Id', 'Id', 'admin', 'admin', 1)
, ('item.id', 'Id', 'Id', 'Id', 'admin', 'admin', 1)
, ('item.name', 'Name', '名稱', '名称', 'admin', 'admin', 1)
, ('item.description', 'Description', '介紹', '介绍', 'admin', 'admin', 1)
, ('button.view-fullscreen', 'View Fullscreen', '檢視全頁', '检视全页', 'admin', 'admin', 1)
;
insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('menu.lang', 'Lang', '語言', '语言', 'admin', 'admin', 1)
, ('menu.lang.en', 'En', 'En', 'En', 'admin', 'admin', 1)
, ('menu.lang.zh', '繁', '繁', '繁', 'admin', 'admin', 1)
, ('menu.lang.cn', '简', '简', '简', 'admin', 'admin', 1)
;
insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('hello-link', 'Let''s learn React <1>here</1>', '一起來 <1>這裡</1> 學習 React 吧', 'Aprendamos React<1>aquí</1>', 'admin', 'admin', 1)
, ('hello-title', 'My friend', '朋友', '朋友', 'admin', 'admin', 1)
;

insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('menu.toys', 'Toys', '玩具', '玩具', 'admin', 'admin', 1)
, ('menu.toys.all', 'All toys', '全部玩具', '全部玩具', 'admin', 'admin', 1)
, ('menu.toys.add', 'Add new toy', '新增玩具', '新增玩具', 'admin', 'admin', 1)
, ('menu.items', 'Items', '物件', '物件', 'admin', 'admin', 1)
, ('menu.items.all', 'All items', '全部物件', '全部物件', 'admin', 'admin', 1)
, ('menu.items.add', 'Add new item', '新增物件', '新增物件', 'admin', 'admin', 1)
, ('menu.shops', 'Shop', '商舖', '商舖', 'admin', 'admin', 1)
, ('menu.shops.all', 'All shop', '全部商舖', '全部商舖', 'admin', 'admin', 1)
, ('menu.shops.add', 'Add new shop', '新增商舖', '新增商舖', 'admin', 'admin', 1)
, ('menu.about', 'About', 'About', 'About', 'admin', 'admin', 1)
, ('menu.contact', 'Contact', 'Contact', 'Contact', 'admin', 'admin', 1)
, ('menu.faq', 'Faq', 'Faq', 'Faq', 'admin', 'admin', 1)
, ('menu.help', 'Help', 'Help', 'Help', 'admin', 'admin', 1)
;

insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('button.edit', 'Edit', '編輯', '编辑', 'admin', 'admin', 1)
;
insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('button.back', 'Back', '返回', '返回', 'admin', 'admin', 1)
, ('button.cancel', 'Cancel', '取消', '取消', 'admin', 'admin', 1)
, ('button.reset', 'Reset', '重置', '重置', 'admin', 'admin', 1)
;
--delete from i18n where id in (38,39,40);
--update i18n set code = 'button.reset' where code = 'button.reest';
insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('toy.lastModifiedDatetime', 'Last Modified Datetime', '最後編輯時間', '最后编辑时间', 'admin', 'admin', 1)
, ('toy.createdDatetime', 'Created Datetime', '創建時間', '创建时间', 'admin', 'admin', 1)
, ('toy.createdBy', 'Created By', '創建者', '创建者', 'admin', 'admin', 1)
, ('toy.lastModifiedBy', 'Last Modified By', '最後編輯者', '最后编辑者', 'admin', 'admin', 1)
;
insert into i18n (code, message_en, message_zh, message_cn, created_by, last_modified_by, version_no)
values ('toy.versionNo', 'Version No', '版本', '版本', 'admin', 'admin', 1)
;


--update i18n set message_en = 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>'
--, message_zh = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_cn = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and code = 'hello';
--update i18n set message_en = 'Hello, <0>{{firstNameKeyDb}} {{lastNameKeyDb}}</0>'
--, message_zh = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_cn = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and code = 'hello';
--update i18n set message_en = 'Hello, {{firstNameKeyDb}} {{lastNameKeyDb}} {{test1KeyDd}}'
--, message_zh = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_cn = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and code = 'hello';
update i18n set message_en = 'Hello, <0>{{firstNameKeyDb}}</0> <1>{{lastNameKeyDb}}</1>'
, message_zh = '你好, <0><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></0>'
, message_cn = '你好, <1>{{firstNameKeyDb}}</1> <0>{{lastNameKeyDb}}</0>'
where 1=1 and code = 'hello';

--update i18n set code = 'menu.shops', message_en = 'Shops 2'
--, message_zh = '商舖 2', message_cn = '商舖 2'
--where 1=1 and id = 28;


select * from users where 1=1;
insert into users (user_id, name, created_by, last_modified_by, version_no)
values ('app-user-01', 'app-user-01', 'admin', 'admin', 1)
;
update users set public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn83aiRingPf7agaWIPHsOonO5kcecJzB/mZkcwtTGim1jLtfB+RyO1nqsnKlhI6QpOE3+X3/0wdJSFStk3nRO6KeXx/m4rX/Hs/oijV0cwM07cEg1FtAWXJ5uy+gq57EJmGjRTer03B3SXfev1Z6ujFTrOHBblCXeTit1Zd4TjIfZ30YjT34iqBLT8/fawgj0K0HEybX+yZpoGNIqGxnyrK2RWf5R4yN621u9a+lsLj3fEjVzCx4jhhwzLEgw6wC4T0ns+sRl7Q2CIT1ETfeRgSZeAQomZtnkYgYVe/kmKQxzK5qeB+62ZsfYDVdo6VfgaV/EMnV5382Plt/oRQITQIDAQAB'
, private_key = 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCfzdqJGKeA9/tqBpYg8ew6ic7mRx5wnMH+ZmRzC1MaKbWMu18H5HI7WeqycqWEjpCk4Tf5ff/TB0lIVK2TedE7op5fH+bitf8ez+iKNXRzAzTtwSDUW0BZcnm7L6CrnsQmYaNFN6vTcHdJd96/Vnq6MVOs4cFuUJd5OK3Vl3hOMh9nfRiNPfiKoEtPz99rCCPQrQcTJtf7JmmgY0iobGfKsrZFZ/lHjI3rbW71r6WwuPd8SNXMLHiOGHDMsSDDrALhPSez6xGXtDYIhPURN95GBJl4BCiZm2eRiBhV7+SYpDHMrmp4H7rZmx9gNV2jpV+BpX8QydXnfzY+W3+hFAhNAgMBAAECggEAKgT2aCMn9EUAgk4ODsaeH3xZ/3oG2oSVi/+/fPKm3NPHzaP9JnWexdVsXZTAyfy0su4Xik5jxMj/L3o4k/Utm7k0XH3md4l0dlUj56eLoaxfr/6e08fUwVBVCu/IlyftmswEovAzCatialqPIw+pwKi0wFoyQwAE/FZ3exjThPfFElFAjIIbg7H58xvnlIDYlnXo50BroH6HsyW3b5ymSr/FOjuQZTeFnZcxzpQZ6TVrvfhYkUW4gscvP2Q/RNVOHT2WJBXp12OQObG7dxfKjBkxa6NZ/KVPD937XJEDoRg1TfmeD/OuW8sXQIass+JzDN/TjuvAl2pP5i6lUoPefwKBgQDgXZHL0g2QFxt6lp1rxM3tXhML+3Huna+yiylcNMmMcsiheVVeIt6BmnahxHmx20xc9wja/ixHOczqG0cHX7H4Qk02BJCNfLugAHOZ82pj9H9Lr+8ydj4ntdXBICTVJVODgsWDKhTfMC7O61qv8/XrwuKVY+wHMUaS2oEV3G7E2wKBgQC2VfP2an+Q5hA9qoOxyritb9afpXCMNOIYqsO1ZEvixdKvFoCphtyyhQVmEznaLGJgT201CX5MUIicuQr7xkw5RjswkP7IkhASNqfe+k8GQLzZTQkxpmEYDqptN9KmEBbZaXT4L/D1xV/wWJmQEC922F3uuPY1KzIxktVghKMb9wKBgQDKsd3QfEEChs2tbzpirRa5Nf8RGSVxxAWB0JUaFxpqhxxYPOxxsiDAh5JbTMwAcTVI22ilp3DLHB3S9beyorJ+rS9h+Le7Cw/aWe4WDEF2ceE6uIPpW8eFSpIE+owr/5+2NMNJXxAiHj57c0anpUfrqVHYUsBeMxcl/r8Vx+JOdwKBgEljayBBWTru/pZzbTJAT/iuzQnQwu4L0vzurnrx9YE+8j+6pOqW93l7BONC1cQ0nRv6nA/+1DDPMU0zRXJ1K/TZibVQhtwfvgw2p3ad9PSlVd14njy3pNjT/lCbaVOhojC7u3KxiSDC4oyQfK55dUE2cQhGtgJMcpV1biC9AhGdAoGAE76S2yrL9IKBfmfipeoGY+7Bb9N5ryrAyP0u7oNDZBqEtTrAM6rxt7hBzjgXqwqG5g17pTfQTtFb+UozRXVXA/9z3zCyosVdHcoGSsQzyQqivKfRPE0dVS6mTuLGlhyu7GD8mWIMytC/f+xLmB/uHc36RX/z51F5B1em0uHyrPI='
where 1=1 and user_id = 'app-user-01'
;


select * from toys where 1=1;




insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 8-6 - ver', '2022-03-12 00:00:00.000', 'admin', '2023-06-14 18:20:15.111', 'admin', '2023-06-16 10:01:14.169', 1);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:54:00.254', 'admin', '2023-06-16 10:54:00.254', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:55:17.477', 'admin', '2023-06-16 10:55:17.477', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:02:38.682', 'admin', '2023-06-16 11:02:38.682', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:04:21.266', 'admin', '2023-06-16 11:04:21.266', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf frieza (3)', '2022-11-23 00:00:00.000', 'admin', '2023-06-02 15:19:28.208', 'admin', '2023-06-13 14:41:57.939', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf vegeta (1)', '2022-11-23 00:00:00.000', 'admin', '2023-06-13 14:24:35.154', 'admin', '2023-06-13 14:47:21.431', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 1', '2023-04-11 00:00:00.000', 'admin', '2023-06-13 14:56:48.757', 'admin', '2023-06-13 14:56:48.757', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 1', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:03:47.660', 'admin', '2023-06-14 12:03:47.660', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 2', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:12:01.386', 'admin', '2023-06-14 12:12:01.386', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 3', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:13:25.807', 'admin', '2023-06-14 12:13:25.807', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:04:51.694', 'admin', '2023-06-14 15:04:51.694', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:08.415', 'admin', '2023-06-14 15:05:08.415', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:09.713', 'admin', '2023-06-14 15:05:09.713', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:10.686', 'admin', '2023-06-14 15:05:10.686', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:10.852', 'admin', '2023-06-14 15:05:10.852', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:11.022', 'admin', '2023-06-14 15:05:11.022', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:11.752', 'admin', '2023-06-14 15:05:11.752', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:28.445', 'admin', '2023-06-14 15:05:28.445', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:29.739', 'admin', '2023-06-14 15:05:29.739', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:06:44.130', 'admin', '2023-06-14 15:06:44.130', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 5', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:07:16.884', 'admin', '2023-06-14 15:07:16.884', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 5', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:10:00.572', 'admin', '2023-06-14 15:10:00.572', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 6', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:13:56.161', 'admin', '2023-06-14 15:13:56.161', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 6', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:14:56.031', 'admin', '2023-06-14 15:14:56.031', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 7', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 16:08:08.518', 'admin', '2023-06-14 16:08:08.518', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 8', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 16:10:16.217', 'admin', '2023-06-14 16:10:16.217', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 9', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:23:53.370', 'admin', '2023-06-14 16:23:53.370', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 10', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:28:36.362', 'admin', '2023-06-14 16:28:36.362', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 11', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:30:13.367', 'admin', '2023-06-14 16:30:13.367', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 12', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:31:05.180', 'admin', '2023-06-14 16:31:05.180', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 13', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:32:12.769', 'admin', '2023-06-14 16:32:12.769', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 13', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:35:14.408', 'admin', '2023-06-14 16:35:14.408', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 14', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:39:01.986', 'admin', '2023-06-14 16:39:01.986', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 16', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:43:09.872', 'admin', '2023-06-14 16:43:09.872', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 16', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:47:30.334', 'admin', '2023-06-14 16:47:30.334', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 17', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 17:20:31.696', 'admin', '2023-06-14 17:20:31.696', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 8-1', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 22:20:52.579', 'admin', '2023-06-14 22:20:52.579', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 6 - 22', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:13:04.238', 'admin', '2023-06-14 22:50:24.181', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf goku 1', '2023-06-02 00:00:00.000', 'admin', '2023-06-02 15:00:32.037', 'admin', '2023-06-14 23:02:36.943', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf test 15 2', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:40:16.759', 'admin', '2023-06-15 11:59:42.150', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:10:13.963', 'admin', '2023-06-16 11:10:13.963', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:18:15.749', 'admin', '2023-06-16 11:18:15.749', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:26:27.821', 'admin', '2023-06-16 11:26:27.821', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:40:05.044', 'admin', '2023-06-16 11:40:05.044', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:40:44.560', 'admin', '2023-06-16 11:40:44.560', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:42:08.523', 'admin', '2023-06-16 11:42:08.523', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:45:41.527', 'admin', '2023-06-16 11:45:41.527', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:46:45.471', 'admin', '2023-06-16 11:46:45.471', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:46:46.814', 'admin', '2023-06-16 11:46:46.814', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:52:08.581', 'admin', '2023-06-16 11:52:08.581', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 12:05:36.560', 'admin', '2023-06-16 12:05:36.560', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 12:05:39.666', 'admin', '2023-06-16 12:05:39.666', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:32:02.107', 'admin', '2023-06-16 16:32:02.107', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:32:04.662', 'admin', '2023-06-16 16:32:04.662', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:33:15.513', 'admin', '2023-06-16 16:33:15.513', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 17:25:23.533', 'admin', '2023-06-16 17:25:23.533', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 17:26:14.382', 'admin', '2023-06-16 17:26:14.382', 0);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gohan (2-5)', '2023-06-02 00:00:00.000', 'admin', '2023-06-02 15:00:32.037', 'admin', '2023-07-14 17:27:35.322', 5);
insert into items (shop_id, name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values(1, 'shf gamma 2 (3-4)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:00:08.518', 'admin', '2023-07-14 17:27:51.000', 5);

--select * from items where 1=1;




