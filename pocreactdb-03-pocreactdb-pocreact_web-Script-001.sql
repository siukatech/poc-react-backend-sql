
--select uuid_generate_v1();
select gen_random_uuid();
select uuid_generate_v1();


select current_user;


select
  *
from
  information_schema.table_privileges
where
  1 = 1
  and table_name like 'items%'
  and grantee != 'postgres'
;

select
  *
from
  merchants sg
;

insert into merchants (id, mid, name, status, created_by, last_modified_by, version_no)
values (1, 'animespro', '精品', 'ACTIVE', 'admin', 'admin', 1)
, (2, 'lastchancetoy', '孤注一扭', 'ACTIVE', 'admin', 'admin', 1)
, (3, 'carousell', 'Carousell', 'ACTIVE', 'admin', 'admin', 1)
, (4, 'gpoint', 'G Point 遊戲熱點', 'ACTIVE', 'admin', 'admin', 1)
, (5, 'maytoys', '五月玩具店', 'ACTIVE', 'admin', 'admin', 1)
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
      and relname = 'merchants'
  );

select * from merchants sg where 1=1;


insert into merchants (id, mid, name, status, created_by, last_modified_by, version_no)
values (6, 'popcorntoys', '爆米玩具', 'ACTIVE', 'admin', 'admin', 1)
, (7, 'hobbyland', '玩具模型倉', 'ACTIVE', 'admin', 'admin', 1)
;



select * from shops where 1=1;
insert into shops (name, status, merchant_id, created_by, last_modified_by, version_no)
values ('精品 荃灣', 'ACTIVE', (select id from merchants where 1=1 and mid = 'animespro'), 'admin', 'admin', 1)
, ('孤仔 葵芳', 'ACTIVE', (select id from merchants where 1=1 and mid = 'lastchancetoy'), 'admin', 'admin', 1)
, ('Carousell dlc4fun', 'ACTIVE', (select id from merchants where 1=1 and mid = 'carousell'), 'admin', 'admin', 1)
, ('G Point 福仁', 'ACTIVE', (select id from merchants where 1=1 and mid = 'gpoint'), 'admin', 'admin', 1)
, ('五月 旺角 1', 'ACTIVE', (select id from merchants where 1=1 and mid = 'maytoys'), 'admin', 'admin', 1)
, ('爆米 Ins', 'ACTIVE', (select id from merchants where 1=1 and mid = 'popcorntoys'), 'admin', 'admin', 1)
, ('模倉 葵芳', 'ACTIVE', (select id from merchants where 1=1 and mid = 'hobbyland'), 'admin', 'admin', 1)
;


select sg.name, s.name, s.id, s.name from merchants sg 
inner join shops s on 1=1 and sg.id = s.merchant_id 
where 1=1
;


insert into items (name, created_by, last_modified_by, version_no)
values ('shf goku', 'admin', 'admin', 1)
, ('shf gohan', 'admin', 'admin', 1)
;

select * from i18n where 1=1 order by message_key;
select * from i18n where 1=1 and message_key like '%merchant%' order by message_key;
select * from i18n where 1=1 and message_key like 'merchant.%' order by message_key;
select * from i18n where 1=1 and message_key like 'error.%' order by message_key;
select * from i18n where 1=1 and message_key like 'button.%' order by message_key;
select message_key , message_en , message_tc , message_sc , created_by , last_modified_by , 1 as version_no from i18n where 1=1 and message_key like 'item.%' order by message_key;
--delete from i18n where 1=1 and id in (6, 16, 18, 20);

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('hello', 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}', 'admin', 'admin', 1)
, ('item.title', 'Title', '標題', '标题', 'admin', 'admin', 1)
, ('item.purchasedDate', 'Purchased Date', '購買日期', '购买日期', 'admin', 'admin', 1)
, ('button.save', 'Save', '儲存', '储存', 'admin', 'admin', 1)
, ('item.id', 'Id', 'Id', 'Id', 'admin', 'admin', 1)
, ('item.name', 'Name', '名稱', '名称', 'admin', 'admin', 1)
, ('item.description', 'Description', '介紹', '介绍', 'admin', 'admin', 1)
, ('button.view.fullscreen', 'View Fullscreen', '檢視全頁', '检视全页', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('menu.lang', 'Lang', '語言', '语言', 'admin', 'admin', 1)
, ('menu.lang.en', 'En', 'En', 'En', 'admin', 'admin', 1)
, ('menu.lang.zh', '繁', '繁', '繁', 'admin', 'admin', 1)
, ('menu.lang.cn', '简', '简', '简', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('hello-link', 'Let''s learn React <1>here</1>', '一起來 <1>這裡</1> 學習 React 吧', 'Aprendamos React<1>aquí</1>', 'admin', 'admin', 1)
, ('hello-title', 'My friend', '朋友', '朋友', 'admin', 'admin', 1)
;

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values 
--('menu.items', 'Items', '玩具', '玩具', 'admin', 'admin', 1)
--, ('menu.items.all', 'All items', '全部玩具', '全部玩具', 'admin', 'admin', 1)
--, ('menu.items.add', 'Add new item', '新增玩具', '新增玩具', 'admin', 'admin', 1)
--, 
('menu.items', 'Items', '物件', '物件', 'admin', 'admin', 1)
, ('menu.items.all', 'All items', '全部物件', '全部物件', 'admin', 'admin', 1)
, ('menu.items.add', 'Add new item', '新增物件', '新增物件', 'admin', 'admin', 1)
, ('menu.shops', 'Shops', '店舖', '店舖', 'admin', 'admin', 1)
, ('menu.shops.all', 'All shops', '全部店舖', '全部店铺', 'admin', 'admin', 1)
, ('menu.shops.add', 'Add new shop', '新增店舖', '新增店铺', 'admin', 'admin', 1)
, ('menu.about', 'About', 'About', 'About', 'admin', 'admin', 1)
, ('menu.contact', 'Contact', 'Contact', 'Contact', 'admin', 'admin', 1)
, ('menu.faq', 'Faq', 'Faq', 'Faq', 'admin', 'admin', 1)
, ('menu.help', 'Help', 'Help', 'Help', 'admin', 'admin', 1)
;

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('button.edit', 'Edit', '編輯', '编辑', 'admin', 'admin', 1)
, ('button.back', 'Back', '返回', '返回', 'admin', 'admin', 1)
, ('button.cancel', 'Cancel', '取消', '取消', 'admin', 'admin', 1)
, ('button.reset', 'Reset', '重置', '重置', 'admin', 'admin', 1)
, ('button.upload', 'Upload', '上傳', '上传', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('upload.title', 'Upload', '檔案上傳', '上传', 'admin', 'admin', 1)
, ('attachment.title', 'Attachments', '附件', '附件', 'admin', 'admin', 1)
;
--delete from i18n where message_key in ('upload.title');

--delete from i18n where id in (38,39,40);
--update i18n set message_key = 'button.reset' where message_key = 'button.reest';
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('item.lastModifiedDatetime', 'Last Modified Datetime', '最後編輯時間', '最后编辑时间', 'admin', 'admin', 1)
, ('item.createdDatetime', 'Created Datetime', '創建時間', '创建时间', 'admin', 'admin', 1)
, ('item.createdBy', 'Created By', '創建者', '创建者', 'admin', 'admin', 1)
, ('item.lastModifiedBy', 'Last Modified By', '最後編輯者', '最后编辑者', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('item.versionNo', 'Version No', '版本', '版本', 'admin', 'admin', 1)
;

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('menu.noti.tooltip', 'Notification', '通知', '通知', 'admin', 'admin', 1)
, ('menu.noti.label', 'Notification', '通知', '通知', 'admin', 'admin', 1)
, ('menu.noti.title', 'Notification', '通知', '通知', 'admin', 'admin', 1)
, ('button.mark.as.read', 'Mark as read', '標示為以讀', '标示为以读', 'admin', 'admin', 1)
, ('button.login', 'Login', '登入', '登入', 'admin', 'admin', 1)
, ('button.logout', 'Logout', '登出', '登出', 'admin', 'admin', 1)
, ('login.form', 'Login', '登入', '登入', 'admin', 'admin', 1)
, ('login.username.label', 'User Name', '用戶帳號', '用户帐号', 'admin', 'admin', 1)
, ('login.username.helperText', 'We''ll never share your username', '我們不會分享你的用戶帳號', '我们不会分享你的用户帐号', 'admin', 'admin', 1)
, ('login.password.label', 'Password', '密碼', '密码', 'admin', 'admin', 1)
, ('login.password.helperText', 'We''ll never share your username', '我們不會分享你的密碼', '我们不会分享你的密码', 'admin', 'admin', 1)
, ('app.title', 'Frontend App', 'Frontend App', 'Frontend App', 'admin', 'admin', 1)
;

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('menu.user.profile', 'Profile', '用戶檔案', '用户档案', 'admin', 'admin', 1)
, ('menu.user.account', 'Account', '用戶帳戶', '用户帐户', 'admin', 'admin', 1)
, ('menu.user.dashboard', 'Dashboard', 'Dashboard', 'Dashboard', 'admin', 'admin', 1)
, ('menu.user.settings', 'Settings', '設定', '设定', 'admin', 'admin', 1)
, ('menu.user.logout', 'Logout', '登出', '登出', 'admin', 'admin', 1)
, ('menu.user.tooltip', 'Account', '帳戶', '帐户', 'admin', 'admin', 1)
, ('menu.login', 'Login', '登入', '登入', 'admin', 'admin', 1)
, ('menu.login.tooltip', 'Login', '登入', '登入', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('menu.home', 'Home', '主頁', '主页', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('button.ok', 'OK', 'OK', 'OK', 'admin', 'admin', 1)
, ('form.isDirty', 'Is Dirty?', 'Is Dirty?', 'Is Dirty?', 'admin', 'admin', 1)
, ('item.name.helperText', 'Helper text', 'Helper text', 'Helper text', 'admin', 'admin', 1)
, ('item.purchasedDate.helperText', 'Helper text', 'Helper text', 'Helper text', 'admin', 'admin', 1)
, ('item.form', 'Item Form', '物件表格', '物件表格', 'admin', 'admin', 1)
, ('button.view', 'View', '檢視', '检视', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('warning.beforeunload', 'Are you sure you want to leave? All your entered data will be lost!'
, 'Are you sure you want to leave? All your entered data will be lost!'
, 'Are you sure you want to leave? All your entered data will be lost!', 'admin', 'admin', 1)
;

--delete from i18n where 1=1 and message_key in (
--'error.login.expired', 'error.update.failed', 'warning.access.denied'
--, 'error.login.failed', 'error.access.denied'
--);

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values ('error.login.expired', 'Login expired', '登入失效', '登入失效', 'admin', 'admin', 1)
, ('error.update.failed', 'Update failed', '更新失敗', '更新失败', 'admin', 'admin', 1)
, ('warning.access.denied', 'Access denied', '沒有權限', '没有权限', 'admin', 'admin', 1)
, ('error.login.failed', 'Login failed', '登入失敗', '登入失败', 'admin', 'admin', 1)
, ('error.access.denied', 'Access denied', '沒有權限', '没有权限', 'admin', 'admin', 1)
, ('item.update.completed', 'Update completed', '更新成功', '更新成功', 'admin', 'admin', 1)
, ('error.dialog.title', 'Error', '錯誤', '错误', 'admin', 'admin', 1)
;

insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values 
('menu.merchants', 'Merchants', '商戶', '商户', 'admin', 'admin', 1)
, ('menu.merchants.all', 'All merchants', '全部商戶', '全部商户', 'admin', 'admin', 1)
, ('menu.merchants.add', 'Add new merchant', '新增商戶', '新增商户', 'admin', 'admin', 1)
;
insert into i18n (message_key, message_en, message_tc, message_sc, created_by, last_modified_by, version_no)
values 
('menu.i18n', 'i18n', 'i18n', 'i18n', 'admin', 'admin', 1)
, ('menu.i18n.all', 'All i18n messages', '全部i18n', '全部i18n', 'admin', 'admin', 1)
, ('menu.i18n.add', 'Add new i18n message', '新增i18n', '新增i18n', 'admin', 'admin', 1)
;


INSERT INTO i18n (message_key,message_en,message_tc,message_sc,created_by,last_modified_by,version_no) VALUES
   ('merchant.createdBy','Created By','創建者','创建者','admin','admin',1),
   ('merchant.createdDatetime','Created Datetime','創建時間','创建时间','admin','admin',1),
   ('merchant.description','Description','介紹','介绍','admin','admin',1),
--   ('merchant.form','Merchant Form','商戶表格','商户表格','admin','admin',1),
   ('merchant.title','Merchant Form','商戶表格','商户表格','admin','admin',1),
   ('merchant.id','Id','Id','Id','admin','admin',1),
   ('merchant.id.description','Id Helper text','Id Helper text','Id Helper text','admin','admin',1),
   ('merchant.mid','Mid','Mid','Mid','admin','admin',1),
   ('merchant.lastModifiedBy','Last Modified By','最後編輯者','最后编辑者','admin','admin',1),
   ('merchant.lastModifiedDatetime','Last Modified Datetime','最後編輯時間','最后编辑时间','admin','admin',1),
   ('merchant.name','Name','名稱','名称','admin','admin',1),
   ('merchant.name.description','Name Helper text','名稱 Helper text','名称 Helper text','admin','admin',1),
--   ('merchant.name.helperText','Helper text','Helper text','Helper text','admin','admin',1),
   ('merchant.purchasedDate','Purchased Date','購買日期','购买日期','admin','admin',1),
   ('merchant.purchasedDate.helperText','Helper text','Helper text','Helper text','admin','admin',1),
--   ('merchant.title','Title','標題','标题','admin','admin',1),
   ('merchant.update.completed','Update completed','更新成功','更新成功','admin','admin',1),
   ('merchant.versionNo','Version No','版本','版本','admin','admin',1);
;
 

--update i18n set message_key = 'button.view.fullscreen'
--where 1=1 and message_key = 'button.viewFullscreen'
--;
--update i18n set message_tc = '用戶帳號', message_sc = '用户帐号'
--where 1=1 and message_key = 'login.username.label'
--;
--update i18n set message_tc = '我們不會分享你的用戶帳號', message_sc = '我们不会分享你的用户帐号'
--where 1=1 and message_key = 'login.username.helperText'
--;
--update i18n set message_en = 'Hello, <2><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></2>'
--, message_tc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_sc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and message_key = 'hello';
--update i18n set message_en = 'Hello, <0>{{firstNameKeyDb}} {{lastNameKeyDb}}</0>'
--, message_tc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_sc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and message_key = 'hello';
--update i18n set message_en = 'Hello, {{firstNameKeyDb}} {{lastNameKeyDb}} {{test1KeyDd}}'
--, message_tc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--, message_sc = '你好, {{firstNameKeyDb}} {{lastNameKeyDb}}'
--where 1=1 and message_key = 'hello';
update i18n set message_en = 'Hello, <0>{{firstNameKeyDb}}</0> <1>{{lastNameKeyDb}}</1>'
, message_tc = '你好, <0><1>{{firstNameKeyDb}} {{lastNameKeyDb}}</1></0>'
, message_sc = '你好, <1>{{firstNameKeyDb}}</1> <0>{{lastNameKeyDb}}</0>'
where 1=1 and message_key = 'hello';


select * from i18n where 1=1 and message_key like '%.shops%';
--update i18n set message_key = 'menu.shops', message_en = 'Shops 2'
--, message_tc = '店舖 2', message_sc = '店舖 2'
--where 1=1 and id = 28;
--update i18n set message_en = 'Shops', message_tc = '店舖', message_sc = '店铺' where 1=1 and message_key = 'menu.shops';
--update i18n set message_en = 'Add new shop', message_tc = '全部店舖', message_sc = '全部店铺' where 1=1 and message_key = 'menu.shops.all';
--update i18n set message_en = 'All shops', message_tc = '新增店舖', message_sc = '新增店铺' where 1=1 and message_key = 'menu.shops.add';


select * from users where 1=1;
insert into users (login_id, name, created_by, last_modified_by, version_no)
values ('app-user-01', 'app-user-01', 'admin', 'admin', 1)
;
update users set public_key = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn83aiRingPf7agaWIPHsOonO5kcecJzB/mZkcwtTGim1jLtfB+RyO1nqsnKlhI6QpOE3+X3/0wdJSFStk3nRO6KeXx/m4rX/Hs/oijV0cwM07cEg1FtAWXJ5uy+gq57EJmGjRTer03B3SXfev1Z6ujFTrOHBblCXeTit1Zd4TjIfZ30YjT34iqBLT8/fawgj0K0HEybX+yZpoGNIqGxnyrK2RWf5R4yN621u9a+lsLj3fEjVzCx4jhhwzLEgw6wC4T0ns+sRl7Q2CIT1ETfeRgSZeAQomZtnkYgYVe/kmKQxzK5qeB+62ZsfYDVdo6VfgaV/EMnV5382Plt/oRQITQIDAQAB'
, private_key = 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCfzdqJGKeA9/tqBpYg8ew6ic7mRx5wnMH+ZmRzC1MaKbWMu18H5HI7WeqycqWEjpCk4Tf5ff/TB0lIVK2TedE7op5fH+bitf8ez+iKNXRzAzTtwSDUW0BZcnm7L6CrnsQmYaNFN6vTcHdJd96/Vnq6MVOs4cFuUJd5OK3Vl3hOMh9nfRiNPfiKoEtPz99rCCPQrQcTJtf7JmmgY0iobGfKsrZFZ/lHjI3rbW71r6WwuPd8SNXMLHiOGHDMsSDDrALhPSez6xGXtDYIhPURN95GBJl4BCiZm2eRiBhV7+SYpDHMrmp4H7rZmx9gNV2jpV+BpX8QydXnfzY+W3+hFAhNAgMBAAECggEAKgT2aCMn9EUAgk4ODsaeH3xZ/3oG2oSVi/+/fPKm3NPHzaP9JnWexdVsXZTAyfy0su4Xik5jxMj/L3o4k/Utm7k0XH3md4l0dlUj56eLoaxfr/6e08fUwVBVCu/IlyftmswEovAzCatialqPIw+pwKi0wFoyQwAE/FZ3exjThPfFElFAjIIbg7H58xvnlIDYlnXo50BroH6HsyW3b5ymSr/FOjuQZTeFnZcxzpQZ6TVrvfhYkUW4gscvP2Q/RNVOHT2WJBXp12OQObG7dxfKjBkxa6NZ/KVPD937XJEDoRg1TfmeD/OuW8sXQIass+JzDN/TjuvAl2pP5i6lUoPefwKBgQDgXZHL0g2QFxt6lp1rxM3tXhML+3Huna+yiylcNMmMcsiheVVeIt6BmnahxHmx20xc9wja/ixHOczqG0cHX7H4Qk02BJCNfLugAHOZ82pj9H9Lr+8ydj4ntdXBICTVJVODgsWDKhTfMC7O61qv8/XrwuKVY+wHMUaS2oEV3G7E2wKBgQC2VfP2an+Q5hA9qoOxyritb9afpXCMNOIYqsO1ZEvixdKvFoCphtyyhQVmEznaLGJgT201CX5MUIicuQr7xkw5RjswkP7IkhASNqfe+k8GQLzZTQkxpmEYDqptN9KmEBbZaXT4L/D1xV/wWJmQEC922F3uuPY1KzIxktVghKMb9wKBgQDKsd3QfEEChs2tbzpirRa5Nf8RGSVxxAWB0JUaFxpqhxxYPOxxsiDAh5JbTMwAcTVI22ilp3DLHB3S9beyorJ+rS9h+Le7Cw/aWe4WDEF2ceE6uIPpW8eFSpIE+owr/5+2NMNJXxAiHj57c0anpUfrqVHYUsBeMxcl/r8Vx+JOdwKBgEljayBBWTru/pZzbTJAT/iuzQnQwu4L0vzurnrx9YE+8j+6pOqW93l7BONC1cQ0nRv6nA/+1DDPMU0zRXJ1K/TZibVQhtwfvgw2p3ad9PSlVd14njy3pNjT/lCbaVOhojC7u3KxiSDC4oyQfK55dUE2cQhGtgJMcpV1biC9AhGdAoGAE76S2yrL9IKBfmfipeoGY+7Bb9N5ryrAyP0u7oNDZBqEtTrAM6rxt7hBzjgXqwqG5g17pTfQTtFb+UozRXVXA/9z3zCyosVdHcoGSsQzyQqivKfRPE0dVS6mTuLGlhyu7GD8mWIMytC/f+xLmB/uHc36RX/z51F5B1em0uHyrPI='
where 1=1 and login_id = 'app-user-01'
;


select * from items where 1=1;
select id, name, purchased_date , last_modified_datetime  from items where 1=1 order by last_modified_datetime desc;




insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 8-6 - ver', '2022-03-12 00:00:00.000', 'admin', '2023-06-14 18:20:15.111', 'admin', '2023-06-16 10:01:14.169', 1);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:54:00.254', 'admin', '2023-06-16 10:54:00.254', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:55:17.477', 'admin', '2023-06-16 10:55:17.477', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:02:38.682', 'admin', '2023-06-16 11:02:38.682', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:04:21.266', 'admin', '2023-06-16 11:04:21.266', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf frieza (3)', '2022-11-23 00:00:00.000', 'admin', '2023-06-02 15:19:28.208', 'admin', '2023-06-13 14:41:57.939', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf vegeta (1)', '2022-11-23 00:00:00.000', 'admin', '2023-06-13 14:24:35.154', 'admin', '2023-06-13 14:47:21.431', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 1', '2023-04-11 00:00:00.000', 'admin', '2023-06-13 14:56:48.757', 'admin', '2023-06-13 14:56:48.757', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 1', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:03:47.660', 'admin', '2023-06-14 12:03:47.660', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 2', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:12:01.386', 'admin', '2023-06-14 12:12:01.386', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 3', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 12:13:25.807', 'admin', '2023-06-14 12:13:25.807', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:04:51.694', 'admin', '2023-06-14 15:04:51.694', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:08.415', 'admin', '2023-06-14 15:05:08.415', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:09.713', 'admin', '2023-06-14 15:05:09.713', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:10.686', 'admin', '2023-06-14 15:05:10.686', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:10.852', 'admin', '2023-06-14 15:05:10.852', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:11.022', 'admin', '2023-06-14 15:05:11.022', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:11.752', 'admin', '2023-06-14 15:05:11.752', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:28.445', 'admin', '2023-06-14 15:05:28.445', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:05:29.739', 'admin', '2023-06-14 15:05:29.739', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 4', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:06:44.130', 'admin', '2023-06-14 15:06:44.130', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 5', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:07:16.884', 'admin', '2023-06-14 15:07:16.884', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 5', '2023-06-13 00:00:00.000', 'admin', '2023-06-14 15:10:00.572', 'admin', '2023-06-14 15:10:00.572', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 6', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:13:56.161', 'admin', '2023-06-14 15:13:56.161', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 6', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:14:56.031', 'admin', '2023-06-14 15:14:56.031', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 7', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 16:08:08.518', 'admin', '2023-06-14 16:08:08.518', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 8', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 16:10:16.217', 'admin', '2023-06-14 16:10:16.217', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 9', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:23:53.370', 'admin', '2023-06-14 16:23:53.370', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 10', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:28:36.362', 'admin', '2023-06-14 16:28:36.362', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 11', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:30:13.367', 'admin', '2023-06-14 16:30:13.367', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 12', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:31:05.180', 'admin', '2023-06-14 16:31:05.180', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 13', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:32:12.769', 'admin', '2023-06-14 16:32:12.769', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 13', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:35:14.408', 'admin', '2023-06-14 16:35:14.408', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 14', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:39:01.986', 'admin', '2023-06-14 16:39:01.986', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 16', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:43:09.872', 'admin', '2023-06-14 16:43:09.872', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 16', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:47:30.334', 'admin', '2023-06-14 16:47:30.334', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 17', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 17:20:31.696', 'admin', '2023-06-14 17:20:31.696', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 8-1', '2023-06-08 00:00:00.000', 'admin', '2023-06-14 22:20:52.579', 'admin', '2023-06-14 22:20:52.579', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 6 - 22', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 15:13:04.238', 'admin', '2023-06-14 22:50:24.181', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf goku 1', '2023-06-02 00:00:00.000', 'admin', '2023-06-02 15:00:32.037', 'admin', '2023-06-14 23:02:36.943', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf test 15 2', '2023-06-14 00:00:00.000', 'admin', '2023-06-14 16:40:16.759', 'admin', '2023-06-15 11:59:42.150', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:10:13.963', 'admin', '2023-06-16 11:10:13.963', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:18:15.749', 'admin', '2023-06-16 11:18:15.749', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:26:27.821', 'admin', '2023-06-16 11:26:27.821', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:40:05.044', 'admin', '2023-06-16 11:40:05.044', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:40:44.560', 'admin', '2023-06-16 11:40:44.560', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:42:08.523', 'admin', '2023-06-16 11:42:08.523', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:45:41.527', 'admin', '2023-06-16 11:45:41.527', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:46:45.471', 'admin', '2023-06-16 11:46:45.471', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:46:46.814', 'admin', '2023-06-16 11:46:46.814', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 11:52:08.581', 'admin', '2023-06-16 11:52:08.581', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 12:05:36.560', 'admin', '2023-06-16 12:05:36.560', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 12:05:39.666', 'admin', '2023-06-16 12:05:39.666', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:32:02.107', 'admin', '2023-06-16 16:32:02.107', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:32:04.662', 'admin', '2023-06-16 16:32:04.662', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 16:33:15.513', 'admin', '2023-06-16 16:33:15.513', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 17:25:23.533', 'admin', '2023-06-16 17:25:23.533', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (2)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 17:26:14.382', 'admin', '2023-06-16 17:26:14.382', 0);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gohan (2-5)', '2023-06-02 00:00:00.000', 'admin', '2023-06-02 15:00:32.037', 'admin', '2023-07-14 17:27:35.322', 5);
insert into items (name, purchased_date, created_by, created_datetime, last_modified_by, last_modified_datetime, version_no) values('shf gamma 2 (3-4)', '2023-05-11 00:00:00.000', 'admin', '2023-06-16 10:00:08.518', 'admin', '2023-07-14 17:27:51.000', 5);

--select * from items where 1=1;

select * from users where 1=1;
select * from notis where 1=1;

insert into instant_msgs (subject, message, status, user_id, sender_id, created_by, last_modified_by, version_no)
values ('subject 1', 'message 1', 'UNREAD', 1, 1, 'admin', 'admin', 1)
;

insert into notis (subject, message, status, rel_type, rel_id, user_id, created_by, last_modified_by, version_no)
values ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
, ('subject ', 'message ', 'UNREAD', 'InstantMsg', 1, 1, 'admin', 'admin', 1)
;
update notis set subject = subject || id, message  = message || id where 1=1; 



insert into applications (mid, name, created_by, last_modified_by, version_no)
values ('frontend-app', 'Frontend App', 'admin', 'admin', 1)
;
insert into app_resources (mid, name, app_mid, access_right, created_by, last_modified_by, version_no)
values ('menu.home', 'Menu Home', 'frontend-app', 'view', 'admin', 'admin', 1)
, ('menu.items', 'Menu Items', 'frontend-app', 'view', 'admin', 'admin', 1)
, ('menu.shops', 'Menu Shops', 'frontend-app', 'view', 'admin', 'admin', 1)
, ('menu.merchants', 'Menu Merchants', 'frontend-app', 'view', 'admin', 'admin', 1)
, ('menu.i18n', 'Menu i18n', 'frontend-app', 'view', 'admin', 'admin', 1)


insert into user_roles (mid, name, created_by, last_modified_by, version_no)
values ('role-user-01', 'User 01', 'admin', 'admin', 1)
, ('role-admin-01', 'Admin 01', 'admin', 'admin', 1)
;
insert into user_role_permissions (user_role_mid, app_mid, resource_mid, access_right, created_by, last_modified_by, version_no)
values ('role-user-01', 'frontend-app', 'menu.home', 'view', 'admin', 'admin', 1)
, ('role-user-01', 'frontend-app', 'menu.items', 'view', 'admin', 'admin', 1)
, ('role-user-01', 'frontend-app', 'menu.shops', 'view', 'admin', 'admin', 1)
, ('role-user-01', 'frontend-app', 'menu.merchants', 'view', 'admin', 'admin', 1)
;

insert into user_role_users (user_role_id, user_id, created_by, last_modified_by, version_no)
values (
(select id from user_roles where 1=1 and mid = 'role-user-01')
, (select id from users where 1=1 and login_id = 'app-user-01')
, 'admin', 'admin', 1)
;


select * from applications a where 1=1;
select * from app_resources ar where 1=1;
select * from user_roles ur where 1=1;
select * from user_role_permissions urp where 1=1;
select * from user_role_users uru where 1=1;

select u.login_id, u.id
--, uru.id, uru.user_id, uru.user_role_id, ur.id
, urp.user_role_mid, urp.app_mid , urp.resource_mid , urp.access_right 
from users u
inner join user_role_users uru on 1=1 
and uru.user_id = u.id 
inner join user_roles ur on 1=1  
and ur.id = uru.user_role_id
inner join user_role_permissions urp on 1=1
and urp.user_role_mid = ur.mid 
inner join app_resources ar on 1=1
and ar.mid = urp.resource_mid and ar.app_mid = urp.app_mid 
inner join applications a on 1=1
and a.mid = ar.app_mid 
where 1=1
and u.login_id = 'app-user-01'
;

            select u.login_id as loginId, u.id as userId
            --, uru.id userRoleUserId, uru.user_id as userId2, uru.user_role_id userRoleId, ur.id userRoleId2
            , urp.id, urp.user_role_mid userRoleMid, urp.app_mid appMid, urp.resource_mid resourceMid, urp.access_right accessRight
            from users u
            inner join user_role_users uru on 1=1
            and uru.user_id = u.id 
            inner join user_roles ur on 1=1
            and ur.id = uru.user_role_id
            inner join user_role_permissions urp on 1=1
            and urp.user_role_mid = ur.mid 
            inner join app_resources ar on 1=1
            and ar.mid = urp.resource_mid and ar.app_mid = urp.app_mid 
            inner join applications a on 1=1
            and a.mid = ar.app_mid 
            where 1=1
            and u.login_id = 'app-user-01'
;

    select
        up.* 
    from
        ( select
            u.login_id login_id,
            u.id user_id,
            urp.id id,
            urp.user_role_mid user_role_mid,
            urp.app_mid app_mid,
            urp.resource_mid resource_mid,
            urp.access_right access_right 
        from
            users u 
        inner join
            user_role_users uru 
                on 1=1 
                and uru.user_id = u.id 
        inner join
            user_roles ur 
                on 1=1 
                and ur.id = uru.user_role_id 
        inner join
            user_role_permissions urp 
                on 1=1 
                and urp.user_role_mid = ur.mid 
        inner join
            app_resources ar 
                on 1=1 
                and ar.mid = urp.resource_mid 
                and ar.app_mid = urp.app_mid 
        inner join
            applications a 
                on 1=1 
                and a.mid = ar.app_mid 
        where
            1=1 
--            and u.login_id = 'app-user-01' 
            ) as up 
;


select * from attachments where 1=1;
select * from attachments where 1=1 and id not in ('cc2749f0-882f-4eda-a5c8-ec82472cee97','e3bd9936-72af-4d36-8970-58a2525211b4');
--delete from attachments where 1=1 and id not in ('cc2749f0-882f-4eda-a5c8-ec82472cee97','e3bd9936-72af-4d36-8970-58a2525211b4');



