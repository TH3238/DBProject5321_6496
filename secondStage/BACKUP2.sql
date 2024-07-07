prompt PL/SQL Developer import file
prompt Created on יום שני 17 יוני 2024 by Tehila Benezra
set feedback off
set define off
prompt Creating CATEGORYS...
create table CATEGORYS
(
  category_id   NUMBER(3) not null,
  category_name VARCHAR2(15) not null
)
;
alter table CATEGORYS
  add primary key (CATEGORY_ID);

prompt Creating CLIENT...
create table CLIENT
(
  client_id      NUMBER(3) not null,
  client_name    VARCHAR2(15) not null,
  is_club_member NUMBER(1) not null
)
;
alter table CLIENT
  add primary key (CLIENT_ID);

prompt Creating ORDERS...
create table ORDERS
(
  order_id       NUMBER(3) not null,
  order_date     DATE not null,
  dellivery_date DATE not null
)
;
alter table ORDERS
  add primary key (ORDER_ID);

prompt Creating PRODUCTS...
create table PRODUCTS
(
  product_id    NUMBER(3) not null,
  product_name  VARCHAR2(15) not null,
  quantity      NUMBER(3) not null,
  product_price NUMBER(3) not null,
  category_id   NUMBER(3) not null
)
;
alter table PRODUCTS
  add primary key (PRODUCT_ID);
alter table PRODUCTS
  add foreign key (CATEGORY_ID)
  references CATEGORYS (CATEGORY_ID);
alter table PRODUCTS
  add constraint CHK_QUANTITY2
  check (Quantity >= 0);

prompt Creating ORDER_PRODUCT...
create table ORDER_PRODUCT
(
  product_id NUMBER(3) not null,
  order_id   NUMBER(3) not null
)
;
alter table ORDER_PRODUCT
  add primary key (PRODUCT_ID, ORDER_ID);
alter table ORDER_PRODUCT
  add foreign key (PRODUCT_ID)
  references PRODUCTS (PRODUCT_ID);
alter table ORDER_PRODUCT
  add foreign key (ORDER_ID)
  references ORDERS (ORDER_ID);

prompt Creating ORDER_SUPPLIER...
create table ORDER_SUPPLIER
(
  supplier_id NUMBER(3) not null,
  order_id    NUMBER(3) not null
)
;
alter table ORDER_SUPPLIER
  add primary key (SUPPLIER_ID, ORDER_ID);
alter table ORDER_SUPPLIER
  add foreign key (ORDER_ID)
  references ORDERS (ORDER_ID);

prompt Creating ORDER_WORKER...
create table ORDER_WORKER
(
  worker_id NUMBER(3) not null,
  order_id  NUMBER(3) not null
)
;
alter table ORDER_WORKER
  add primary key (WORKER_ID, ORDER_ID);
alter table ORDER_WORKER
  add foreign key (ORDER_ID)
  references ORDERS (ORDER_ID);

prompt Creating PURCHASE...
create table PURCHASE
(
  purchase_id    NUMBER(3) not null,
  purchase_date  DATE not null,
  dellivery_date DATE not null
)
;
alter table PURCHASE
  add primary key (PURCHASE_ID);

prompt Creating PURCHASE_CLIENT...
create table PURCHASE_CLIENT
(
  client_id   NUMBER(3) not null,
  purchase_id NUMBER(3) not null
)
;
alter table PURCHASE_CLIENT
  add primary key (CLIENT_ID, PURCHASE_ID);
alter table PURCHASE_CLIENT
  add foreign key (CLIENT_ID)
  references CLIENT (CLIENT_ID);
alter table PURCHASE_CLIENT
  add foreign key (PURCHASE_ID)
  references PURCHASE (PURCHASE_ID);

prompt Creating PURCHASE_PRODUCT...
create table PURCHASE_PRODUCT
(
  product_id  NUMBER(3) not null,
  purchase_id NUMBER(3) not null
)
;
alter table PURCHASE_PRODUCT
  add primary key (PRODUCT_ID, PURCHASE_ID);
alter table PURCHASE_PRODUCT
  add foreign key (PRODUCT_ID)
  references PRODUCTS (PRODUCT_ID);
alter table PURCHASE_PRODUCT
  add foreign key (PURCHASE_ID)
  references PURCHASE (PURCHASE_ID);

prompt Creating WORKER...
create table WORKER
(
  worker_name        VARCHAR2(15) not null,
  worker_id          NUMBER(3) not null,
  start_of_work_date DATE not null
)
;
alter table WORKER
  add primary key (WORKER_ID);

prompt Creating PURCHASE_WORKER...
create table PURCHASE_WORKER
(
  worker_id   NUMBER(3) not null,
  purchase_id NUMBER(3) not null
)
;
alter table PURCHASE_WORKER
  add primary key (WORKER_ID, PURCHASE_ID);
alter table PURCHASE_WORKER
  add foreign key (WORKER_ID)
  references WORKER (WORKER_ID);
alter table PURCHASE_WORKER
  add foreign key (PURCHASE_ID)
  references PURCHASE (PURCHASE_ID);

prompt Creating SUPPLIER...
create table SUPPLIER
(
  supplier_id   NUMBER(3) not null,
  supplier_name VARCHAR2(15) not null,
  region        VARCHAR2(15) default 'Unknown' not null
)
;
alter table SUPPLIER
  add primary key (SUPPLIER_ID);

prompt Disabling triggers for CATEGORYS...
alter table CATEGORYS disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for PRODUCTS...
alter table PRODUCTS disable all triggers;
prompt Disabling triggers for ORDER_PRODUCT...
alter table ORDER_PRODUCT disable all triggers;
prompt Disabling triggers for ORDER_SUPPLIER...
alter table ORDER_SUPPLIER disable all triggers;
prompt Disabling triggers for ORDER_WORKER...
alter table ORDER_WORKER disable all triggers;
prompt Disabling triggers for PURCHASE...
alter table PURCHASE disable all triggers;
prompt Disabling triggers for PURCHASE_CLIENT...
alter table PURCHASE_CLIENT disable all triggers;
prompt Disabling triggers for PURCHASE_PRODUCT...
alter table PURCHASE_PRODUCT disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for PURCHASE_WORKER...
alter table PURCHASE_WORKER disable all triggers;
prompt Disabling triggers for SUPPLIER...
alter table SUPPLIER disable all triggers;
prompt Disabling foreign key constraints for PRODUCTS...
alter table PRODUCTS disable constraint SYS_C007191;
prompt Disabling foreign key constraints for ORDER_PRODUCT...
alter table ORDER_PRODUCT disable constraint SYS_C007195;
alter table ORDER_PRODUCT disable constraint SYS_C007196;
prompt Disabling foreign key constraints for ORDER_SUPPLIER...
alter table ORDER_SUPPLIER disable constraint SYS_C007200;
prompt Disabling foreign key constraints for ORDER_WORKER...
alter table ORDER_WORKER disable constraint SYS_C007204;
prompt Disabling foreign key constraints for PURCHASE_CLIENT...
alter table PURCHASE_CLIENT disable constraint SYS_C007212;
alter table PURCHASE_CLIENT disable constraint SYS_C007213;
prompt Disabling foreign key constraints for PURCHASE_PRODUCT...
alter table PURCHASE_PRODUCT disable constraint SYS_C007217;
alter table PURCHASE_PRODUCT disable constraint SYS_C007218;
prompt Disabling foreign key constraints for PURCHASE_WORKER...
alter table PURCHASE_WORKER disable constraint SYS_C007226;
alter table PURCHASE_WORKER disable constraint SYS_C007227;
prompt Deleting SUPPLIER...
delete from SUPPLIER;
commit;
prompt Deleting PURCHASE_WORKER...
delete from PURCHASE_WORKER;
commit;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting PURCHASE_PRODUCT...
delete from PURCHASE_PRODUCT;
commit;
prompt Deleting PURCHASE_CLIENT...
delete from PURCHASE_CLIENT;
commit;
prompt Deleting PURCHASE...
delete from PURCHASE;
commit;
prompt Deleting ORDER_WORKER...
delete from ORDER_WORKER;
commit;
prompt Deleting ORDER_SUPPLIER...
delete from ORDER_SUPPLIER;
commit;
prompt Deleting ORDER_PRODUCT...
delete from ORDER_PRODUCT;
commit;
prompt Deleting PRODUCTS...
delete from PRODUCTS;
commit;
prompt Deleting ORDERS...
delete from ORDERS;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting CATEGORYS...
delete from CATEGORYS;
commit;
prompt Loading CATEGORYS...
insert into CATEGORYS (category_id, category_name)
values (100, 'irure ipsum do.');
insert into CATEGORYS (category_id, category_name)
values (101, 'rerum sit. ');
insert into CATEGORYS (category_id, category_name)
values (102, 'officiis. ');
insert into CATEGORYS (category_id, category_name)
values (103, 'cum proident. ');
insert into CATEGORYS (category_id, category_name)
values (105, 'dolor. ');
insert into CATEGORYS (category_id, category_name)
values (104, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (107, 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (110, 'mollit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (111, 'distinctio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (112, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (115, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (117, 'ut' || chr(10) || 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (118, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (109, 'ducimus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (113, 'sed' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (114, 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (116, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (120, 'ut' || chr(10) || 'harum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (121, 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (123, 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (124, 'quas' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (126, 'enim' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (127, 'elit' || chr(10) || 'at' || chr(10) || 'ea' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (128, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (129, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (130, 'iusto' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (131, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (132, 'duis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (133, 'et' || chr(10) || 'earum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (135, 'cillum' || chr(10) || 'ea' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (136, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (139, 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (140, 'ullamco' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (141, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (142, 'pariatur' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (143, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (144, 'amet' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (145, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (147, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (148, 'et' || chr(10) || 'et' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (153, 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (156, 'ea' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (157, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (159, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (163, 'voluptatum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (164, 'ut' || chr(10) || 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (166, 'non' || chr(10) || 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (167, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (171, 'autem' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (172, 'tempore' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (174, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (177, 'quis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (178, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (182, 'amet' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (183, 'libero' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (184, 'amet' || chr(10) || 'aute' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (188, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (191, 'do' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (192, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (195, 'quod' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (196, 'sunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (199, 'minus' || chr(10) || 'at' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (200, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (201, 'ut' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (203, 'recusandae' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (205, 'sunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (206, 'sed' || chr(10) || 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (208, 'perferendis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (210, 'blanditiis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (211, 'impedit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (212, 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (213, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (216, 'tempore' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (217, 'sed' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (218, 'et' || chr(10) || 'laborum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (220, 'alias' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (224, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (226, 'maiores' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (227, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (229, 'amet' || chr(10) || 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (230, 'esse' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (232, 'aut' || chr(10) || 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (234, 'tempore' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (235, 'fuga' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (237, 'vero' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (242, 'dignissimos' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (244, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (245, 'laboris' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (247, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (204, 'animi' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (209, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (214, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (215, 'voluptas' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (221, 'quas' || chr(10) || 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (222, 'officia' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (223, 'occaecati' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (202, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (207, 'nobis' || chr(10) || 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (219, 'laboris' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (225, 'ut' || chr(10) || 'et' || chr(10) || '');
commit;
prompt 100 records committed...
insert into CATEGORYS (category_id, category_name)
values (231, 'possimus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (233, 'adipisicing' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (238, 'id' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (241, 'harum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (243, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (246, 'ut' || chr(10) || 'cum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (251, 'in' || chr(10) || 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (253, 'doloribus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (255, 'mollit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (256, 'laborum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (257, 'enim' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (258, 'aut' || chr(10) || 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (259, 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (262, 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (265, 'quo' || chr(10) || 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (268, 'repudiandae' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (269, 'eos' || chr(10) || 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (270, 'et' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (272, 'itaque' || chr(10) || 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (273, 'delectus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (274, 'ad' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (275, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (276, 'fugiat' || chr(10) || 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (280, 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (281, 'quod' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (282, 'reiciendis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (284, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (285, 'et' || chr(10) || 'vero' || chr(10) || 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (286, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (288, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (289, 'sunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (292, 'facilis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (294, 'non' || chr(10) || 'libero' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (298, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (300, 'fugiat' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (302, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (304, 'aut' || chr(10) || 'soluta' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (305, 'cum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (306, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (308, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (309, 'sapiente' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (310, 'mollitia' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (315, 'saepe' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (316, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (317, 'molestiae' || chr(10) || 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (321, 'quidem' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (323, 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (326, 'quos' || chr(10) || 'amet' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (327, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (329, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (332, 'maiores' || chr(10) || 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (333, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (334, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (336, 'nulla' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (341, 'maxime' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (346, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (347, 'ut' || chr(10) || 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (348, 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (349, 'corrupti' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (351, 'at' || chr(10) || 'cumque' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (352, 'eos' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (354, 'maiores' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (356, 'dolores' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (358, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (360, 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (362, 'eligendi' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (363, 'dolore' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (365, 'cupidatat' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (368, 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (370, 'tenetur' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (372, 'a' || chr(10) || 'commodo' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (373, 'commodo' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (376, 'tempor' || chr(10) || 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (378, 'omnis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (380, 'repudiandae' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (382, 'est' || chr(10) || 'ex' || chr(10) || 'ea' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (384, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (387, 'proident' || chr(10) || 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (390, 'in' || chr(10) || 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (391, 'earum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (392, 'vero' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (393, 'saepe' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (394, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (395, 'possimus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (397, 'laborum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (303, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (312, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (313, 'recusandae' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (314, 'impedit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (318, 'do' || chr(10) || 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (320, 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (322, 'officia' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (328, 'soluta' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (331, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (339, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (340, 'veniam' || chr(10) || 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (345, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (350, 'harum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (359, 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (364, 'vero' || chr(10) || '');
commit;
prompt 200 records committed...
insert into CATEGORYS (category_id, category_name)
values (371, 'ea' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (374, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (379, 'dolor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (381, 'nostrud' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (383, 'do' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (385, 'anim' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (386, 'nostrud' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (389, 'delectus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (400, 'dolore' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (403, 'nisi' || chr(10) || 'sit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (405, 'ex' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (407, 'omnis' || chr(10) || 'facere' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (409, 'officia' || chr(10) || 'ad' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (410, 'sit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (414, 'autem' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (415, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (416, 'eiusmod' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (417, 'iusto' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (418, 'possimus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (419, 'esse' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (420, 'consequat' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (423, 'aliquip' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (425, 'repudiandae' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (428, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (429, 'tempor' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (430, 'libero' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (431, 'cumque' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (432, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (433, 'sapiente' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (434, 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (435, 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (441, 'ducimus' || chr(10) || 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (442, 'lorem' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (443, 'omnis' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (444, 'omnis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (447, 'sint' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (450, 'quo' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (451, 'velit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (452, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (453, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (454, 'debitis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (456, 'quis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (458, 'sit' || chr(10) || 'eveniet' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (459, 'et' || chr(10) || 'sunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (460, 'cupiditate' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (461, 'quos' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (462, 'elit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (463, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (464, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (465, 'soluta' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (467, 'ut' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (469, 'eiusmod' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (470, 'dolor' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (471, 'et' || chr(10) || 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (472, 'quis' || chr(10) || 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (475, 'excepteur' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (476, 'incididunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (478, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (480, 'mollitia' || chr(10) || 'ad' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (481, 'atque' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (482, 'hic' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (484, 'elit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (486, 'lorem' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (487, 'anim' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (489, 'optio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (494, 'ut' || chr(10) || 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (495, 'ducimus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (496, 'dolores' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (498, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (499, 'amet' || chr(10) || 'do' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (301, 'aute' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (311, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (319, 'voluptate' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (324, 'nulla' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (325, 'est' || chr(10) || 'facilis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (330, 'et' || chr(10) || 'molestias' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (335, 'proident' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (338, 'elit' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (342, 'qui' || chr(10) || 'esse' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (343, 'quod' || chr(10) || 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (344, 'impedit' || chr(10) || 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (353, 'rerum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (355, 'officia' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (357, 'et' || chr(10) || 'in' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (361, 'nulla' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (366, 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (369, 'quas' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (375, 'quis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (377, 'sit' || chr(10) || 'nisi' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (388, 'vero' || chr(10) || 'ut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (396, 'id' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (399, 'alias' || chr(10) || 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (401, 'distinctio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (402, 'aute' || chr(10) || 'do' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (408, 'culpa' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (411, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (413, 'cum' || chr(10) || 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (421, 'ad' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (422, 'quo' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (424, 'optio' || chr(10) || '');
commit;
prompt 300 records committed...
insert into CATEGORYS (category_id, category_name)
values (427, 'harum' || chr(10) || 'harum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (436, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (438, 'anim' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (439, 'animi' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (440, 'est' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (445, 'corrupti' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (448, 'qui' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (449, 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (457, 'voluptas' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (468, 'dolorum' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (473, 'itaque' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (483, 'cumque' || chr(10) || 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (490, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (491, 'aut' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (492, 'maiores' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (493, 'id' || chr(10) || 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (337, 'omnis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (367, 'doloribus' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (412, 'et' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (426, 'consequat' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (437, 'eu' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (466, 'non' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (474, 'odio' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (479, 'itaque' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (485, 'quis' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (488, 'sint' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (406, 'animi' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (446, 'aute' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (455, 'a' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (477, 'tempor' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (497, 'ex' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (404, 'deserunt' || chr(10) || '');
insert into CATEGORYS (category_id, category_name)
values (500, 'Redford');
insert into CATEGORYS (category_id, category_name)
values (501, 'Alston');
insert into CATEGORYS (category_id, category_name)
values (502, 'Orbit');
insert into CATEGORYS (category_id, category_name)
values (503, 'Vassar');
insert into CATEGORYS (category_id, category_name)
values (504, 'Lapointe');
insert into CATEGORYS (category_id, category_name)
values (505, 'Aiken');
insert into CATEGORYS (category_id, category_name)
values (506, 'McFerrin');
insert into CATEGORYS (category_id, category_name)
values (507, 'McKellen');
insert into CATEGORYS (category_id, category_name)
values (508, 'Crow');
insert into CATEGORYS (category_id, category_name)
values (509, 'Coburn');
insert into CATEGORYS (category_id, category_name)
values (510, 'Shepherd');
insert into CATEGORYS (category_id, category_name)
values (511, 'Thurman');
insert into CATEGORYS (category_id, category_name)
values (512, 'Minogue');
insert into CATEGORYS (category_id, category_name)
values (513, 'Morse');
insert into CATEGORYS (category_id, category_name)
values (514, 'Geldof');
insert into CATEGORYS (category_id, category_name)
values (515, 'Nivola');
insert into CATEGORYS (category_id, category_name)
values (516, 'Rhames');
insert into CATEGORYS (category_id, category_name)
values (517, 'Taylor');
insert into CATEGORYS (category_id, category_name)
values (518, 'McCann');
insert into CATEGORYS (category_id, category_name)
values (519, 'Skaggs');
insert into CATEGORYS (category_id, category_name)
values (520, 'McCain');
insert into CATEGORYS (category_id, category_name)
values (521, 'Lunch');
insert into CATEGORYS (category_id, category_name)
values (522, 'Brolin');
insert into CATEGORYS (category_id, category_name)
values (523, 'Brown');
insert into CATEGORYS (category_id, category_name)
values (524, 'Ricci');
insert into CATEGORYS (category_id, category_name)
values (525, 'Dalton');
insert into CATEGORYS (category_id, category_name)
values (526, 'Gershon');
insert into CATEGORYS (category_id, category_name)
values (527, 'Negbaur');
insert into CATEGORYS (category_id, category_name)
values (528, 'Rosas');
insert into CATEGORYS (category_id, category_name)
values (529, 'Gibbons');
insert into CATEGORYS (category_id, category_name)
values (530, 'Diesel');
insert into CATEGORYS (category_id, category_name)
values (531, 'Reinhold');
insert into CATEGORYS (category_id, category_name)
values (532, 'von Sydow');
insert into CATEGORYS (category_id, category_name)
values (533, 'Gosdin');
insert into CATEGORYS (category_id, category_name)
values (534, 'Conroy');
insert into CATEGORYS (category_id, category_name)
values (535, 'Eckhart');
insert into CATEGORYS (category_id, category_name)
values (536, 'Birch');
insert into CATEGORYS (category_id, category_name)
values (537, 'Gary');
insert into CATEGORYS (category_id, category_name)
values (538, 'David');
insert into CATEGORYS (category_id, category_name)
values (539, 'Mattea');
insert into CATEGORYS (category_id, category_name)
values (540, 'Vaughan');
insert into CATEGORYS (category_id, category_name)
values (541, 'Hanley');
insert into CATEGORYS (category_id, category_name)
values (542, 'Stevenson');
insert into CATEGORYS (category_id, category_name)
values (543, 'Winans');
insert into CATEGORYS (category_id, category_name)
values (544, 'Presley');
insert into CATEGORYS (category_id, category_name)
values (545, 'Checker');
insert into CATEGORYS (category_id, category_name)
values (546, 'Puckett');
insert into CATEGORYS (category_id, category_name)
values (547, 'Overstreet');
insert into CATEGORYS (category_id, category_name)
values (548, 'Bruce');
insert into CATEGORYS (category_id, category_name)
values (549, 'Garber');
insert into CATEGORYS (category_id, category_name)
values (550, 'Pleasure');
insert into CATEGORYS (category_id, category_name)
values (551, 'Levert');
insert into CATEGORYS (category_id, category_name)
values (552, 'Nightingale');
insert into CATEGORYS (category_id, category_name)
values (553, 'Wiest');
insert into CATEGORYS (category_id, category_name)
values (554, 'Renfro');
insert into CATEGORYS (category_id, category_name)
values (555, 'Frampton');
insert into CATEGORYS (category_id, category_name)
values (556, 'Pitney');
insert into CATEGORYS (category_id, category_name)
values (557, 'Yorn');
insert into CATEGORYS (category_id, category_name)
values (558, 'Danger');
insert into CATEGORYS (category_id, category_name)
values (559, 'Khan');
insert into CATEGORYS (category_id, category_name)
values (560, 'Wen');
insert into CATEGORYS (category_id, category_name)
values (561, 'Evans');
insert into CATEGORYS (category_id, category_name)
values (562, 'Gough');
insert into CATEGORYS (category_id, category_name)
values (563, 'Bacon');
insert into CATEGORYS (category_id, category_name)
values (564, 'Garber');
insert into CATEGORYS (category_id, category_name)
values (565, 'Collins');
insert into CATEGORYS (category_id, category_name)
values (566, 'Matheson');
insert into CATEGORYS (category_id, category_name)
values (567, 'Morton');
commit;
prompt 400 records committed...
insert into CATEGORYS (category_id, category_name)
values (568, 'Sinise');
insert into CATEGORYS (category_id, category_name)
values (569, 'Cummings');
insert into CATEGORYS (category_id, category_name)
values (570, 'Gambon');
insert into CATEGORYS (category_id, category_name)
values (571, 'Ribisi');
insert into CATEGORYS (category_id, category_name)
values (572, 'Paul');
insert into CATEGORYS (category_id, category_name)
values (573, 'Macht');
insert into CATEGORYS (category_id, category_name)
values (574, 'Vaughan');
insert into CATEGORYS (category_id, category_name)
values (575, 'Hirsch');
insert into CATEGORYS (category_id, category_name)
values (576, 'Pearce');
insert into CATEGORYS (category_id, category_name)
values (577, 'Hamilton');
insert into CATEGORYS (category_id, category_name)
values (578, 'Miller');
insert into CATEGORYS (category_id, category_name)
values (579, 'Beck');
insert into CATEGORYS (category_id, category_name)
values (580, 'Parish');
insert into CATEGORYS (category_id, category_name)
values (581, 'Burns');
insert into CATEGORYS (category_id, category_name)
values (582, 'Lennix');
insert into CATEGORYS (category_id, category_name)
values (583, 'Hackman');
insert into CATEGORYS (category_id, category_name)
values (584, 'Osmond');
insert into CATEGORYS (category_id, category_name)
values (585, 'Heatherly');
insert into CATEGORYS (category_id, category_name)
values (586, 'McCann');
insert into CATEGORYS (category_id, category_name)
values (587, 'Hartnett');
insert into CATEGORYS (category_id, category_name)
values (588, 'Scorsese');
insert into CATEGORYS (category_id, category_name)
values (589, 'Caldwell');
insert into CATEGORYS (category_id, category_name)
values (590, 'Lauper');
insert into CATEGORYS (category_id, category_name)
values (591, 'Richter');
insert into CATEGORYS (category_id, category_name)
values (592, 'Kahn');
insert into CATEGORYS (category_id, category_name)
values (593, 'Stevens');
insert into CATEGORYS (category_id, category_name)
values (594, 'Branagh');
insert into CATEGORYS (category_id, category_name)
values (595, 'Kimball');
insert into CATEGORYS (category_id, category_name)
values (596, 'Stuermer');
insert into CATEGORYS (category_id, category_name)
values (597, 'Owen');
insert into CATEGORYS (category_id, category_name)
values (598, 'Sarandon');
insert into CATEGORYS (category_id, category_name)
values (599, 'Chappelle');
insert into CATEGORYS (category_id, category_name)
values (600, 'Hawn');
insert into CATEGORYS (category_id, category_name)
values (601, 'Vincent');
insert into CATEGORYS (category_id, category_name)
values (602, 'Goldwyn');
insert into CATEGORYS (category_id, category_name)
values (603, 'Paymer');
insert into CATEGORYS (category_id, category_name)
values (604, 'Ammons');
insert into CATEGORYS (category_id, category_name)
values (605, 'Savage');
insert into CATEGORYS (category_id, category_name)
values (606, 'Lofgren');
insert into CATEGORYS (category_id, category_name)
values (607, 'Brody');
insert into CATEGORYS (category_id, category_name)
values (608, 'Strong');
insert into CATEGORYS (category_id, category_name)
values (609, 'Kattan');
insert into CATEGORYS (category_id, category_name)
values (610, 'Oldman');
insert into CATEGORYS (category_id, category_name)
values (611, 'Levin');
insert into CATEGORYS (category_id, category_name)
values (612, 'Zane');
insert into CATEGORYS (category_id, category_name)
values (613, 'Cetera');
insert into CATEGORYS (category_id, category_name)
values (614, 'Holmes');
insert into CATEGORYS (category_id, category_name)
values (615, 'Vaughn');
insert into CATEGORYS (category_id, category_name)
values (616, 'Channing');
insert into CATEGORYS (category_id, category_name)
values (617, 'Phifer');
insert into CATEGORYS (category_id, category_name)
values (618, 'Stevens');
insert into CATEGORYS (category_id, category_name)
values (619, 'Brody');
insert into CATEGORYS (category_id, category_name)
values (620, 'Twilley');
insert into CATEGORYS (category_id, category_name)
values (621, 'Clooney');
insert into CATEGORYS (category_id, category_name)
values (622, 'Vassar');
insert into CATEGORYS (category_id, category_name)
values (623, 'Lucas');
insert into CATEGORYS (category_id, category_name)
values (624, 'Farina');
insert into CATEGORYS (category_id, category_name)
values (625, 'Marshall');
insert into CATEGORYS (category_id, category_name)
values (626, 'Pitney');
insert into CATEGORYS (category_id, category_name)
values (627, 'Scaggs');
insert into CATEGORYS (category_id, category_name)
values (628, 'Cattrall');
insert into CATEGORYS (category_id, category_name)
values (629, 'Whitley');
insert into CATEGORYS (category_id, category_name)
values (630, 'Dunst');
insert into CATEGORYS (category_id, category_name)
values (631, 'DeLuise');
insert into CATEGORYS (category_id, category_name)
values (632, 'Nicholson');
insert into CATEGORYS (category_id, category_name)
values (633, 'Kingsley');
insert into CATEGORYS (category_id, category_name)
values (634, 'Van Damme');
insert into CATEGORYS (category_id, category_name)
values (635, 'Trevino');
insert into CATEGORYS (category_id, category_name)
values (636, 'Lucas');
insert into CATEGORYS (category_id, category_name)
values (637, 'Numan');
insert into CATEGORYS (category_id, category_name)
values (638, 'Caldwell');
insert into CATEGORYS (category_id, category_name)
values (639, 'Perry');
insert into CATEGORYS (category_id, category_name)
values (640, 'Keith');
insert into CATEGORYS (category_id, category_name)
values (641, 'Pollak');
insert into CATEGORYS (category_id, category_name)
values (642, 'Donelly');
insert into CATEGORYS (category_id, category_name)
values (643, 'Flatts');
insert into CATEGORYS (category_id, category_name)
values (644, 'Carter');
insert into CATEGORYS (category_id, category_name)
values (645, 'Def');
insert into CATEGORYS (category_id, category_name)
values (646, 'Forrest');
insert into CATEGORYS (category_id, category_name)
values (647, 'Yankovic');
insert into CATEGORYS (category_id, category_name)
values (648, 'Thomson');
insert into CATEGORYS (category_id, category_name)
values (649, 'Herrmann');
insert into CATEGORYS (category_id, category_name)
values (650, 'Brolin');
insert into CATEGORYS (category_id, category_name)
values (651, 'Dukakis');
insert into CATEGORYS (category_id, category_name)
values (652, 'Walker');
insert into CATEGORYS (category_id, category_name)
values (653, 'Botti');
insert into CATEGORYS (category_id, category_name)
values (654, 'Cotton');
insert into CATEGORYS (category_id, category_name)
values (655, 'McLachlan');
insert into CATEGORYS (category_id, category_name)
values (656, 'Field');
insert into CATEGORYS (category_id, category_name)
values (657, 'Ali');
insert into CATEGORYS (category_id, category_name)
values (658, 'Costner');
insert into CATEGORYS (category_id, category_name)
values (659, 'Ellis');
insert into CATEGORYS (category_id, category_name)
values (660, 'Dean');
insert into CATEGORYS (category_id, category_name)
values (661, 'Beckham');
insert into CATEGORYS (category_id, category_name)
values (662, 'Shearer');
insert into CATEGORYS (category_id, category_name)
values (663, 'Malone');
insert into CATEGORYS (category_id, category_name)
values (664, 'Soda');
insert into CATEGORYS (category_id, category_name)
values (665, 'Holiday');
insert into CATEGORYS (category_id, category_name)
values (666, 'Tarantino');
insert into CATEGORYS (category_id, category_name)
values (667, 'Adkins');
commit;
prompt 500 records committed...
insert into CATEGORYS (category_id, category_name)
values (668, 'Wilder');
insert into CATEGORYS (category_id, category_name)
values (669, 'Andrews');
insert into CATEGORYS (category_id, category_name)
values (670, 'Bullock');
insert into CATEGORYS (category_id, category_name)
values (671, 'Neil');
insert into CATEGORYS (category_id, category_name)
values (672, 'Kimball');
insert into CATEGORYS (category_id, category_name)
values (673, 'Marsden');
insert into CATEGORYS (category_id, category_name)
values (674, 'Jenkins');
insert into CATEGORYS (category_id, category_name)
values (675, 'Cornell');
insert into CATEGORYS (category_id, category_name)
values (676, 'Rhys-Davies');
insert into CATEGORYS (category_id, category_name)
values (677, 'Bergen');
insert into CATEGORYS (category_id, category_name)
values (678, 'Lofgren');
insert into CATEGORYS (category_id, category_name)
values (679, 'Mellencamp');
insert into CATEGORYS (category_id, category_name)
values (680, 'Briscoe');
insert into CATEGORYS (category_id, category_name)
values (681, 'Osborne');
insert into CATEGORYS (category_id, category_name)
values (682, 'Wells');
insert into CATEGORYS (category_id, category_name)
values (683, 'Phifer');
insert into CATEGORYS (category_id, category_name)
values (684, 'Sylvian');
insert into CATEGORYS (category_id, category_name)
values (685, 'Detmer');
insert into CATEGORYS (category_id, category_name)
values (686, 'Tippe');
insert into CATEGORYS (category_id, category_name)
values (687, 'Law');
insert into CATEGORYS (category_id, category_name)
values (688, 'Coleman');
insert into CATEGORYS (category_id, category_name)
values (689, 'Wariner');
insert into CATEGORYS (category_id, category_name)
values (690, 'Curfman');
insert into CATEGORYS (category_id, category_name)
values (691, 'Nunn');
insert into CATEGORYS (category_id, category_name)
values (692, 'Soul');
insert into CATEGORYS (category_id, category_name)
values (693, 'Sedaka');
insert into CATEGORYS (category_id, category_name)
values (694, 'Sawa');
insert into CATEGORYS (category_id, category_name)
values (695, 'Biel');
insert into CATEGORYS (category_id, category_name)
values (696, 'Marley');
insert into CATEGORYS (category_id, category_name)
values (697, 'Woodard');
insert into CATEGORYS (category_id, category_name)
values (698, 'Evans');
insert into CATEGORYS (category_id, category_name)
values (699, 'Lorenz');
commit;
prompt 532 records loaded
prompt Loading CLIENT...
insert into CLIENT (client_id, client_name, is_club_member)
values (627, 'Rosanne', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (496, 'Gwyneth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (818, 'Larry', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (206, 'Joey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (563, 'Eliza', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (126, 'Robin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (615, 'Gina', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (551, 'Nastassja', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (592, 'Angela', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (898, 'Domingo', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (700, 'Adam', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (727, 'Simon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (115, 'Leon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (349, 'Anita', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (244, 'Lauren', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (487, 'Henry', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (685, 'Famke', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (462, 'Mia', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (544, 'Celia', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (193, 'Kevn', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (951, 'Jack', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (611, 'Willem', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (217, 'Murray', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (459, 'Louise', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (597, 'Judge', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (504, 'Hal', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (536, 'Rascal', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (312, 'Rade', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (308, 'Bryan', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (791, 'Henry', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (373, 'Tim', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (513, 'Lupe', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (291, 'Kurtwood', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (868, 'Geoffrey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (975, 'Jared', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (928, 'Jeremy', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (147, 'Orlando', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (896, 'Viggo', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (489, 'Collective', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (832, 'Dustin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (368, 'Kathleen', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (830, 'Melanie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (701, 'Leon', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (492, 'Jason', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (581, 'Mary Beth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (301, 'Elle', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (978, 'Tyrone', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (764, 'Maria', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (704, 'Wayman', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (728, 'Louise', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (512, 'Lynette', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (400, 'Roberta', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (555, 'Ed', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (423, 'Kenneth', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (837, 'Balthazar', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (935, 'Rebecca', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (730, 'Samuel', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (805, 'Rebeka', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (630, 'Lonnie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (388, 'Elvis', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (924, 'Joaquim', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (348, 'Thin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (550, 'Carol', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (998, 'Tyrone', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (327, 'Max', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (608, 'Roberta', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (772, 'Treat', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (251, 'Jared', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (405, 'Hector', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (955, 'Noah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (834, 'Caroline', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (360, 'Wes', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (296, 'Busta', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (920, 'Stanley', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (501, 'Geoffrey', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (932, 'Ernie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (305, 'Armand', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (142, 'Chloe', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (377, 'Azucar', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (200, 'Denise', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (1, 'Franco', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (2, 'Chazz', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (3, 'Rita', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (4, 'Gilberto', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (5, 'Gabrielle', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (6, 'Arturo', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (7, 'Sona', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (8, 'Kylie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (9, 'Lila', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (10, 'Herbie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (11, 'Grant', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (12, 'Sinead', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (13, 'Sinead', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (14, 'Edie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (15, 'Fats', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (16, 'Blair', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (17, 'Austin', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (18, 'Hal', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (19, 'Sheryl', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (20, 'Gaby', 0);
commit;
prompt 100 records committed...
insert into CLIENT (client_id, client_name, is_club_member)
values (21, 'Charlize', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (22, 'Tommy', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (23, 'Charles', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (24, 'Johnnie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (25, 'Candice', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (26, 'Shelby', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (27, 'Hikaru', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (28, 'Kenneth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (29, 'Dermot', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (30, 'Steve', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (31, 'Solomon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (32, 'Zooey', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (33, 'Tzi', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (34, 'Penelope', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (35, 'Gordie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (36, 'Julianna', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (37, 'Gavin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (38, 'Keith', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (39, 'Alessandro', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (40, 'Christopher', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (41, 'Bobbi', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (42, 'Talvin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (43, 'Alice', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (44, 'Jared', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (45, 'Cherry', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (46, 'Nelly', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (47, 'Maureen', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (48, 'Linda', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (49, 'Rory', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (50, 'Curtis', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (51, 'Sheryl', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (52, 'Lin', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (53, 'Jarvis', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (54, 'Randy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (55, 'Peabo', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (56, 'Scott', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (57, 'Mekhi', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (58, 'Jackie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (59, 'Avril', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (60, 'Curt', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (61, 'Edward', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (62, 'Jeanne', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (63, 'Raul', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (64, 'Mia', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (65, 'Miki', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (66, 'Chloe', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (67, 'Stewart', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (68, 'Kylie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (69, 'Michelle', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (70, 'Nigel', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (71, 'Walter', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (72, 'Keith', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (73, 'Beverley', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (74, 'Ruth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (75, 'Corey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (76, 'Nelly', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (77, 'Sarah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (78, 'Saul', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (79, 'Stewart', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (80, 'Sarah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (81, 'Lydia', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (82, 'Lili', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (83, 'Rita', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (84, 'Matthew', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (85, 'Seann', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (86, 'Gena', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (87, 'Powers', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (88, 'Stephen', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (89, 'Seth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (90, 'Carrie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (91, 'Wesley', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (92, 'Annie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (93, 'Rueben', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (94, 'Olympia', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (95, 'Vivica', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (96, 'Leo', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (97, 'Sylvester', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (98, 'Stevie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (99, 'Solomon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (100, 'Guy', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (101, 'Kurtwood', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (102, 'Miriam', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (103, 'Kelly', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (104, 'Juliana', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (105, 'Lili', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (106, 'Philip', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (107, 'Taylor', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (108, 'Melba', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (109, 'Ralph', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (110, 'Rowan', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (111, 'Holland', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (112, 'Ted', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (113, 'Wally', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (114, 'Brenda', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (116, 'Kenneth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (117, 'Roddy', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (118, 'Rawlins', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (119, 'Bebe', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (120, 'Machine', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (121, 'Todd', 0);
commit;
prompt 200 records committed...
insert into CLIENT (client_id, client_name, is_club_member)
values (122, 'Neneh', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (123, 'Gabriel', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (124, 'Ceili', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (125, 'Shannon', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (127, 'Terence', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (128, 'Rose', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (129, 'Harvey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (130, 'Mykelti', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (131, 'Angelina', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (132, 'Carla', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (133, 'Joey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (134, 'Natasha', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (135, 'Maury', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (136, 'Elijah', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (137, 'Rosario', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (138, 'Joe', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (139, 'Joely', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (140, 'Jody', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (141, 'Vendetta', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (143, 'Nick', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (144, 'Wayman', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (145, 'Rich', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (146, 'Mika', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (148, 'Juice', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (149, 'Talvin', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (150, 'Kate', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (151, 'Rod', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (152, 'Fisher', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (153, 'Donald', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (154, 'Ashley', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (155, 'Joseph', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (156, 'Ricky', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (157, 'Kurtwood', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (158, 'Meredith', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (159, 'Faye', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (160, 'Ronnie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (161, 'Armin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (162, 'Larnelle', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (163, 'Goldie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (164, 'Connie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (165, 'Cloris', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (166, 'Eugene', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (167, 'Luis', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (168, 'Elvis', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (169, 'Halle', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (170, 'Alice', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (171, 'Hilton', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (172, 'Mae', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (173, 'Norm', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (174, 'Scarlett', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (175, 'Meredith', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (176, 'Laura', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (177, 'Cary', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (178, 'Harvey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (179, 'Jodie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (180, 'Balthazar', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (181, 'Yaphet', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (182, 'Claire', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (183, 'Greg', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (184, 'Kurtwood', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (185, 'Johnnie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (186, 'Howie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (187, 'Carla', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (188, 'Madeleine', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (189, 'Ellen', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (190, 'Joe', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (191, 'Barbara', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (192, 'Celia', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (194, 'Noah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (195, 'Anthony', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (196, 'Davey', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (197, 'Mos', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (198, 'Drew', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (199, 'Sylvester', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (201, 'Walter', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (202, 'Percy', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (203, 'Joshua', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (204, 'Red', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (205, 'Maria', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (207, 'Emmylou', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (208, 'Gerald', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (209, 'Gary', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (210, 'Matt', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (211, 'Maura', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (212, 'Alan', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (213, 'Darren', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (214, 'Nancy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (215, 'Gran', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (216, 'Bonnie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (218, 'Chazz', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (219, 'Christina', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (220, 'Henry', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (221, 'Rascal', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (222, 'Hilary', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (223, 'Jack', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (224, 'Merrilee', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (225, 'Boyd', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (226, 'Nick', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (227, 'Lynn', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (228, 'Blair', 1);
commit;
prompt 300 records committed...
insert into CLIENT (client_id, client_name, is_club_member)
values (229, 'Cyndi', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (230, 'Marc', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (231, 'Frank', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (232, 'Sylvester', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (233, 'Mint', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (234, 'Cyndi', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (235, 'Ralph', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (236, 'Tommy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (237, 'Jennifer', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (238, 'Kenneth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (239, 'Ty', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (240, 'Gil', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (241, 'Viggo', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (242, 'Angela', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (243, 'Devon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (245, 'Tcheky', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (246, 'Dabney', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (247, 'Naomi', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (248, 'Alec', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (249, 'Jane', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (250, 'Aida', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (252, 'Dave', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (253, 'Trick', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (254, 'Merle', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (255, 'Regina', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (256, 'Jimmy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (257, 'Martha', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (258, 'Don', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (259, 'Ozzy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (260, 'Tony', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (261, 'Denzel', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (262, 'Mel', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (263, 'Rowan', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (264, 'Maggie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (265, 'Olga', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (266, 'Connie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (267, 'Latin', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (268, 'Elijah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (269, 'Doug', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (270, 'Olympia', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (271, 'Cuba', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (272, 'Rhett', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (273, 'Spencer', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (274, 'Jonny Lee', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (275, 'CeCe', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (276, 'Fred', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (277, 'Nikki', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (278, 'Carole', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (279, 'Johnny', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (280, 'Malcolm', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (281, 'Nicole', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (282, 'Swoosie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (283, 'Goldie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (284, 'Janeane', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (285, 'Wally', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (286, 'Nick', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (287, 'Sheryl', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (288, 'Temuera', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (289, 'Natasha', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (290, 'Gordie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (292, 'Christian', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (293, 'Kieran', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (294, 'Simon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (295, 'Nora', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (297, 'Michael', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (298, 'Reese', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (299, 'Gladys', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (300, 'Dick', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (302, 'Lennie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (303, 'Scott', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (304, 'Christina', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (306, 'Azucar', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (307, 'Jamie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (309, 'Jude', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (310, 'Buddy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (311, 'Bobby', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (313, 'Wallace', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (314, 'Albert', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (315, 'Liquid', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (316, 'Loreena', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (317, 'Ewan', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (318, 'Elijah', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (319, 'Marina', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (320, 'Mekhi', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (321, 'Keanu', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (322, 'Elizabeth', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (323, 'Stephanie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (324, 'Ice', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (325, 'Arnold', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (326, 'Bob', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (328, 'Terrence', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (329, 'Denzel', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (330, 'Emilio', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (331, 'Vince', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (332, 'Lena', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (333, 'Frankie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (334, 'Scarlett', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (335, 'Willie', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (336, 'Cyndi', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (337, 'Cary', 0);
commit;
prompt 400 records committed...
insert into CLIENT (client_id, client_name, is_club_member)
values (338, 'Coley', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (339, 'Jennifer', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (340, 'Kenneth', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (341, 'Gerald', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (342, 'Avril', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (343, 'Clive', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (344, 'Denis', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (345, 'Carolyn', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (346, 'Rhona', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (347, 'Gladys', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (350, 'Garry', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (351, 'Dean', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (352, 'Judge', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (353, 'Kyra', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (354, 'Kasey', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (355, 'Mandy', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (356, 'Laura', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (357, 'Benjamin', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (358, 'Freddie', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (359, 'Simon', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (361, 'Julianne', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (362, 'Doug', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (363, 'Jeffrey', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (364, 'Cheech', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (365, 'Taylor', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (366, 'Nils', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (367, 'Thora', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (369, 'Hikaru', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (370, 'Joanna', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (371, 'Rip', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (372, 'Kiefer', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (374, 'Ceili', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (375, 'Mary', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (376, 'Bret', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (378, 'Ted', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (379, 'Saffron', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (380, 'Gene', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (381, 'Phoebe', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (382, 'Beth', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (383, 'Carlos', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (384, 'Leon', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (385, 'Judd', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (386, 'Renee', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (387, 'Frederic', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (389, 'Ben', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (390, 'Ruth', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (391, 'Tamala', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (392, 'Juan', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (393, 'Neneh', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (394, 'Kelli', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (395, 'Antonio', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (396, 'Dianne', 0);
insert into CLIENT (client_id, client_name, is_club_member)
values (397, 'Darius', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (398, 'Josh', 1);
insert into CLIENT (client_id, client_name, is_club_member)
values (399, 'Debi', 1);
commit;
prompt 455 records loaded
prompt Loading ORDERS...
insert into ORDERS (order_id, order_date, dellivery_date)
values (493, to_date('25-03-2025', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (377, to_date('04-02-2026', 'dd-mm-yyyy'), to_date('23-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (323, to_date('12-06-2026', 'dd-mm-yyyy'), to_date('10-04-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (703, to_date('12-08-2025', 'dd-mm-yyyy'), to_date('24-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (350, to_date('08-04-2025', 'dd-mm-yyyy'), to_date('14-11-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (991, to_date('10-04-2026', 'dd-mm-yyyy'), to_date('25-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (641, to_date('25-07-2026', 'dd-mm-yyyy'), to_date('27-09-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (490, to_date('07-10-2030', 'dd-mm-yyyy'), to_date('30-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (174, to_date('20-01-2028', 'dd-mm-yyyy'), to_date('15-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (261, to_date('11-07-2030', 'dd-mm-yyyy'), to_date('24-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (352, to_date('22-08-2029', 'dd-mm-yyyy'), to_date('09-10-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (910, to_date('03-04-2030', 'dd-mm-yyyy'), to_date('20-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (947, to_date('12-06-2026', 'dd-mm-yyyy'), to_date('25-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (553, to_date('18-10-2028', 'dd-mm-yyyy'), to_date('19-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (120, to_date('28-09-2026', 'dd-mm-yyyy'), to_date('21-11-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (473, to_date('04-01-2029', 'dd-mm-yyyy'), to_date('23-10-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (702, to_date('29-11-2028', 'dd-mm-yyyy'), to_date('21-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (984, to_date('09-11-2024', 'dd-mm-yyyy'), to_date('13-04-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (567, to_date('14-11-2029', 'dd-mm-yyyy'), to_date('24-01-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (309, to_date('26-02-2025', 'dd-mm-yyyy'), to_date('20-04-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (577, to_date('10-03-2028', 'dd-mm-yyyy'), to_date('19-10-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (890, to_date('25-09-2030', 'dd-mm-yyyy'), to_date('28-07-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (889, to_date('06-03-2027', 'dd-mm-yyyy'), to_date('01-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (945, to_date('12-11-2024', 'dd-mm-yyyy'), to_date('22-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (388, to_date('12-10-2024', 'dd-mm-yyyy'), to_date('12-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (201, to_date('18-02-2026', 'dd-mm-yyyy'), to_date('08-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (610, to_date('04-04-2025', 'dd-mm-yyyy'), to_date('21-11-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (692, to_date('04-02-2025', 'dd-mm-yyyy'), to_date('21-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (572, to_date('07-05-2027', 'dd-mm-yyyy'), to_date('06-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (185, to_date('26-12-2029', 'dd-mm-yyyy'), to_date('01-09-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (835, to_date('17-12-2027', 'dd-mm-yyyy'), to_date('12-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (611, to_date('01-12-2030', 'dd-mm-yyyy'), to_date('18-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (320, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('02-05-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (381, to_date('23-03-2027', 'dd-mm-yyyy'), to_date('21-06-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (514, to_date('21-05-2028', 'dd-mm-yyyy'), to_date('13-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (361, to_date('02-07-2027', 'dd-mm-yyyy'), to_date('09-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (892, to_date('29-10-2028', 'dd-mm-yyyy'), to_date('24-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (246, to_date('11-08-2026', 'dd-mm-yyyy'), to_date('20-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (181, to_date('16-08-2030', 'dd-mm-yyyy'), to_date('22-01-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (191, to_date('08-09-2030', 'dd-mm-yyyy'), to_date('03-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (432, to_date('11-10-2028', 'dd-mm-yyyy'), to_date('13-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (998, to_date('14-01-2027', 'dd-mm-yyyy'), to_date('17-10-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (124, to_date('17-01-2027', 'dd-mm-yyyy'), to_date('19-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (561, to_date('14-03-2025', 'dd-mm-yyyy'), to_date('31-08-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (657, to_date('25-12-2025', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (233, to_date('06-09-2030', 'dd-mm-yyyy'), to_date('12-04-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (540, to_date('18-01-2029', 'dd-mm-yyyy'), to_date('12-04-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (734, to_date('26-02-2030', 'dd-mm-yyyy'), to_date('19-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (178, to_date('19-06-2028', 'dd-mm-yyyy'), to_date('14-11-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (961, to_date('08-12-2030', 'dd-mm-yyyy'), to_date('21-05-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (877, to_date('12-01-2025', 'dd-mm-yyyy'), to_date('07-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (302, to_date('19-12-2027', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (502, to_date('13-01-2028', 'dd-mm-yyyy'), to_date('12-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (249, to_date('22-11-2025', 'dd-mm-yyyy'), to_date('11-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (665, to_date('17-06-2030', 'dd-mm-yyyy'), to_date('16-10-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (299, to_date('04-08-2027', 'dd-mm-yyyy'), to_date('15-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (565, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('12-04-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (897, to_date('19-12-2024', 'dd-mm-yyyy'), to_date('07-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (272, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('31-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (723, to_date('09-08-2026', 'dd-mm-yyyy'), to_date('22-01-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (331, to_date('29-04-2025', 'dd-mm-yyyy'), to_date('25-03-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (902, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('22-10-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (422, to_date('19-09-2030', 'dd-mm-yyyy'), to_date('04-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (186, to_date('09-08-2026', 'dd-mm-yyyy'), to_date('28-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (656, to_date('27-11-2027', 'dd-mm-yyyy'), to_date('30-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (626, to_date('23-02-2027', 'dd-mm-yyyy'), to_date('20-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (557, to_date('06-04-2028', 'dd-mm-yyyy'), to_date('12-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (667, to_date('19-10-2025', 'dd-mm-yyyy'), to_date('13-07-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (737, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('24-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (159, to_date('14-07-2030', 'dd-mm-yyyy'), to_date('28-03-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (704, to_date('04-02-2027', 'dd-mm-yyyy'), to_date('31-01-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (597, to_date('12-11-2030', 'dd-mm-yyyy'), to_date('29-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (175, to_date('10-04-2025', 'dd-mm-yyyy'), to_date('01-11-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (827, to_date('03-07-2029', 'dd-mm-yyyy'), to_date('25-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (354, to_date('22-11-2026', 'dd-mm-yyyy'), to_date('04-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (479, to_date('17-12-2025', 'dd-mm-yyyy'), to_date('26-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (555, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('22-04-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (893, to_date('28-08-2026', 'dd-mm-yyyy'), to_date('14-08-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (927, to_date('10-08-2027', 'dd-mm-yyyy'), to_date('16-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (601, to_date('08-10-2024', 'dd-mm-yyyy'), to_date('04-08-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (130, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('18-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (444, to_date('24-07-2025', 'dd-mm-yyyy'), to_date('11-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (318, to_date('30-09-2029', 'dd-mm-yyyy'), to_date('03-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (139, to_date('14-03-2029', 'dd-mm-yyyy'), to_date('25-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (764, to_date('27-04-2030', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (996, to_date('12-08-2026', 'dd-mm-yyyy'), to_date('09-10-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (362, to_date('13-02-2025', 'dd-mm-yyyy'), to_date('15-12-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (154, to_date('22-06-2024', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (110, to_date('23-08-2027', 'dd-mm-yyyy'), to_date('11-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (211, to_date('02-10-2029', 'dd-mm-yyyy'), to_date('10-12-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (946, to_date('21-09-2025', 'dd-mm-yyyy'), to_date('07-06-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (198, to_date('30-05-2025', 'dd-mm-yyyy'), to_date('13-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (859, to_date('14-12-2028', 'dd-mm-yyyy'), to_date('29-10-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (495, to_date('22-11-2024', 'dd-mm-yyyy'), to_date('24-04-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (418, to_date('03-05-2027', 'dd-mm-yyyy'), to_date('23-10-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (617, to_date('18-02-2024', 'dd-mm-yyyy'), to_date('27-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (804, to_date('13-09-2027', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (833, to_date('15-05-2025', 'dd-mm-yyyy'), to_date('10-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (786, to_date('24-03-2025', 'dd-mm-yyyy'), to_date('02-02-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (142, to_date('26-06-2026', 'dd-mm-yyyy'), to_date('03-02-2025', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ORDERS (order_id, order_date, dellivery_date)
values (145, to_date('31-08-2024', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (571, to_date('21-12-2029', 'dd-mm-yyyy'), to_date('01-02-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (642, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('02-04-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (808, to_date('07-01-2026', 'dd-mm-yyyy'), to_date('15-02-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (390, to_date('08-09-2030', 'dd-mm-yyyy'), to_date('21-11-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (599, to_date('11-10-2029', 'dd-mm-yyyy'), to_date('28-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (630, to_date('08-07-2028', 'dd-mm-yyyy'), to_date('09-02-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (471, to_date('16-10-2029', 'dd-mm-yyyy'), to_date('08-04-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (438, to_date('23-09-2027', 'dd-mm-yyyy'), to_date('06-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (795, to_date('15-05-2030', 'dd-mm-yyyy'), to_date('26-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (821, to_date('05-11-2027', 'dd-mm-yyyy'), to_date('09-06-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (148, to_date('13-10-2028', 'dd-mm-yyyy'), to_date('28-11-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (644, to_date('07-06-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (632, to_date('04-12-2024', 'dd-mm-yyyy'), to_date('01-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (164, to_date('29-02-2024', 'dd-mm-yyyy'), to_date('29-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (861, to_date('08-08-2028', 'dd-mm-yyyy'), to_date('28-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (904, to_date('30-06-2026', 'dd-mm-yyyy'), to_date('03-03-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (823, to_date('14-03-2025', 'dd-mm-yyyy'), to_date('06-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (909, to_date('19-09-2030', 'dd-mm-yyyy'), to_date('27-09-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (541, to_date('21-07-2030', 'dd-mm-yyyy'), to_date('18-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (433, to_date('06-08-2027', 'dd-mm-yyyy'), to_date('03-09-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (921, to_date('04-09-2030', 'dd-mm-yyyy'), to_date('01-08-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (281, to_date('09-04-2030', 'dd-mm-yyyy'), to_date('14-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (177, to_date('06-06-2029', 'dd-mm-yyyy'), to_date('19-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (615, to_date('10-01-2030', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (105, to_date('13-11-2028', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (170, to_date('15-08-2027', 'dd-mm-yyyy'), to_date('07-04-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (822, to_date('04-11-2026', 'dd-mm-yyyy'), to_date('04-04-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (531, to_date('15-08-2026', 'dd-mm-yyyy'), to_date('06-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (819, to_date('25-11-2027', 'dd-mm-yyyy'), to_date('08-05-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (321, to_date('05-07-2024', 'dd-mm-yyyy'), to_date('28-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (366, to_date('23-10-2026', 'dd-mm-yyyy'), to_date('23-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (404, to_date('16-10-2024', 'dd-mm-yyyy'), to_date('20-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (847, to_date('03-09-2030', 'dd-mm-yyyy'), to_date('01-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (383, to_date('02-06-2027', 'dd-mm-yyyy'), to_date('21-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (535, to_date('19-01-2030', 'dd-mm-yyyy'), to_date('22-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (428, to_date('30-12-2028', 'dd-mm-yyyy'), to_date('10-09-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (633, to_date('03-02-2030', 'dd-mm-yyyy'), to_date('02-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (343, to_date('06-09-2025', 'dd-mm-yyyy'), to_date('15-07-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (828, to_date('27-12-2026', 'dd-mm-yyyy'), to_date('07-07-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (922, to_date('29-05-2030', 'dd-mm-yyyy'), to_date('12-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (461, to_date('06-02-2026', 'dd-mm-yyyy'), to_date('26-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (592, to_date('13-01-2028', 'dd-mm-yyyy'), to_date('26-09-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (720, to_date('05-10-2027', 'dd-mm-yyyy'), to_date('26-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (651, to_date('07-10-2026', 'dd-mm-yyyy'), to_date('31-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (417, to_date('22-02-2024', 'dd-mm-yyyy'), to_date('16-03-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (574, to_date('10-08-2027', 'dd-mm-yyyy'), to_date('15-10-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (332, to_date('03-04-2028', 'dd-mm-yyyy'), to_date('26-08-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (439, to_date('08-07-2025', 'dd-mm-yyyy'), to_date('09-09-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (269, to_date('10-07-2030', 'dd-mm-yyyy'), to_date('15-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (138, to_date('17-05-2028', 'dd-mm-yyyy'), to_date('11-04-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (287, to_date('16-10-2026', 'dd-mm-yyyy'), to_date('13-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (721, to_date('27-05-2026', 'dd-mm-yyyy'), to_date('14-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (956, to_date('29-07-2025', 'dd-mm-yyyy'), to_date('19-11-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (367, to_date('28-09-2024', 'dd-mm-yyyy'), to_date('13-06-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (391, to_date('12-05-2027', 'dd-mm-yyyy'), to_date('26-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (886, to_date('22-11-2030', 'dd-mm-yyyy'), to_date('05-01-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (414, to_date('07-10-2026', 'dd-mm-yyyy'), to_date('20-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (815, to_date('15-05-2026', 'dd-mm-yyyy'), to_date('02-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (442, to_date('01-01-2030', 'dd-mm-yyyy'), to_date('12-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (590, to_date('15-03-2030', 'dd-mm-yyyy'), to_date('02-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (691, to_date('07-10-2026', 'dd-mm-yyyy'), to_date('21-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (445, to_date('08-04-2024', 'dd-mm-yyyy'), to_date('07-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (997, to_date('03-05-2027', 'dd-mm-yyyy'), to_date('01-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (265, to_date('30-06-2029', 'dd-mm-yyyy'), to_date('13-11-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (675, to_date('06-07-2027', 'dd-mm-yyyy'), to_date('06-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (166, to_date('23-09-2028', 'dd-mm-yyyy'), to_date('10-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (791, to_date('13-11-2028', 'dd-mm-yyyy'), to_date('11-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (271, to_date('12-08-2029', 'dd-mm-yyyy'), to_date('28-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (730, to_date('01-04-2028', 'dd-mm-yyyy'), to_date('30-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (208, to_date('10-08-2025', 'dd-mm-yyyy'), to_date('16-09-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (206, to_date('22-09-2029', 'dd-mm-yyyy'), to_date('07-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (221, to_date('29-11-2030', 'dd-mm-yyyy'), to_date('16-08-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (923, to_date('22-01-2025', 'dd-mm-yyyy'), to_date('18-02-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (371, to_date('12-02-2029', 'dd-mm-yyyy'), to_date('01-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (593, to_date('03-04-2027', 'dd-mm-yyyy'), to_date('16-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (549, to_date('10-08-2029', 'dd-mm-yyyy'), to_date('18-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (256, to_date('28-07-2028', 'dd-mm-yyyy'), to_date('03-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (908, to_date('27-03-2025', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (983, to_date('13-11-2029', 'dd-mm-yyyy'), to_date('11-02-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (396, to_date('15-11-2026', 'dd-mm-yyyy'), to_date('18-02-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (131, to_date('07-12-2030', 'dd-mm-yyyy'), to_date('06-12-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (727, to_date('01-04-2028', 'dd-mm-yyyy'), to_date('12-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (763, to_date('31-12-2028', 'dd-mm-yyyy'), to_date('26-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (436, to_date('29-06-2030', 'dd-mm-yyyy'), to_date('27-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (776, to_date('30-04-2026', 'dd-mm-yyyy'), to_date('12-08-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (635, to_date('24-09-2027', 'dd-mm-yyyy'), to_date('06-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (300, to_date('01-01-2027', 'dd-mm-yyyy'), to_date('11-08-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (560, to_date('25-09-2024', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (266, to_date('23-11-2030', 'dd-mm-yyyy'), to_date('22-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (194, to_date('29-03-2030', 'dd-mm-yyyy'), to_date('21-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (147, to_date('15-08-2029', 'dd-mm-yyyy'), to_date('28-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (515, to_date('18-08-2024', 'dd-mm-yyyy'), to_date('29-07-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (212, to_date('10-01-2025', 'dd-mm-yyyy'), to_date('24-01-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (504, to_date('27-09-2027', 'dd-mm-yyyy'), to_date('31-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (739, to_date('15-08-2028', 'dd-mm-yyyy'), to_date('04-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (547, to_date('02-07-2027', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (778, to_date('07-11-2027', 'dd-mm-yyyy'), to_date('11-04-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (724, to_date('10-09-2028', 'dd-mm-yyyy'), to_date('17-05-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (943, to_date('02-03-2030', 'dd-mm-yyyy'), to_date('12-06-2030', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ORDERS (order_id, order_date, dellivery_date)
values (687, to_date('01-01-2026', 'dd-mm-yyyy'), to_date('25-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (386, to_date('07-03-2029', 'dd-mm-yyyy'), to_date('04-08-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (802, to_date('08-02-2025', 'dd-mm-yyyy'), to_date('03-10-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (918, to_date('15-02-2027', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (772, to_date('13-03-2027', 'dd-mm-yyyy'), to_date('16-09-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (986, to_date('24-06-2026', 'dd-mm-yyyy'), to_date('20-11-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (389, to_date('19-06-2025', 'dd-mm-yyyy'), to_date('03-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (406, to_date('07-11-2025', 'dd-mm-yyyy'), to_date('02-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (885, to_date('16-06-2027', 'dd-mm-yyyy'), to_date('26-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (411, to_date('29-12-2026', 'dd-mm-yyyy'), to_date('11-02-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (334, to_date('31-12-2026', 'dd-mm-yyyy'), to_date('17-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (342, to_date('06-05-2026', 'dd-mm-yyyy'), to_date('03-09-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (351, to_date('12-10-2025', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (474, to_date('09-09-2030', 'dd-mm-yyyy'), to_date('01-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (385, to_date('18-08-2029', 'dd-mm-yyyy'), to_date('26-06-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (942, to_date('28-08-2024', 'dd-mm-yyyy'), to_date('16-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (579, to_date('17-02-2028', 'dd-mm-yyyy'), to_date('18-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (653, to_date('15-05-2030', 'dd-mm-yyyy'), to_date('23-12-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (792, to_date('28-12-2028', 'dd-mm-yyyy'), to_date('20-11-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (277, to_date('10-08-2024', 'dd-mm-yyyy'), to_date('20-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (989, to_date('06-09-2027', 'dd-mm-yyyy'), to_date('18-01-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (842, to_date('03-07-2027', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (525, to_date('07-10-2024', 'dd-mm-yyyy'), to_date('25-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (279, to_date('16-06-2026', 'dd-mm-yyyy'), to_date('21-08-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (403, to_date('11-06-2030', 'dd-mm-yyyy'), to_date('08-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (307, to_date('20-03-2028', 'dd-mm-yyyy'), to_date('18-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (668, to_date('31-01-2026', 'dd-mm-yyyy'), to_date('04-10-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (275, to_date('17-12-2024', 'dd-mm-yyyy'), to_date('21-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (780, to_date('18-09-2028', 'dd-mm-yyyy'), to_date('11-04-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (491, to_date('03-03-2026', 'dd-mm-yyyy'), to_date('16-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (950, to_date('20-06-2024', 'dd-mm-yyyy'), to_date('13-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (603, to_date('28-01-2024', 'dd-mm-yyyy'), to_date('15-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (907, to_date('11-10-2027', 'dd-mm-yyyy'), to_date('22-02-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (330, to_date('27-06-2024', 'dd-mm-yyyy'), to_date('22-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (824, to_date('09-07-2025', 'dd-mm-yyyy'), to_date('24-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (775, to_date('21-05-2026', 'dd-mm-yyyy'), to_date('03-07-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (582, to_date('22-08-2025', 'dd-mm-yyyy'), to_date('20-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (933, to_date('10-04-2030', 'dd-mm-yyyy'), to_date('26-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (755, to_date('22-06-2027', 'dd-mm-yyyy'), to_date('04-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (167, to_date('12-02-2027', 'dd-mm-yyyy'), to_date('25-09-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (883, to_date('11-11-2028', 'dd-mm-yyyy'), to_date('06-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (475, to_date('16-02-2028', 'dd-mm-yyyy'), to_date('08-06-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (762, to_date('11-03-2026', 'dd-mm-yyyy'), to_date('16-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (584, to_date('04-02-2026', 'dd-mm-yyyy'), to_date('26-01-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (259, to_date('24-04-2029', 'dd-mm-yyyy'), to_date('28-09-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (311, to_date('21-06-2024', 'dd-mm-yyyy'), to_date('30-01-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (313, to_date('19-10-2024', 'dd-mm-yyyy'), to_date('21-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (232, to_date('10-10-2027', 'dd-mm-yyyy'), to_date('19-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (220, to_date('14-12-2027', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (505, to_date('28-08-2026', 'dd-mm-yyyy'), to_date('03-09-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (870, to_date('27-05-2029', 'dd-mm-yyyy'), to_date('15-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (210, to_date('15-05-2030', 'dd-mm-yyyy'), to_date('08-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (638, to_date('23-03-2028', 'dd-mm-yyyy'), to_date('15-12-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (643, to_date('01-01-2028', 'dd-mm-yyyy'), to_date('13-10-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (676, to_date('14-02-2026', 'dd-mm-yyyy'), to_date('23-08-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (234, to_date('20-04-2030', 'dd-mm-yyyy'), to_date('15-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (423, to_date('08-07-2027', 'dd-mm-yyyy'), to_date('28-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (978, to_date('10-02-2026', 'dd-mm-yyyy'), to_date('27-11-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (747, to_date('03-11-2027', 'dd-mm-yyyy'), to_date('31-08-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (533, to_date('25-09-2029', 'dd-mm-yyyy'), to_date('24-06-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (470, to_date('19-08-2029', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (420, to_date('07-04-2025', 'dd-mm-yyyy'), to_date('31-03-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (750, to_date('09-01-2029', 'dd-mm-yyyy'), to_date('29-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (180, to_date('27-07-2030', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (122, to_date('29-07-2025', 'dd-mm-yyyy'), to_date('31-12-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (696, to_date('16-08-2026', 'dd-mm-yyyy'), to_date('06-10-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (112, to_date('03-06-2025', 'dd-mm-yyyy'), to_date('24-04-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (619, to_date('02-11-2029', 'dd-mm-yyyy'), to_date('18-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (710, to_date('24-06-2025', 'dd-mm-yyyy'), to_date('01-08-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (880, to_date('06-07-2028', 'dd-mm-yyyy'), to_date('19-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (508, to_date('09-04-2030', 'dd-mm-yyyy'), to_date('07-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (322, to_date('02-04-2028', 'dd-mm-yyyy'), to_date('18-01-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (757, to_date('03-12-2026', 'dd-mm-yyyy'), to_date('08-02-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (782, to_date('18-02-2030', 'dd-mm-yyyy'), to_date('27-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (450, to_date('15-09-2028', 'dd-mm-yyyy'), to_date('04-09-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (543, to_date('11-08-2028', 'dd-mm-yyyy'), to_date('12-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (783, to_date('11-11-2024', 'dd-mm-yyyy'), to_date('20-09-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (111, to_date('08-05-2027', 'dd-mm-yyyy'), to_date('20-09-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (928, to_date('07-04-2024', 'dd-mm-yyyy'), to_date('17-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (817, to_date('06-12-2030', 'dd-mm-yyyy'), to_date('06-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (335, to_date('23-01-2024', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (580, to_date('28-05-2026', 'dd-mm-yyyy'), to_date('10-07-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (620, to_date('24-08-2025', 'dd-mm-yyyy'), to_date('12-02-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (912, to_date('01-10-2024', 'dd-mm-yyyy'), to_date('11-03-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (219, to_date('13-03-2030', 'dd-mm-yyyy'), to_date('03-09-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (213, to_date('17-11-2026', 'dd-mm-yyyy'), to_date('13-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (301, to_date('23-07-2027', 'dd-mm-yyyy'), to_date('24-01-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (679, to_date('05-06-2029', 'dd-mm-yyyy'), to_date('20-12-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (754, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('22-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (106, to_date('13-09-2026', 'dd-mm-yyyy'), to_date('06-04-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (729, to_date('07-09-2028', 'dd-mm-yyyy'), to_date('06-07-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (230, to_date('22-01-2028', 'dd-mm-yyyy'), to_date('15-05-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (845, to_date('16-02-2027', 'dd-mm-yyyy'), to_date('21-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (865, to_date('08-10-2027', 'dd-mm-yyyy'), to_date('27-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (973, to_date('06-10-2027', 'dd-mm-yyyy'), to_date('27-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (340, to_date('14-06-2026', 'dd-mm-yyyy'), to_date('30-01-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (929, to_date('09-10-2028', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (830, to_date('19-10-2024', 'dd-mm-yyyy'), to_date('28-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (876, to_date('22-07-2026', 'dd-mm-yyyy'), to_date('21-05-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (853, to_date('21-04-2026', 'dd-mm-yyyy'), to_date('10-01-2027', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ORDERS (order_id, order_date, dellivery_date)
values (875, to_date('30-08-2025', 'dd-mm-yyyy'), to_date('26-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (708, to_date('20-11-2026', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (183, to_date('12-12-2024', 'dd-mm-yyyy'), to_date('10-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (766, to_date('04-06-2027', 'dd-mm-yyyy'), to_date('15-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (806, to_date('19-04-2030', 'dd-mm-yyyy'), to_date('06-10-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (500, to_date('20-05-2025', 'dd-mm-yyyy'), to_date('20-01-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (200, to_date('28-02-2027', 'dd-mm-yyyy'), to_date('02-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (589, to_date('24-03-2026', 'dd-mm-yyyy'), to_date('29-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (327, to_date('25-02-2029', 'dd-mm-yyyy'), to_date('23-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (393, to_date('21-05-2024', 'dd-mm-yyyy'), to_date('09-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (891, to_date('12-05-2026', 'dd-mm-yyyy'), to_date('15-08-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (238, to_date('02-02-2027', 'dd-mm-yyyy'), to_date('27-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (848, to_date('10-06-2026', 'dd-mm-yyyy'), to_date('14-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (609, to_date('14-06-2024', 'dd-mm-yyyy'), to_date('17-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (878, to_date('13-08-2029', 'dd-mm-yyyy'), to_date('13-07-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (316, to_date('06-02-2024', 'dd-mm-yyyy'), to_date('04-08-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (437, to_date('30-07-2030', 'dd-mm-yyyy'), to_date('08-11-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (966, to_date('02-05-2030', 'dd-mm-yyyy'), to_date('17-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (192, to_date('24-04-2030', 'dd-mm-yyyy'), to_date('23-11-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (429, to_date('09-05-2029', 'dd-mm-yyyy'), to_date('14-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (604, to_date('10-10-2030', 'dd-mm-yyyy'), to_date('06-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (295, to_date('05-03-2029', 'dd-mm-yyyy'), to_date('13-11-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (336, to_date('04-06-2028', 'dd-mm-yyyy'), to_date('22-03-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (622, to_date('28-02-2026', 'dd-mm-yyyy'), to_date('24-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (225, to_date('29-03-2029', 'dd-mm-yyyy'), to_date('15-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (476, to_date('05-05-2027', 'dd-mm-yyyy'), to_date('15-12-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (982, to_date('03-09-2028', 'dd-mm-yyyy'), to_date('15-01-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (162, to_date('19-08-2025', 'dd-mm-yyyy'), to_date('24-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (965, to_date('17-01-2028', 'dd-mm-yyyy'), to_date('14-09-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (748, to_date('11-06-2024', 'dd-mm-yyyy'), to_date('22-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (224, to_date('03-03-2028', 'dd-mm-yyyy'), to_date('26-09-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (736, to_date('18-08-2029', 'dd-mm-yyyy'), to_date('07-11-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (628, to_date('14-09-2029', 'dd-mm-yyyy'), to_date('22-06-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (395, to_date('20-09-2024', 'dd-mm-yyyy'), to_date('28-10-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (264, to_date('30-12-2026', 'dd-mm-yyyy'), to_date('20-08-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (134, to_date('16-04-2028', 'dd-mm-yyyy'), to_date('15-01-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (977, to_date('08-03-2024', 'dd-mm-yyyy'), to_date('11-10-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (135, to_date('15-04-2024', 'dd-mm-yyyy'), to_date('21-08-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (359, to_date('01-02-2030', 'dd-mm-yyyy'), to_date('02-08-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (992, to_date('08-10-2030', 'dd-mm-yyyy'), to_date('29-08-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (409, to_date('04-04-2024', 'dd-mm-yyyy'), to_date('19-03-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (137, to_date('21-11-2030', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (937, to_date('17-08-2026', 'dd-mm-yyyy'), to_date('23-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (732, to_date('13-08-2024', 'dd-mm-yyyy'), to_date('20-05-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (979, to_date('17-02-2027', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (293, to_date('25-05-2030', 'dd-mm-yyyy'), to_date('28-10-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (421, to_date('20-03-2025', 'dd-mm-yyyy'), to_date('13-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (425, to_date('20-09-2024', 'dd-mm-yyyy'), to_date('08-10-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (163, to_date('27-05-2024', 'dd-mm-yyyy'), to_date('19-12-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (868, to_date('20-10-2025', 'dd-mm-yyyy'), to_date('14-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (378, to_date('22-06-2025', 'dd-mm-yyyy'), to_date('25-12-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (468, to_date('01-05-2030', 'dd-mm-yyyy'), to_date('24-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (963, to_date('01-01-2026', 'dd-mm-yyyy'), to_date('07-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (990, to_date('11-05-2027', 'dd-mm-yyyy'), to_date('29-05-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (852, to_date('08-05-2026', 'dd-mm-yyyy'), to_date('25-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (814, to_date('13-10-2030', 'dd-mm-yyyy'), to_date('01-03-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (749, to_date('25-08-2027', 'dd-mm-yyyy'), to_date('22-07-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (756, to_date('10-10-2029', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (133, to_date('09-01-2028', 'dd-mm-yyyy'), to_date('13-06-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (681, to_date('14-10-2026', 'dd-mm-yyyy'), to_date('15-10-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (310, to_date('23-11-2026', 'dd-mm-yyyy'), to_date('11-03-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (101, to_date('06-07-2027', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (204, to_date('05-07-2029', 'dd-mm-yyyy'), to_date('15-10-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (701, to_date('24-03-2030', 'dd-mm-yyyy'), to_date('13-11-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (305, to_date('17-03-2027', 'dd-mm-yyyy'), to_date('19-11-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (315, to_date('22-10-2027', 'dd-mm-yyyy'), to_date('11-08-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (683, to_date('07-09-2026', 'dd-mm-yyyy'), to_date('05-11-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (744, to_date('16-05-2028', 'dd-mm-yyyy'), to_date('18-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (496, to_date('23-02-2028', 'dd-mm-yyyy'), to_date('23-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (627, to_date('20-01-2026', 'dd-mm-yyyy'), to_date('10-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (777, to_date('18-06-2028', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (410, to_date('08-11-2030', 'dd-mm-yyyy'), to_date('16-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (158, to_date('11-08-2027', 'dd-mm-yyyy'), to_date('18-09-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (844, to_date('04-11-2024', 'dd-mm-yyyy'), to_date('08-09-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (339, to_date('23-10-2025', 'dd-mm-yyyy'), to_date('23-11-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (440, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('09-08-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (326, to_date('15-09-2027', 'dd-mm-yyyy'), to_date('07-11-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (836, to_date('12-07-2028', 'dd-mm-yyyy'), to_date('20-04-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (706, to_date('31-05-2025', 'dd-mm-yyyy'), to_date('08-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (270, to_date('05-06-2029', 'dd-mm-yyyy'), to_date('16-11-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (647, to_date('05-09-2025', 'dd-mm-yyyy'), to_date('17-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (854, to_date('27-07-2028', 'dd-mm-yyyy'), to_date('12-01-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (104, to_date('19-10-2028', 'dd-mm-yyyy'), to_date('07-11-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (497, to_date('11-06-2030', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (569, to_date('27-11-2030', 'dd-mm-yyyy'), to_date('29-03-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (753, to_date('22-10-2030', 'dd-mm-yyyy'), to_date('01-01-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (894, to_date('28-09-2030', 'dd-mm-yyyy'), to_date('13-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (109, to_date('01-05-2026', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (700, to_date('04-10-2025', 'dd-mm-yyyy'), to_date('09-02-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (813, to_date('10-03-2026', 'dd-mm-yyyy'), to_date('26-03-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (304, to_date('15-10-2027', 'dd-mm-yyyy'), to_date('16-03-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (826, to_date('02-03-2026', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (725, to_date('13-10-2029', 'dd-mm-yyyy'), to_date('29-01-2030', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (849, to_date('12-06-2024', 'dd-mm-yyyy'), to_date('12-06-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (462, to_date('21-03-2026', 'dd-mm-yyyy'), to_date('17-04-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (273, to_date('28-05-2025', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (645, to_date('03-08-2026', 'dd-mm-yyyy'), to_date('03-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (478, to_date('26-05-2028', 'dd-mm-yyyy'), to_date('18-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (798, to_date('16-04-2030', 'dd-mm-yyyy'), to_date('21-03-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (745, to_date('19-10-2030', 'dd-mm-yyyy'), to_date('12-12-2027', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into ORDERS (order_id, order_date, dellivery_date)
values (914, to_date('08-06-2027', 'dd-mm-yyyy'), to_date('11-09-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (387, to_date('21-07-2026', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (608, to_date('03-03-2026', 'dd-mm-yyyy'), to_date('02-06-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (959, to_date('24-06-2026', 'dd-mm-yyyy'), to_date('26-07-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (537, to_date('26-11-2028', 'dd-mm-yyyy'), to_date('24-08-2024', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (670, to_date('04-04-2029', 'dd-mm-yyyy'), to_date('17-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (867, to_date('01-11-2026', 'dd-mm-yyyy'), to_date('25-06-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (650, to_date('25-05-2030', 'dd-mm-yyyy'), to_date('16-01-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (678, to_date('19-07-2026', 'dd-mm-yyyy'), to_date('29-01-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (536, to_date('09-07-2027', 'dd-mm-yyyy'), to_date('25-03-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (714, to_date('08-09-2028', 'dd-mm-yyyy'), to_date('03-09-2029', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (556, to_date('26-06-2029', 'dd-mm-yyyy'), to_date('07-05-2028', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (831, to_date('26-03-2027', 'dd-mm-yyyy'), to_date('28-06-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (716, to_date('30-12-2030', 'dd-mm-yyyy'), to_date('15-07-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (640, to_date('31-08-2024', 'dd-mm-yyyy'), to_date('19-08-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (931, to_date('29-12-2027', 'dd-mm-yyyy'), to_date('04-12-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (607, to_date('20-11-2027', 'dd-mm-yyyy'), to_date('16-09-2025', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (944, to_date('04-08-2028', 'dd-mm-yyyy'), to_date('17-12-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (144, to_date('29-10-2027', 'dd-mm-yyyy'), to_date('19-05-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (400, to_date('03-07-2028', 'dd-mm-yyyy'), to_date('28-02-2027', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (260, to_date('04-09-2027', 'dd-mm-yyyy'), to_date('25-07-2026', 'dd-mm-yyyy'));
insert into ORDERS (order_id, order_date, dellivery_date)
values (197, to_date('04-01-2025', 'dd-mm-yyyy'), to_date('25-11-2026', 'dd-mm-yyyy'));
commit;
prompt 422 records loaded
prompt Loading PRODUCTS...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (100, 'Alden Systems', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (101, 'Montpelier Plas', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (102, 'Quality Assured', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (103, 'DaimlerChrysler', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (104, 'Parksite', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (105, 'SSCI', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (107, 'Dancor', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (109, 'Aloha NY System', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (110, 'Larkin Enterpri', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (111, 'AOL Time Warner', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (112, 'SafeHome Securi', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (113, 'Green Mountain ', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (114, 'Mission Control', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (115, 'KSJ & Associate', 15, 15, 115);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (116, 'Enterprise Comp', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (117, 'Toyota Motor Co', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (118, 'First American ', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (120, 'Kitba Consultin', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (121, 'Hat World', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (123, 'Kimberly-Clark ', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (124, 'Clorox Co.', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (126, 'Prometheus Labo', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (127, 'AC Technologies', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (128, 'Connected', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (129, 'Conquest System', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (130, 'Procter & Gambl', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (131, 'Oakleaf Waste M', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (132, 'Benecon Group', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (133, 'FSF Financial', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (135, 'Veri-Tek Intern', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (136, 'Hi-Tech Pharmac', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (139, 'Terra Firma', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (140, 'Virtual Meeting', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (141, 'First American ', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (142, 'Gillette Co.', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (143, 'Ford Motor Co.', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (144, 'SCI', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (145, 'Spenser Communi', 45, 45, 145);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (147, 'Simply Certific', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (148, 'Procurement Cen', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (153, 'Global Domains ', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (156, 'American Pan & ', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (157, 'Advantage Credi', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (159, 'Adolph Coors Co', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (163, 'Access Systems', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (164, 'httprint', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (166, 'SSCI', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (167, 'Merck & Co.', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (171, 'WAV', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (172, 'ZonePerfect Nut', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (174, 'Unilever', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (177, 'NoBrainerBlinds', 77, 77, 177);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (178, 'Softworld', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (182, 'Spenser Communi', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (183, 'Unger Technolog', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (184, 'Glacier Bancorp', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (188, 'TruSecure', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (191, 'New Horizons Co', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (192, 'Typhoon', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (195, 'Dankoff Solar P', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (196, 'Topics Entertai', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (199, 'Apex Systems', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (200, 'Manhattan Assoc', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (201, 'Novartis', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (202, 'Unica', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (203, 'CapTech Venture', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (204, 'Gap Inc.', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (205, 'Capital Automot', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (207, 'Legacy Financia', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (209, 'Berkshire Hatha', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (210, 'American Pan & ', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (211, 'Heritage Microf', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (212, '3t Systems', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (213, 'Gillette Co.', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (214, 'MQ Software', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (215, 'SurModics', 15, 15, 115);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (216, 'Catamount Const', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (217, 'Integrated Deci', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (218, 'Venoco', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (220, 'Megha Systems', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (221, 'Capella Educati', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (223, 'FlavorX', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (224, 'Lindin Consulti', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (226, 'Analytics Opera', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (227, 'Virbac', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (228, 'Eze Castle Soft', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (229, 'CLT Meetings In', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (230, 'Best Buy Co.', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (231, 'EPIQ Systems', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (232, 'Integra Telecom', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (233, 'Spectrum Commun', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (235, 'Innovate E-Comm', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (236, 'Sprint Corp.', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (239, 'Freedom Medical', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (240, 'Greenwich Techn', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (241, 'Bristol-Myers S', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (242, 'Brandt Informat', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (243, 'Kingston', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (244, 'Pearl Law Group', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (245, 'Auction Systems', 45, 45, 145);
commit;
prompt 100 records committed...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (247, 'Global Domains ', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (248, 'Solution Builde', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (253, 'Outsource Group', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (256, 'Lindin Consulti', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (257, 'Anheuser-Busch ', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (259, 'North American ', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (263, 'Myricom', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (264, 'MRE Consulting', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (266, 'Kingston', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (267, 'Boldtech System', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (271, 'Asta Funding', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (272, 'Terra Firma', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (274, 'National Herita', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (277, 'Typhoon', 77, 77, 177);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (278, 'Bradley Pharmac', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (282, 'Inspiration Sof', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (283, 'J.C. Malone Ass', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (284, 'U.S Physical Th', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (288, 'One Source Prin', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (291, 'Summit Energy', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (292, 'SYS-CON Media', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (295, 'Clover Technolo', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (296, 'Extra Mile Tran', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (299, 'Capital Crossin', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (300, 'Street Glow', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (301, 'Studio B Produc', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (302, 'Maverick Techno', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (303, 'Network Display', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (304, 'Commercial Ener', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (305, 'Pulaski Financi', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (307, 'Unicru', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (309, 'Phoenix Rehabil', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (310, 'Extra Mile Tran', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (311, 'Extreme Pizza', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (312, 'Progressive Des', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (313, 'NoBrainerBlinds', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (314, 'Keller Williams', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (315, 'Formatech', 15, 15, 115);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (316, 'Cowlitz Bancorp', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (317, 'CyberThink', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (318, 'Granite Systems', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (320, 'PepsiCo', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (321, 'Gentra Systems', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (323, 'InsurMark', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (324, 'Eze Castle Soft', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (326, 'Pioneer Mortgag', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (327, 'TLS Service Bur', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (328, 'Vivendi Univers', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (329, 'Synhrgy HR Tech', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (330, 'GCI', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (331, 'Miracle Softwar', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (332, 'Abdon Callais O', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (333, 'Arkidata', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (335, 'Commercial Ener', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (336, 'McKee Wallwork ', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (339, 'httprint', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (340, 'North Coast Ene', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (341, 'Pulaski Financi', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (342, 'PrintingForLess', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (343, 'Floorgraphics', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (344, 'Columbia Bancor', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (345, 'Mission Control', 45, 45, 145);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (347, 'Cima Consulting', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (348, 'American Servic', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (353, 'Deutsche Teleko', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (356, 'St. Mary Land &', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (357, 'American Megaco', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (359, 'Clorox Co.', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (363, 'Commercial Ener', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (364, 'Cima Labs', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (366, 'Taycor Financia', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (367, 'Tracer Technolo', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (371, 'Vertex Solution', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (372, 'Conquest System', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (374, 'Restaurant Part', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (377, 'McKee Wallwork ', 77, 77, 177);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (378, 'Advanced Vision', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (382, 'Advanced Intern', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (383, 'Global Domains ', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (384, 'Blue Ocean Soft', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (388, 'SimStar Interne', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (391, 'Investors Title', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (392, 'General Mills', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (395, 'CREDO Petroleum', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (396, 'Urstadt Biddle ', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (399, 'Evergreen Resou', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (400, 'General Motors ', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (401, 'Myricom', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (402, 'SM Consulting', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (403, 'Kramont Realty ', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (404, 'QSS Group', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (405, 'Kingston', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (407, 'Magnet Communic', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (409, 'Merit Medical S', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (410, 'Lydian Trust', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (411, 'Laboratory Mana', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (412, 'L.E.M. Products', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (413, 'Virtual Financi', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (414, 'Clorox Co.', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (415, 'Philip Morris C', 15, 15, 115);
commit;
prompt 200 records committed...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (416, 'Liners Direct', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (417, 'ProSys Informat', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (418, 'Morgan Stanley ', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (420, 'Staff One', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (421, 'Joseph Sheairs ', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (423, 'Monitronics Int', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (424, 'Capella Educati', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (426, 'MHF Logistical ', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (427, 'Hilton Hotels C', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (428, 'Newton Interact', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (429, 'Universal Solut', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (430, 'Client Network ', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (431, 'Coca-Cola Co.', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (432, 'Arkidata', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (433, 'Homebuilders Fi', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (435, 'Investors Title', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (436, 'Process Plus', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (439, 'Mosaic', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (440, 'Quantum Loyalty', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (441, 'Advertising Ven', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (442, 'Computer Source', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (443, 'Saks Inc.', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (444, 'Legacy Financia', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (445, 'Data Company', 45, 45, 145);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (447, 'Cambridge Home ', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (448, 'U.S. Government', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (453, 'U.S. Government', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (456, 'FFLC Bancorp', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (457, 'May Department ', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (459, 'Greenwich Techn', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (463, 'Access Systems', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (464, 'Sony Corp.', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (466, 'Quantum Loyalty', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (467, 'Unica', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (471, 'One Source Prin', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (472, 'Ogio Internatio', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (474, 'Newton Interact', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (477, 'Atlantic.Net', 77, 77, 177);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (478, 'Heartlab', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (482, 'Bashen Consulti', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (483, 'Kellogg Co.', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (484, 'Mattel', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (488, 'United Asset Co', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (491, 'DC Group', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (492, 'Morgan Stanley ', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (495, 'Terra Firma', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (496, 'Marriott Intern', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (499, 'Hospital Soluti', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (500, 'Safeway', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (501, 'InfoVision Cons', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (502, 'Limited Brands', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (503, 'Infinity Softwa', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (504, 'Scott Pipitone ', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (505, 'SM Consulting', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (507, 'Catamount Const', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (509, 'Vitacost.com', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (510, 'Allegiant Banco', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (511, 'Joseph Sheairs ', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (512, 'Commercial Ener', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (513, 'Gray Hawk Syste', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (514, 'Portage Environ', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (515, 'Procter & Gambl', 15, 15, 115);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (516, 'Coca-Cola Co.', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (517, 'G.A. Beck Artis', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (518, 'Bristol-Myers S', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (520, 'Diamond Pharmac', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (521, 'American Expres', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (523, 'Envision Teleph', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (524, 'Banfe Products', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (526, 'Advanced Intern', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (527, 'ProSys Informat', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (528, 'Uniserve Facili', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (529, 'Commercial Ener', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (530, 'Newton Interact', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (531, 'ComGlobal Syste', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (532, 'Prosoft Technol', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (533, 'Bluff City Stee', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (535, 'PowerLight', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (536, 'Deutsche Teleko', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (539, 'Cherokee Inform', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (540, 'Scooter Store', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (541, 'Myricom', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (542, 'GRT', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (543, 'One Source Prin', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (544, 'Linksys', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (545, 'Active Services', 45, 45, 145);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (547, 'Biosite', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (548, 'Tarragon Realty', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (553, 'ProfitLine', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (556, 'Mathis, Earnest', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (557, 'Kingland Compan', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (559, 'Bashen Consulti', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (563, 'Comnet Internat', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (564, 'Evergreen Resou', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (566, 'American Vangua', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (567, 'Pacific Data De', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (571, 'Trek Equipment', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (572, 'Allegiant Banco', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (574, 'America''s Choic', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (577, 'Woronoco Bancor', 77, 77, 177);
commit;
prompt 300 records committed...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (578, 'ScriptSave', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (582, 'Trainersoft', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (583, 'FlavorX', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (584, 'All Star Consul', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (588, 'Unica', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (591, 'Socket Internet', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (592, 'Inspiration Sof', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (595, 'FSF Financial', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (596, 'Partnership in ', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (599, 'Miller Systems', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (600, 'Novartis', 0, 0, 100);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (601, 'Bowman Consulti', 1, 1, 101);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (602, 'Strategic Produ', 2, 2, 102);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (603, 'BASE Consulting', 3, 3, 103);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (604, 'Total Entertain', 4, 4, 104);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (605, 'WAV', 5, 5, 105);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (607, 'Global Wireless', 7, 7, 107);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (609, 'Virtual Financi', 9, 9, 109);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (610, 'LogistiCare', 10, 10, 110);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (611, 'Visionary Syste', 11, 11, 111);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (612, 'GCI', 12, 12, 112);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (613, 'Verizon Communi', 13, 13, 113);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (614, 'Eze Castle Soft', 14, 14, 114);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (615, 'CIW Services', 15, 15, 115);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (616, 'AXSA Document S', 16, 16, 116);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (617, 'Joe Lombardo Pl', 17, 17, 117);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (618, 'Digital Motorwo', 18, 18, 118);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (620, 'Active Services', 20, 20, 120);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (621, 'Benecon Group', 21, 21, 121);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (623, 'Infinity Softwa', 23, 23, 123);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (624, 'Club One', 24, 24, 124);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (626, 'Envision Teleph', 26, 26, 126);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (627, 'GulfMark Offsho', 27, 27, 127);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (628, 'Peerless Manufa', 28, 28, 128);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (629, 'Tarragon Realty', 29, 29, 129);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (630, 'Viacom', 30, 30, 130);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (631, 'Pioneer Data Sy', 31, 31, 131);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (632, 'Network Hardwar', 32, 32, 132);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (633, 'Acsis', 33, 33, 133);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (635, 'Grant Harrison ', 35, 35, 135);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (636, 'Uniserve Facili', 36, 36, 136);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (639, 'CLT Meetings In', 39, 39, 139);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (640, 'httprint', 40, 40, 140);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (641, 'Apex Systems', 41, 41, 141);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (642, 'Marlabs', 42, 42, 142);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (643, 'EFC Bancorp', 43, 43, 143);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (644, 'Visa Internatio', 44, 44, 144);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (645, 'Client Network ', 45, 45, 145);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (647, 'Merck & Co.', 47, 47, 147);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (648, 'Solipsys', 48, 48, 148);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (653, 'Uniserve Facili', 53, 53, 153);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (656, 'Granite Systems', 56, 56, 156);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (657, 'Inspiration Sof', 57, 57, 157);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (659, 'Pyramid Digital', 59, 59, 159);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (663, 'Cardinal Cartri', 63, 63, 163);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (664, 'Travizon', 64, 64, 164);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (666, 'Genex Technolog', 66, 66, 166);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (667, 'Qestrel Cos.', 67, 67, 167);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (671, 'Teamstudio', 71, 71, 171);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (672, 'Saks Inc.', 72, 72, 172);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (674, 'Nike', 74, 74, 174);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (677, 'Creditors Inter', 77, 77, 177);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (678, 'CREDO Petroleum', 78, 78, 178);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (682, 'Cendant Corp.', 82, 82, 182);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (683, 'Kroger Co.', 83, 83, 183);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (684, 'Genghis Grill', 84, 84, 184);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (688, 'CREDO Petroleum', 88, 88, 188);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (691, 'Glacier Bancorp', 91, 91, 191);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (692, 'Virtual Financi', 92, 92, 192);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (695, 'USA Instruments', 95, 95, 195);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (696, 'STI Knowledge', 96, 96, 196);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (699, 'Ultimus', 99, 99, 199);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (606, 'GlaxoSmithKline', 6, 6, 206);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (608, 'Blue Ocean Soft', 8, 8, 208);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (619, 'Client Network ', 19, 19, 219);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (622, 'SHOT', 22, 22, 222);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (625, 'Span-America Me', 25, 25, 225);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (634, 'Sensor Technolo', 34, 34, 234);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (637, 'esoftsolutions', 37, 37, 237);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (638, 'Canterbury Park', 38, 38, 238);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (646, 'Capitol Bancorp', 46, 46, 246);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (651, 'DataTrend Infor', 51, 51, 251);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (655, 'Deutsche Teleko', 55, 55, 255);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (658, 'Priority Expres', 58, 58, 258);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (662, 'ELMCO', 62, 62, 262);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (665, 'Kellogg Co.', 65, 65, 265);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (668, 'Career Control ', 68, 68, 268);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (669, 'SYS-CON Media', 69, 69, 269);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (670, 'Cold Stone Crea', 70, 70, 270);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (673, 'InfoPros', 73, 73, 273);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (675, 'Max & Erma''s Re', 75, 75, 275);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (676, 'AT&T Corp.', 76, 76, 276);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (680, 'Integra Telecom', 80, 80, 280);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (681, 'Genghis Grill', 81, 81, 281);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (685, 'Staff One', 85, 85, 285);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (686, 'Call Henry', 86, 86, 286);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (689, 'Qestrel Cos.', 89, 89, 289);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (694, 'MindIQ', 94, 94, 294);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (698, 'Vitacost.com', 98, 98, 298);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (700, 'Nexxtworks', 0, 0, 300);
commit;
prompt 400 records committed...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (701, 'Momentum Market', 1, 1, 301);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (702, 'Tilson Landscap', 2, 2, 302);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (703, 'Hat World', 3, 3, 303);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (704, 'Painted Word', 4, 4, 304);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (705, 'In Zone', 5, 5, 305);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (706, 'Integra Telecom', 6, 6, 306);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (708, 'Legacy Financia', 8, 8, 308);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (709, 'Component Graph', 9, 9, 309);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (710, 'Kingston', 10, 10, 310);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (711, 'Labrada Nutriti', 11, 11, 311);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (712, 'WorldCom', 12, 12, 312);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (713, 'Larkin Enterpri', 13, 13, 313);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (714, 'Peerless Manufa', 14, 14, 314);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (715, 'Franklin Americ', 15, 15, 315);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (716, 'esoftsolutions', 16, 16, 316);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (717, 'AT&T Corp.', 17, 17, 317);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (718, 'Prosperity Banc', 18, 18, 318);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (719, 'Wyeth', 19, 19, 319);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (720, 'Maverick Constr', 20, 20, 320);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (721, 'Mathis, Earnest', 21, 21, 321);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (722, 'Astute', 22, 22, 322);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (723, 'Bristol-Myers S', 23, 23, 323);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (724, 'Quality Assured', 24, 24, 324);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (725, 'PSC Info Group', 25, 25, 325);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (726, 'Southern Financ', 26, 26, 326);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (727, 'Horizon Consult', 27, 27, 327);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (728, 'Envision Teleph', 28, 28, 328);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (729, 'Investors Title', 29, 29, 329);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (730, 'ProSys Informat', 30, 30, 330);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (731, 'Apex Systems', 31, 31, 331);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (732, 'Gateway', 32, 32, 332);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (733, 'Fetch Logistics', 33, 33, 333);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (734, 'Quantum Loyalty', 34, 34, 334);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (735, 'WRG Services', 35, 35, 335);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (736, 'Unit', 36, 36, 336);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (737, 'FFLC Bancorp', 37, 37, 337);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (738, 'Synhrgy HR Tech', 38, 38, 338);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (739, 'Infinity Softwa', 39, 39, 339);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (740, 'CCF Holding', 40, 40, 340);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (741, 'Typhoon', 41, 41, 341);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (742, 'Advanced Techno', 42, 42, 342);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (743, 'Flow Management', 43, 43, 343);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (744, 'Alternative Tec', 44, 44, 344);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (745, 'Apex Systems', 45, 45, 345);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (746, 'Tigris Consulti', 46, 46, 346);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (747, 'Intel Corp.', 47, 47, 347);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (748, 'Comnet Internat', 48, 48, 348);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (749, 'Ford Motor Co.', 49, 49, 349);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (750, 'Advanced Intern', 50, 50, 350);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (751, 'GulfMark Offsho', 51, 51, 351);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (752, 'Staff One', 52, 52, 352);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (753, 'Blue Angel Tech', 53, 53, 353);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (754, 'HealthCare Fina', 54, 54, 354);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (755, 'Sandy Spring Ba', 55, 55, 355);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (756, 'TEOCO', 56, 56, 356);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (757, 'Dancor', 57, 57, 357);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (758, 'Cowlitz Bancorp', 58, 58, 358);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (759, 'DaimlerChrysler', 59, 59, 359);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (760, 'Web Group', 60, 60, 360);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (761, 'Diversitech', 61, 61, 361);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (762, 'WestNet Learnin', 62, 62, 362);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (763, 'North Highland', 63, 63, 363);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (764, 'Call Henry', 64, 64, 364);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (765, 'Network Display', 65, 65, 365);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (766, 'General Motors ', 66, 66, 366);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (767, 'Biosite', 67, 67, 367);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (768, 'Aquascape Desig', 68, 68, 368);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (769, 'Alliance of Pro', 69, 69, 369);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (770, 'Pacific Data De', 70, 70, 370);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (771, 'Kroger Co.', 71, 71, 371);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (772, 'WRG Services', 72, 72, 372);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (773, 'Exinom Technolo', 73, 73, 373);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (774, 'EPAM Systems', 74, 74, 374);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (775, 'Elite Medical', 75, 75, 375);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (776, 'Diamond Technol', 76, 76, 376);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (777, 'Enterprise Comp', 77, 77, 377);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (778, 'Travizon', 78, 78, 378);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (779, 'Heartland Payme', 79, 79, 379);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (780, 'esoftsolutions', 80, 80, 380);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (781, 'Maverick Techno', 81, 81, 381);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (782, 'Volkswagen', 82, 82, 382);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (783, 'Primus Software', 83, 83, 383);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (784, 'Glacier Bancorp', 84, 84, 384);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (785, 'Terra Firma', 85, 85, 385);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (786, 'Y2Marketing', 86, 86, 386);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (787, 'Joseph Sheairs ', 87, 87, 387);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (788, 'Creditors Inter', 88, 88, 388);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (789, 'Southern Financ', 89, 89, 389);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (790, 'Progressive Des', 90, 90, 390);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (791, 'Carteret Mortga', 91, 91, 391);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (792, 'Black Mountain ', 92, 92, 392);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (793, 'Network Hardwar', 93, 93, 393);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (794, 'Pioneer Mortgag', 94, 94, 394);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (795, 'KeyMark', 95, 95, 395);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (796, 'ProClarity', 96, 96, 396);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (797, 'Coadvantage Res', 97, 97, 397);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (799, 'Portosan', 99, 99, 399);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (800, 'Abdon Callais O', 0, 0, 400);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (801, 'TechRX', 1, 1, 401);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (802, 'STI Knowledge', 2, 2, 402);
commit;
prompt 500 records committed...
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (803, 'Adea Solutions', 3, 3, 403);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (804, 'ConAgra', 4, 4, 404);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (805, 'Parksite', 5, 5, 405);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (806, 'Gateway', 6, 6, 406);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (807, 'Navigator Syste', 7, 7, 407);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (808, 'Integrated Deci', 8, 8, 408);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (809, 'Quantum Loyalty', 9, 9, 409);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (810, 'Greenwich Techn', 10, 10, 410);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (811, 'Kimberly-Clark ', 11, 11, 411);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (812, 'Custom Solution', 12, 12, 412);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (813, 'Franklin Americ', 13, 13, 413);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (814, 'Comnet Internat', 14, 14, 414);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (815, 'Glacier Bancorp', 15, 15, 415);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (816, 'North Coast Ene', 16, 16, 416);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (818, 'New Media Commu', 18, 18, 418);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (819, 'Balchem', 19, 19, 419);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (820, 'Global Domains ', 20, 20, 420);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (821, 'IVCi', 21, 21, 421);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (822, 'Prosum', 22, 22, 422);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (823, 'Open Software S', 23, 23, 423);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (824, 'Blue Angel Tech', 24, 24, 424);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (825, 'Progressive Des', 25, 25, 425);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (826, 'Acsis', 26, 26, 426);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (827, 'Web Group', 27, 27, 427);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (828, 'CIW Services', 28, 28, 428);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (829, 'Unicru', 29, 29, 429);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (830, 'Shuffle Master', 30, 30, 430);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (831, 'Nestle', 31, 31, 431);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (832, 'TechRX', 32, 32, 432);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (833, 'G.A. Beck Artis', 33, 33, 433);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (834, 'Quaker City Ban', 34, 34, 434);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (835, 'Dataprise', 35, 35, 435);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (836, 'Restaurant Part', 36, 36, 436);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (837, 'Blue Angel Tech', 37, 37, 437);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (838, 'John Keeler & C', 38, 38, 438);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (839, 'Capital Bank', 39, 39, 439);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (840, 'Connected', 40, 40, 440);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (841, 'White Wave', 41, 41, 441);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (842, 'G.A. Beck Artis', 42, 42, 442);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (843, 'Synhrgy HR Tech', 43, 43, 443);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (844, 'Benecon Group', 44, 44, 444);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (845, 'Sara Lee Corp.', 45, 45, 445);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (846, 'Sprint Corp.', 46, 46, 446);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (847, 'Advanced Techno', 47, 47, 447);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (848, 'Asta Funding', 48, 48, 448);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (849, 'Printcafe Softw', 49, 49, 449);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (850, 'Data Warehouse', 50, 50, 450);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (851, 'Air Methods', 51, 51, 451);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (852, 'Market First', 52, 52, 452);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (853, 'Smartronix', 53, 53, 453);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (854, 'Pearl Law Group', 54, 54, 454);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (856, 'Tastefully Simp', 56, 56, 456);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (857, 'Hardwood Wholes', 57, 57, 457);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (858, 'Summit Energy', 58, 58, 458);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (859, 'Terra Firma', 59, 59, 459);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (860, 'Sony Corp.', 60, 60, 460);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (861, 'Adolph Coors Co', 61, 61, 461);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (862, 'Escalade', 62, 62, 462);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (863, 'Reckitt Benckis', 63, 63, 463);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (864, 'Questar Capital', 64, 64, 464);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (865, 'Hewlett-Packard', 65, 65, 465);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (866, 'Cold Stone Crea', 66, 66, 466);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (867, 'Innovative Ligh', 67, 67, 467);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (868, 'GHR Systems', 68, 68, 468);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (869, 'Astute', 69, 69, 469);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (870, 'Shirt Factory', 70, 70, 470);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (871, 'Arrow Financial', 71, 71, 471);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (872, 'Yum Brands', 72, 72, 472);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (873, 'Security Mortga', 73, 73, 473);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (874, 'Operational Tec', 74, 74, 474);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (875, 'ProClarity', 75, 75, 475);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (876, 'Bestever', 76, 76, 476);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (877, 'Dynacq Internat', 77, 77, 477);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (878, 'Virtual Meeting', 78, 78, 478);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (879, 'Great Lakes Med', 79, 79, 479);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (880, 'School Technolo', 80, 80, 480);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (881, 'Pacific Data De', 81, 81, 481);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (882, 'Genghis Grill', 82, 82, 482);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (883, 'Granite Systems', 83, 83, 483);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (884, 'Johnson & Johns', 84, 84, 484);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (885, 'Sterling Financ', 85, 85, 485);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (886, 'Integrated Deci', 86, 86, 486);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (887, 'Grant Harrison ', 87, 87, 487);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (888, 'Third Millenniu', 88, 88, 488);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (889, 'Herbeau Creatio', 89, 89, 489);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (890, 'Hershey Foods C', 90, 90, 490);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (891, 'Campbell Soup C', 91, 91, 491);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (892, 'MicroTek', 92, 92, 492);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (893, 'Keller Williams', 93, 93, 493);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (894, 'DataTrend Infor', 94, 94, 494);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (895, 'MoneyLine Lendi', 95, 95, 495);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (896, 'IntegraMed Amer', 96, 96, 496);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (897, 'Nike', 97, 97, 497);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (898, 'CIW Services', 98, 98, 498);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (899, 'CyberThink', 99, 99, 499);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (900, 'Navarro Researc', 1, 3, 351);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (901, 'Tigris Consulti', 2, 4, 286);
insert into PRODUCTS (product_id, product_name, quantity, product_price, category_id)
values (902, 'Automated Licen', 3, 5, 302);
commit;
prompt 598 records loaded
prompt Loading ORDER_PRODUCT...
insert into ORDER_PRODUCT (product_id, order_id)
values (101, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (101, 601);
insert into ORDER_PRODUCT (product_id, order_id)
values (102, 902);
insert into ORDER_PRODUCT (product_id, order_id)
values (104, 804);
insert into ORDER_PRODUCT (product_id, order_id)
values (110, 110);
insert into ORDER_PRODUCT (product_id, order_id)
values (110, 610);
insert into ORDER_PRODUCT (product_id, order_id)
values (110, 910);
insert into ORDER_PRODUCT (product_id, order_id)
values (111, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (111, 611);
insert into ORDER_PRODUCT (product_id, order_id)
values (117, 617);
insert into ORDER_PRODUCT (product_id, order_id)
values (120, 120);
insert into ORDER_PRODUCT (product_id, order_id)
values (124, 124);
insert into ORDER_PRODUCT (product_id, order_id)
values (126, 626);
insert into ORDER_PRODUCT (product_id, order_id)
values (127, 827);
insert into ORDER_PRODUCT (product_id, order_id)
values (127, 927);
insert into ORDER_PRODUCT (product_id, order_id)
values (130, 130);
insert into ORDER_PRODUCT (product_id, order_id)
values (133, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (133, 833);
insert into ORDER_PRODUCT (product_id, order_id)
values (135, 835);
insert into ORDER_PRODUCT (product_id, order_id)
values (139, 139);
insert into ORDER_PRODUCT (product_id, order_id)
values (141, 641);
insert into ORDER_PRODUCT (product_id, order_id)
values (142, 142);
insert into ORDER_PRODUCT (product_id, order_id)
values (145, 945);
insert into ORDER_PRODUCT (product_id, order_id)
values (147, 947);
insert into ORDER_PRODUCT (product_id, order_id)
values (156, 656);
insert into ORDER_PRODUCT (product_id, order_id)
values (157, 657);
insert into ORDER_PRODUCT (product_id, order_id)
values (159, 159);
insert into ORDER_PRODUCT (product_id, order_id)
values (159, 859);
insert into ORDER_PRODUCT (product_id, order_id)
values (167, 667);
insert into ORDER_PRODUCT (product_id, order_id)
values (172, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (174, 174);
insert into ORDER_PRODUCT (product_id, order_id)
values (177, 877);
insert into ORDER_PRODUCT (product_id, order_id)
values (178, 178);
insert into ORDER_PRODUCT (product_id, order_id)
values (184, 984);
insert into ORDER_PRODUCT (product_id, order_id)
values (191, 191);
insert into ORDER_PRODUCT (product_id, order_id)
values (191, 991);
insert into ORDER_PRODUCT (product_id, order_id)
values (192, 692);
insert into ORDER_PRODUCT (product_id, order_id)
values (192, 892);
insert into ORDER_PRODUCT (product_id, order_id)
values (196, 996);
insert into ORDER_PRODUCT (product_id, order_id)
values (199, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (201, 101);
insert into ORDER_PRODUCT (product_id, order_id)
values (201, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (201, 601);
insert into ORDER_PRODUCT (product_id, order_id)
values (202, 302);
insert into ORDER_PRODUCT (product_id, order_id)
values (202, 702);
insert into ORDER_PRODUCT (product_id, order_id)
values (202, 902);
insert into ORDER_PRODUCT (product_id, order_id)
values (203, 703);
insert into ORDER_PRODUCT (product_id, order_id)
values (204, 104);
insert into ORDER_PRODUCT (product_id, order_id)
values (204, 704);
insert into ORDER_PRODUCT (product_id, order_id)
values (205, 105);
insert into ORDER_PRODUCT (product_id, order_id)
values (209, 109);
insert into ORDER_PRODUCT (product_id, order_id)
values (209, 309);
insert into ORDER_PRODUCT (product_id, order_id)
values (210, 110);
insert into ORDER_PRODUCT (product_id, order_id)
values (210, 610);
insert into ORDER_PRODUCT (product_id, order_id)
values (210, 910);
insert into ORDER_PRODUCT (product_id, order_id)
values (211, 111);
insert into ORDER_PRODUCT (product_id, order_id)
values (211, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (211, 611);
insert into ORDER_PRODUCT (product_id, order_id)
values (212, 112);
insert into ORDER_PRODUCT (product_id, order_id)
values (217, 617);
insert into ORDER_PRODUCT (product_id, order_id)
values (218, 318);
insert into ORDER_PRODUCT (product_id, order_id)
values (220, 120);
insert into ORDER_PRODUCT (product_id, order_id)
values (220, 320);
insert into ORDER_PRODUCT (product_id, order_id)
values (223, 323);
insert into ORDER_PRODUCT (product_id, order_id)
values (223, 723);
insert into ORDER_PRODUCT (product_id, order_id)
values (224, 124);
insert into ORDER_PRODUCT (product_id, order_id)
values (226, 626);
insert into ORDER_PRODUCT (product_id, order_id)
values (227, 927);
insert into ORDER_PRODUCT (product_id, order_id)
values (230, 130);
insert into ORDER_PRODUCT (product_id, order_id)
values (231, 131);
insert into ORDER_PRODUCT (product_id, order_id)
values (231, 331);
insert into ORDER_PRODUCT (product_id, order_id)
values (233, 133);
insert into ORDER_PRODUCT (product_id, order_id)
values (233, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (235, 135);
insert into ORDER_PRODUCT (product_id, order_id)
values (239, 139);
insert into ORDER_PRODUCT (product_id, order_id)
values (241, 641);
insert into ORDER_PRODUCT (product_id, order_id)
values (242, 142);
insert into ORDER_PRODUCT (product_id, order_id)
values (244, 144);
insert into ORDER_PRODUCT (product_id, order_id)
values (245, 145);
insert into ORDER_PRODUCT (product_id, order_id)
values (245, 945);
insert into ORDER_PRODUCT (product_id, order_id)
values (247, 147);
insert into ORDER_PRODUCT (product_id, order_id)
values (247, 947);
insert into ORDER_PRODUCT (product_id, order_id)
values (248, 148);
insert into ORDER_PRODUCT (product_id, order_id)
values (256, 656);
insert into ORDER_PRODUCT (product_id, order_id)
values (257, 657);
insert into ORDER_PRODUCT (product_id, order_id)
values (259, 159);
insert into ORDER_PRODUCT (product_id, order_id)
values (263, 163);
insert into ORDER_PRODUCT (product_id, order_id)
values (264, 164);
insert into ORDER_PRODUCT (product_id, order_id)
values (264, 764);
insert into ORDER_PRODUCT (product_id, order_id)
values (266, 166);
insert into ORDER_PRODUCT (product_id, order_id)
values (267, 167);
insert into ORDER_PRODUCT (product_id, order_id)
values (267, 667);
insert into ORDER_PRODUCT (product_id, order_id)
values (272, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (274, 174);
insert into ORDER_PRODUCT (product_id, order_id)
values (277, 177);
insert into ORDER_PRODUCT (product_id, order_id)
values (277, 377);
insert into ORDER_PRODUCT (product_id, order_id)
values (278, 178);
insert into ORDER_PRODUCT (product_id, order_id)
values (283, 183);
insert into ORDER_PRODUCT (product_id, order_id)
values (284, 984);
insert into ORDER_PRODUCT (product_id, order_id)
values (288, 388);
commit;
prompt 100 records committed...
insert into ORDER_PRODUCT (product_id, order_id)
values (291, 191);
insert into ORDER_PRODUCT (product_id, order_id)
values (291, 991);
insert into ORDER_PRODUCT (product_id, order_id)
values (292, 192);
insert into ORDER_PRODUCT (product_id, order_id)
values (292, 692);
insert into ORDER_PRODUCT (product_id, order_id)
values (296, 996);
insert into ORDER_PRODUCT (product_id, order_id)
values (299, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (300, 200);
insert into ORDER_PRODUCT (product_id, order_id)
values (301, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (302, 302);
insert into ORDER_PRODUCT (product_id, order_id)
values (302, 702);
insert into ORDER_PRODUCT (product_id, order_id)
values (302, 902);
insert into ORDER_PRODUCT (product_id, order_id)
values (303, 703);
insert into ORDER_PRODUCT (product_id, order_id)
values (304, 204);
insert into ORDER_PRODUCT (product_id, order_id)
values (304, 704);
insert into ORDER_PRODUCT (product_id, order_id)
values (304, 804);
insert into ORDER_PRODUCT (product_id, order_id)
values (309, 309);
insert into ORDER_PRODUCT (product_id, order_id)
values (310, 110);
insert into ORDER_PRODUCT (product_id, order_id)
values (310, 210);
insert into ORDER_PRODUCT (product_id, order_id)
values (310, 910);
insert into ORDER_PRODUCT (product_id, order_id)
values (311, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (312, 212);
insert into ORDER_PRODUCT (product_id, order_id)
values (313, 213);
insert into ORDER_PRODUCT (product_id, order_id)
values (318, 318);
insert into ORDER_PRODUCT (product_id, order_id)
values (318, 418);
insert into ORDER_PRODUCT (product_id, order_id)
values (320, 120);
insert into ORDER_PRODUCT (product_id, order_id)
values (320, 220);
insert into ORDER_PRODUCT (product_id, order_id)
values (320, 320);
insert into ORDER_PRODUCT (product_id, order_id)
values (321, 221);
insert into ORDER_PRODUCT (product_id, order_id)
values (323, 323);
insert into ORDER_PRODUCT (product_id, order_id)
values (323, 723);
insert into ORDER_PRODUCT (product_id, order_id)
values (324, 124);
insert into ORDER_PRODUCT (product_id, order_id)
values (324, 224);
insert into ORDER_PRODUCT (product_id, order_id)
values (327, 827);
insert into ORDER_PRODUCT (product_id, order_id)
values (327, 927);
insert into ORDER_PRODUCT (product_id, order_id)
values (330, 130);
insert into ORDER_PRODUCT (product_id, order_id)
values (330, 230);
insert into ORDER_PRODUCT (product_id, order_id)
values (331, 331);
insert into ORDER_PRODUCT (product_id, order_id)
values (332, 232);
insert into ORDER_PRODUCT (product_id, order_id)
values (332, 432);
insert into ORDER_PRODUCT (product_id, order_id)
values (333, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (333, 833);
insert into ORDER_PRODUCT (product_id, order_id)
values (335, 835);
insert into ORDER_PRODUCT (product_id, order_id)
values (339, 139);
insert into ORDER_PRODUCT (product_id, order_id)
values (342, 142);
insert into ORDER_PRODUCT (product_id, order_id)
values (344, 444);
insert into ORDER_PRODUCT (product_id, order_id)
values (345, 945);
insert into ORDER_PRODUCT (product_id, order_id)
values (347, 947);
insert into ORDER_PRODUCT (product_id, order_id)
values (356, 256);
insert into ORDER_PRODUCT (product_id, order_id)
values (359, 159);
insert into ORDER_PRODUCT (product_id, order_id)
values (359, 259);
insert into ORDER_PRODUCT (product_id, order_id)
values (359, 859);
insert into ORDER_PRODUCT (product_id, order_id)
values (364, 264);
insert into ORDER_PRODUCT (product_id, order_id)
values (364, 764);
insert into ORDER_PRODUCT (product_id, order_id)
values (366, 266);
insert into ORDER_PRODUCT (product_id, order_id)
values (371, 271);
insert into ORDER_PRODUCT (product_id, order_id)
values (372, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (374, 174);
insert into ORDER_PRODUCT (product_id, order_id)
values (377, 277);
insert into ORDER_PRODUCT (product_id, order_id)
values (377, 377);
insert into ORDER_PRODUCT (product_id, order_id)
values (377, 877);
insert into ORDER_PRODUCT (product_id, order_id)
values (378, 178);
insert into ORDER_PRODUCT (product_id, order_id)
values (384, 984);
insert into ORDER_PRODUCT (product_id, order_id)
values (388, 388);
insert into ORDER_PRODUCT (product_id, order_id)
values (391, 191);
insert into ORDER_PRODUCT (product_id, order_id)
values (391, 991);
insert into ORDER_PRODUCT (product_id, order_id)
values (392, 892);
insert into ORDER_PRODUCT (product_id, order_id)
values (395, 295);
insert into ORDER_PRODUCT (product_id, order_id)
values (395, 495);
insert into ORDER_PRODUCT (product_id, order_id)
values (396, 996);
insert into ORDER_PRODUCT (product_id, order_id)
values (399, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (400, 300);
insert into ORDER_PRODUCT (product_id, order_id)
values (401, 301);
insert into ORDER_PRODUCT (product_id, order_id)
values (402, 302);
insert into ORDER_PRODUCT (product_id, order_id)
values (402, 902);
insert into ORDER_PRODUCT (product_id, order_id)
values (404, 304);
insert into ORDER_PRODUCT (product_id, order_id)
values (404, 804);
insert into ORDER_PRODUCT (product_id, order_id)
values (405, 305);
insert into ORDER_PRODUCT (product_id, order_id)
values (407, 307);
insert into ORDER_PRODUCT (product_id, order_id)
values (409, 309);
insert into ORDER_PRODUCT (product_id, order_id)
values (410, 110);
insert into ORDER_PRODUCT (product_id, order_id)
values (410, 310);
insert into ORDER_PRODUCT (product_id, order_id)
values (410, 910);
insert into ORDER_PRODUCT (product_id, order_id)
values (411, 311);
insert into ORDER_PRODUCT (product_id, order_id)
values (413, 313);
insert into ORDER_PRODUCT (product_id, order_id)
values (415, 315);
insert into ORDER_PRODUCT (product_id, order_id)
values (416, 316);
insert into ORDER_PRODUCT (product_id, order_id)
values (418, 318);
insert into ORDER_PRODUCT (product_id, order_id)
values (418, 418);
insert into ORDER_PRODUCT (product_id, order_id)
values (420, 120);
insert into ORDER_PRODUCT (product_id, order_id)
values (420, 320);
insert into ORDER_PRODUCT (product_id, order_id)
values (421, 321);
insert into ORDER_PRODUCT (product_id, order_id)
values (423, 323);
insert into ORDER_PRODUCT (product_id, order_id)
values (424, 124);
insert into ORDER_PRODUCT (product_id, order_id)
values (426, 326);
insert into ORDER_PRODUCT (product_id, order_id)
values (427, 327);
insert into ORDER_PRODUCT (product_id, order_id)
values (427, 827);
insert into ORDER_PRODUCT (product_id, order_id)
values (427, 927);
insert into ORDER_PRODUCT (product_id, order_id)
values (430, 130);
insert into ORDER_PRODUCT (product_id, order_id)
values (430, 330);
insert into ORDER_PRODUCT (product_id, order_id)
values (431, 331);
commit;
prompt 200 records committed...
insert into ORDER_PRODUCT (product_id, order_id)
values (432, 332);
insert into ORDER_PRODUCT (product_id, order_id)
values (432, 432);
insert into ORDER_PRODUCT (product_id, order_id)
values (433, 833);
insert into ORDER_PRODUCT (product_id, order_id)
values (435, 335);
insert into ORDER_PRODUCT (product_id, order_id)
values (435, 835);
insert into ORDER_PRODUCT (product_id, order_id)
values (436, 336);
insert into ORDER_PRODUCT (product_id, order_id)
values (439, 139);
insert into ORDER_PRODUCT (product_id, order_id)
values (439, 339);
insert into ORDER_PRODUCT (product_id, order_id)
values (440, 340);
insert into ORDER_PRODUCT (product_id, order_id)
values (442, 142);
insert into ORDER_PRODUCT (product_id, order_id)
values (442, 342);
insert into ORDER_PRODUCT (product_id, order_id)
values (443, 343);
insert into ORDER_PRODUCT (product_id, order_id)
values (444, 444);
insert into ORDER_PRODUCT (product_id, order_id)
values (445, 945);
insert into ORDER_PRODUCT (product_id, order_id)
values (447, 947);
insert into ORDER_PRODUCT (product_id, order_id)
values (459, 159);
insert into ORDER_PRODUCT (product_id, order_id)
values (459, 359);
insert into ORDER_PRODUCT (product_id, order_id)
values (459, 859);
insert into ORDER_PRODUCT (product_id, order_id)
values (466, 366);
insert into ORDER_PRODUCT (product_id, order_id)
values (467, 367);
insert into ORDER_PRODUCT (product_id, order_id)
values (471, 371);
insert into ORDER_PRODUCT (product_id, order_id)
values (474, 174);
insert into ORDER_PRODUCT (product_id, order_id)
values (477, 377);
insert into ORDER_PRODUCT (product_id, order_id)
values (477, 877);
insert into ORDER_PRODUCT (product_id, order_id)
values (478, 178);
insert into ORDER_PRODUCT (product_id, order_id)
values (478, 378);
insert into ORDER_PRODUCT (product_id, order_id)
values (483, 383);
insert into ORDER_PRODUCT (product_id, order_id)
values (484, 984);
insert into ORDER_PRODUCT (product_id, order_id)
values (488, 388);
insert into ORDER_PRODUCT (product_id, order_id)
values (491, 191);
insert into ORDER_PRODUCT (product_id, order_id)
values (491, 391);
insert into ORDER_PRODUCT (product_id, order_id)
values (491, 991);
insert into ORDER_PRODUCT (product_id, order_id)
values (492, 892);
insert into ORDER_PRODUCT (product_id, order_id)
values (495, 395);
insert into ORDER_PRODUCT (product_id, order_id)
values (495, 495);
insert into ORDER_PRODUCT (product_id, order_id)
values (496, 396);
insert into ORDER_PRODUCT (product_id, order_id)
values (496, 996);
insert into ORDER_PRODUCT (product_id, order_id)
values (500, 400);
insert into ORDER_PRODUCT (product_id, order_id)
values (501, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (502, 502);
insert into ORDER_PRODUCT (product_id, order_id)
values (502, 902);
insert into ORDER_PRODUCT (product_id, order_id)
values (503, 403);
insert into ORDER_PRODUCT (product_id, order_id)
values (504, 404);
insert into ORDER_PRODUCT (product_id, order_id)
values (509, 409);
insert into ORDER_PRODUCT (product_id, order_id)
values (510, 110);
insert into ORDER_PRODUCT (product_id, order_id)
values (510, 410);
insert into ORDER_PRODUCT (product_id, order_id)
values (510, 910);
insert into ORDER_PRODUCT (product_id, order_id)
values (511, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (511, 411);
insert into ORDER_PRODUCT (product_id, order_id)
values (514, 414);
insert into ORDER_PRODUCT (product_id, order_id)
values (514, 514);
insert into ORDER_PRODUCT (product_id, order_id)
values (517, 417);
insert into ORDER_PRODUCT (product_id, order_id)
values (518, 418);
insert into ORDER_PRODUCT (product_id, order_id)
values (520, 120);
insert into ORDER_PRODUCT (product_id, order_id)
values (520, 420);
insert into ORDER_PRODUCT (product_id, order_id)
values (521, 421);
insert into ORDER_PRODUCT (product_id, order_id)
values (523, 423);
insert into ORDER_PRODUCT (product_id, order_id)
values (524, 124);
insert into ORDER_PRODUCT (product_id, order_id)
values (527, 927);
insert into ORDER_PRODUCT (product_id, order_id)
values (528, 428);
insert into ORDER_PRODUCT (product_id, order_id)
values (529, 429);
insert into ORDER_PRODUCT (product_id, order_id)
values (530, 130);
insert into ORDER_PRODUCT (product_id, order_id)
values (532, 432);
insert into ORDER_PRODUCT (product_id, order_id)
values (533, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (533, 433);
insert into ORDER_PRODUCT (product_id, order_id)
values (536, 436);
insert into ORDER_PRODUCT (product_id, order_id)
values (539, 139);
insert into ORDER_PRODUCT (product_id, order_id)
values (539, 439);
insert into ORDER_PRODUCT (product_id, order_id)
values (540, 440);
insert into ORDER_PRODUCT (product_id, order_id)
values (540, 540);
insert into ORDER_PRODUCT (product_id, order_id)
values (542, 142);
insert into ORDER_PRODUCT (product_id, order_id)
values (542, 442);
insert into ORDER_PRODUCT (product_id, order_id)
values (544, 444);
insert into ORDER_PRODUCT (product_id, order_id)
values (545, 445);
insert into ORDER_PRODUCT (product_id, order_id)
values (545, 945);
insert into ORDER_PRODUCT (product_id, order_id)
values (547, 947);
insert into ORDER_PRODUCT (product_id, order_id)
values (553, 553);
insert into ORDER_PRODUCT (product_id, order_id)
values (557, 557);
insert into ORDER_PRODUCT (product_id, order_id)
values (559, 159);
insert into ORDER_PRODUCT (product_id, order_id)
values (567, 567);
insert into ORDER_PRODUCT (product_id, order_id)
values (571, 471);
insert into ORDER_PRODUCT (product_id, order_id)
values (572, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (572, 572);
insert into ORDER_PRODUCT (product_id, order_id)
values (574, 174);
insert into ORDER_PRODUCT (product_id, order_id)
values (574, 474);
insert into ORDER_PRODUCT (product_id, order_id)
values (577, 577);
insert into ORDER_PRODUCT (product_id, order_id)
values (578, 178);
insert into ORDER_PRODUCT (product_id, order_id)
values (578, 478);
insert into ORDER_PRODUCT (product_id, order_id)
values (584, 984);
insert into ORDER_PRODUCT (product_id, order_id)
values (591, 191);
insert into ORDER_PRODUCT (product_id, order_id)
values (591, 491);
insert into ORDER_PRODUCT (product_id, order_id)
values (591, 991);
insert into ORDER_PRODUCT (product_id, order_id)
values (595, 495);
insert into ORDER_PRODUCT (product_id, order_id)
values (596, 496);
insert into ORDER_PRODUCT (product_id, order_id)
values (596, 996);
insert into ORDER_PRODUCT (product_id, order_id)
values (599, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (600, 500);
insert into ORDER_PRODUCT (product_id, order_id)
values (601, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (601, 601);
insert into ORDER_PRODUCT (product_id, order_id)
values (602, 502);
commit;
prompt 300 records committed...
insert into ORDER_PRODUCT (product_id, order_id)
values (604, 504);
insert into ORDER_PRODUCT (product_id, order_id)
values (605, 505);
insert into ORDER_PRODUCT (product_id, order_id)
values (608, 508);
insert into ORDER_PRODUCT (product_id, order_id)
values (610, 610);
insert into ORDER_PRODUCT (product_id, order_id)
values (611, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (611, 611);
insert into ORDER_PRODUCT (product_id, order_id)
values (614, 514);
insert into ORDER_PRODUCT (product_id, order_id)
values (615, 515);
insert into ORDER_PRODUCT (product_id, order_id)
values (617, 617);
insert into ORDER_PRODUCT (product_id, order_id)
values (625, 525);
insert into ORDER_PRODUCT (product_id, order_id)
values (626, 626);
insert into ORDER_PRODUCT (product_id, order_id)
values (631, 531);
insert into ORDER_PRODUCT (product_id, order_id)
values (633, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (633, 533);
insert into ORDER_PRODUCT (product_id, order_id)
values (635, 535);
insert into ORDER_PRODUCT (product_id, order_id)
values (636, 536);
insert into ORDER_PRODUCT (product_id, order_id)
values (637, 537);
insert into ORDER_PRODUCT (product_id, order_id)
values (640, 540);
insert into ORDER_PRODUCT (product_id, order_id)
values (641, 541);
insert into ORDER_PRODUCT (product_id, order_id)
values (641, 641);
insert into ORDER_PRODUCT (product_id, order_id)
values (643, 543);
insert into ORDER_PRODUCT (product_id, order_id)
values (646, 246);
insert into ORDER_PRODUCT (product_id, order_id)
values (647, 547);
insert into ORDER_PRODUCT (product_id, order_id)
values (653, 553);
insert into ORDER_PRODUCT (product_id, order_id)
values (655, 555);
insert into ORDER_PRODUCT (product_id, order_id)
values (656, 556);
insert into ORDER_PRODUCT (product_id, order_id)
values (656, 656);
insert into ORDER_PRODUCT (product_id, order_id)
values (657, 557);
insert into ORDER_PRODUCT (product_id, order_id)
values (657, 657);
insert into ORDER_PRODUCT (product_id, order_id)
values (665, 565);
insert into ORDER_PRODUCT (product_id, order_id)
values (665, 665);
insert into ORDER_PRODUCT (product_id, order_id)
values (667, 567);
insert into ORDER_PRODUCT (product_id, order_id)
values (667, 667);
insert into ORDER_PRODUCT (product_id, order_id)
values (669, 569);
insert into ORDER_PRODUCT (product_id, order_id)
values (671, 571);
insert into ORDER_PRODUCT (product_id, order_id)
values (672, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (672, 572);
insert into ORDER_PRODUCT (product_id, order_id)
values (674, 574);
insert into ORDER_PRODUCT (product_id, order_id)
values (677, 577);
insert into ORDER_PRODUCT (product_id, order_id)
values (680, 580);
insert into ORDER_PRODUCT (product_id, order_id)
values (682, 582);
insert into ORDER_PRODUCT (product_id, order_id)
values (684, 584);
insert into ORDER_PRODUCT (product_id, order_id)
values (689, 589);
insert into ORDER_PRODUCT (product_id, order_id)
values (692, 592);
insert into ORDER_PRODUCT (product_id, order_id)
values (692, 692);
insert into ORDER_PRODUCT (product_id, order_id)
values (699, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (699, 599);
insert into ORDER_PRODUCT (product_id, order_id)
values (701, 201);
insert into ORDER_PRODUCT (product_id, order_id)
values (701, 601);
insert into ORDER_PRODUCT (product_id, order_id)
values (702, 302);
insert into ORDER_PRODUCT (product_id, order_id)
values (702, 502);
insert into ORDER_PRODUCT (product_id, order_id)
values (702, 702);
insert into ORDER_PRODUCT (product_id, order_id)
values (703, 603);
insert into ORDER_PRODUCT (product_id, order_id)
values (703, 703);
insert into ORDER_PRODUCT (product_id, order_id)
values (704, 604);
insert into ORDER_PRODUCT (product_id, order_id)
values (704, 704);
insert into ORDER_PRODUCT (product_id, order_id)
values (708, 608);
insert into ORDER_PRODUCT (product_id, order_id)
values (709, 309);
insert into ORDER_PRODUCT (product_id, order_id)
values (709, 609);
insert into ORDER_PRODUCT (product_id, order_id)
values (710, 610);
insert into ORDER_PRODUCT (product_id, order_id)
values (711, 211);
insert into ORDER_PRODUCT (product_id, order_id)
values (711, 611);
insert into ORDER_PRODUCT (product_id, order_id)
values (714, 514);
insert into ORDER_PRODUCT (product_id, order_id)
values (715, 615);
insert into ORDER_PRODUCT (product_id, order_id)
values (717, 617);
insert into ORDER_PRODUCT (product_id, order_id)
values (718, 318);
insert into ORDER_PRODUCT (product_id, order_id)
values (719, 619);
insert into ORDER_PRODUCT (product_id, order_id)
values (720, 320);
insert into ORDER_PRODUCT (product_id, order_id)
values (720, 620);
insert into ORDER_PRODUCT (product_id, order_id)
values (722, 622);
insert into ORDER_PRODUCT (product_id, order_id)
values (723, 323);
insert into ORDER_PRODUCT (product_id, order_id)
values (723, 723);
insert into ORDER_PRODUCT (product_id, order_id)
values (726, 626);
insert into ORDER_PRODUCT (product_id, order_id)
values (727, 627);
insert into ORDER_PRODUCT (product_id, order_id)
values (728, 628);
insert into ORDER_PRODUCT (product_id, order_id)
values (730, 630);
insert into ORDER_PRODUCT (product_id, order_id)
values (731, 331);
insert into ORDER_PRODUCT (product_id, order_id)
values (732, 632);
insert into ORDER_PRODUCT (product_id, order_id)
values (733, 233);
insert into ORDER_PRODUCT (product_id, order_id)
values (733, 633);
insert into ORDER_PRODUCT (product_id, order_id)
values (734, 734);
insert into ORDER_PRODUCT (product_id, order_id)
values (735, 635);
insert into ORDER_PRODUCT (product_id, order_id)
values (737, 737);
insert into ORDER_PRODUCT (product_id, order_id)
values (738, 638);
insert into ORDER_PRODUCT (product_id, order_id)
values (740, 540);
insert into ORDER_PRODUCT (product_id, order_id)
values (740, 640);
insert into ORDER_PRODUCT (product_id, order_id)
values (741, 641);
insert into ORDER_PRODUCT (product_id, order_id)
values (742, 642);
insert into ORDER_PRODUCT (product_id, order_id)
values (743, 643);
insert into ORDER_PRODUCT (product_id, order_id)
values (744, 644);
insert into ORDER_PRODUCT (product_id, order_id)
values (745, 645);
insert into ORDER_PRODUCT (product_id, order_id)
values (746, 246);
insert into ORDER_PRODUCT (product_id, order_id)
values (747, 647);
insert into ORDER_PRODUCT (product_id, order_id)
values (749, 249);
insert into ORDER_PRODUCT (product_id, order_id)
values (750, 350);
insert into ORDER_PRODUCT (product_id, order_id)
values (750, 650);
insert into ORDER_PRODUCT (product_id, order_id)
values (751, 651);
insert into ORDER_PRODUCT (product_id, order_id)
values (752, 352);
insert into ORDER_PRODUCT (product_id, order_id)
values (753, 553);
insert into ORDER_PRODUCT (product_id, order_id)
values (753, 653);
commit;
prompt 400 records committed...
insert into ORDER_PRODUCT (product_id, order_id)
values (754, 354);
insert into ORDER_PRODUCT (product_id, order_id)
values (755, 555);
insert into ORDER_PRODUCT (product_id, order_id)
values (756, 656);
insert into ORDER_PRODUCT (product_id, order_id)
values (757, 557);
insert into ORDER_PRODUCT (product_id, order_id)
values (757, 657);
insert into ORDER_PRODUCT (product_id, order_id)
values (761, 261);
insert into ORDER_PRODUCT (product_id, order_id)
values (761, 361);
insert into ORDER_PRODUCT (product_id, order_id)
values (761, 561);
insert into ORDER_PRODUCT (product_id, order_id)
values (762, 362);
insert into ORDER_PRODUCT (product_id, order_id)
values (764, 764);
insert into ORDER_PRODUCT (product_id, order_id)
values (765, 565);
insert into ORDER_PRODUCT (product_id, order_id)
values (765, 665);
insert into ORDER_PRODUCT (product_id, order_id)
values (767, 567);
insert into ORDER_PRODUCT (product_id, order_id)
values (767, 667);
insert into ORDER_PRODUCT (product_id, order_id)
values (768, 668);
insert into ORDER_PRODUCT (product_id, order_id)
values (770, 670);
insert into ORDER_PRODUCT (product_id, order_id)
values (772, 272);
insert into ORDER_PRODUCT (product_id, order_id)
values (772, 572);
insert into ORDER_PRODUCT (product_id, order_id)
values (775, 675);
insert into ORDER_PRODUCT (product_id, order_id)
values (776, 676);
insert into ORDER_PRODUCT (product_id, order_id)
values (777, 377);
insert into ORDER_PRODUCT (product_id, order_id)
values (777, 577);
insert into ORDER_PRODUCT (product_id, order_id)
values (778, 678);
insert into ORDER_PRODUCT (product_id, order_id)
values (779, 679);
insert into ORDER_PRODUCT (product_id, order_id)
values (781, 381);
insert into ORDER_PRODUCT (product_id, order_id)
values (781, 681);
insert into ORDER_PRODUCT (product_id, order_id)
values (783, 683);
insert into ORDER_PRODUCT (product_id, order_id)
values (786, 786);
insert into ORDER_PRODUCT (product_id, order_id)
values (787, 687);
insert into ORDER_PRODUCT (product_id, order_id)
values (788, 388);
insert into ORDER_PRODUCT (product_id, order_id)
values (791, 691);
insert into ORDER_PRODUCT (product_id, order_id)
values (792, 692);
insert into ORDER_PRODUCT (product_id, order_id)
values (796, 696);
insert into ORDER_PRODUCT (product_id, order_id)
values (797, 597);
insert into ORDER_PRODUCT (product_id, order_id)
values (799, 299);
insert into ORDER_PRODUCT (product_id, order_id)
values (800, 700);
insert into ORDER_PRODUCT (product_id, order_id)
values (801, 601);
insert into ORDER_PRODUCT (product_id, order_id)
values (801, 701);
insert into ORDER_PRODUCT (product_id, order_id)
values (802, 302);
insert into ORDER_PRODUCT (product_id, order_id)
values (802, 702);
insert into ORDER_PRODUCT (product_id, order_id)
values (803, 703);
insert into ORDER_PRODUCT (product_id, order_id)
values (804, 704);
insert into ORDER_PRODUCT (product_id, order_id)
values (804, 804);
insert into ORDER_PRODUCT (product_id, order_id)
values (806, 706);
insert into ORDER_PRODUCT (product_id, order_id)
values (808, 708);
insert into ORDER_PRODUCT (product_id, order_id)
values (809, 309);
insert into ORDER_PRODUCT (product_id, order_id)
values (810, 610);
insert into ORDER_PRODUCT (product_id, order_id)
values (810, 710);
insert into ORDER_PRODUCT (product_id, order_id)
values (811, 611);
insert into ORDER_PRODUCT (product_id, order_id)
values (814, 714);
insert into ORDER_PRODUCT (product_id, order_id)
values (816, 716);
insert into ORDER_PRODUCT (product_id, order_id)
values (818, 318);
insert into ORDER_PRODUCT (product_id, order_id)
values (820, 320);
insert into ORDER_PRODUCT (product_id, order_id)
values (820, 720);
insert into ORDER_PRODUCT (product_id, order_id)
values (821, 721);
insert into ORDER_PRODUCT (product_id, order_id)
values (823, 323);
insert into ORDER_PRODUCT (product_id, order_id)
values (823, 723);
insert into ORDER_PRODUCT (product_id, order_id)
values (824, 724);
insert into ORDER_PRODUCT (product_id, order_id)
values (825, 725);
insert into ORDER_PRODUCT (product_id, order_id)
values (826, 626);
insert into ORDER_PRODUCT (product_id, order_id)
values (827, 727);
insert into ORDER_PRODUCT (product_id, order_id)
values (827, 827);
insert into ORDER_PRODUCT (product_id, order_id)
values (829, 729);
insert into ORDER_PRODUCT (product_id, order_id)
values (830, 730);
insert into ORDER_PRODUCT (product_id, order_id)
values (831, 331);
insert into ORDER_PRODUCT (product_id, order_id)
values (832, 732);
insert into ORDER_PRODUCT (product_id, order_id)
values (833, 833);
insert into ORDER_PRODUCT (product_id, order_id)
values (834, 734);
insert into ORDER_PRODUCT (product_id, order_id)
values (835, 835);
insert into ORDER_PRODUCT (product_id, order_id)
values (836, 736);
insert into ORDER_PRODUCT (product_id, order_id)
values (837, 737);
insert into ORDER_PRODUCT (product_id, order_id)
values (839, 739);
insert into ORDER_PRODUCT (product_id, order_id)
values (841, 641);
insert into ORDER_PRODUCT (product_id, order_id)
values (844, 744);
insert into ORDER_PRODUCT (product_id, order_id)
values (845, 745);
insert into ORDER_PRODUCT (product_id, order_id)
values (847, 747);
insert into ORDER_PRODUCT (product_id, order_id)
values (848, 748);
insert into ORDER_PRODUCT (product_id, order_id)
values (849, 749);
insert into ORDER_PRODUCT (product_id, order_id)
values (850, 350);
insert into ORDER_PRODUCT (product_id, order_id)
values (850, 750);
insert into ORDER_PRODUCT (product_id, order_id)
values (852, 352);
insert into ORDER_PRODUCT (product_id, order_id)
values (853, 753);
insert into ORDER_PRODUCT (product_id, order_id)
values (854, 354);
insert into ORDER_PRODUCT (product_id, order_id)
values (854, 754);
insert into ORDER_PRODUCT (product_id, order_id)
values (856, 656);
insert into ORDER_PRODUCT (product_id, order_id)
values (856, 756);
insert into ORDER_PRODUCT (product_id, order_id)
values (857, 657);
insert into ORDER_PRODUCT (product_id, order_id)
values (857, 757);
insert into ORDER_PRODUCT (product_id, order_id)
values (859, 859);
insert into ORDER_PRODUCT (product_id, order_id)
values (861, 361);
insert into ORDER_PRODUCT (product_id, order_id)
values (862, 362);
insert into ORDER_PRODUCT (product_id, order_id)
values (862, 762);
insert into ORDER_PRODUCT (product_id, order_id)
values (863, 763);
insert into ORDER_PRODUCT (product_id, order_id)
values (864, 764);
insert into ORDER_PRODUCT (product_id, order_id)
values (865, 665);
insert into ORDER_PRODUCT (product_id, order_id)
values (866, 766);
insert into ORDER_PRODUCT (product_id, order_id)
values (867, 667);
insert into ORDER_PRODUCT (product_id, order_id)
values (872, 772);
insert into ORDER_PRODUCT (product_id, order_id)
values (875, 775);
insert into ORDER_PRODUCT (product_id, order_id)
values (876, 776);
commit;
prompt 500 records committed...
insert into ORDER_PRODUCT (product_id, order_id)
values (877, 377);
insert into ORDER_PRODUCT (product_id, order_id)
values (877, 777);
insert into ORDER_PRODUCT (product_id, order_id)
values (877, 877);
insert into ORDER_PRODUCT (product_id, order_id)
values (878, 778);
insert into ORDER_PRODUCT (product_id, order_id)
values (880, 780);
insert into ORDER_PRODUCT (product_id, order_id)
values (881, 381);
insert into ORDER_PRODUCT (product_id, order_id)
values (882, 782);
insert into ORDER_PRODUCT (product_id, order_id)
values (883, 783);
insert into ORDER_PRODUCT (product_id, order_id)
values (886, 786);
insert into ORDER_PRODUCT (product_id, order_id)
values (888, 388);
insert into ORDER_PRODUCT (product_id, order_id)
values (889, 889);
insert into ORDER_PRODUCT (product_id, order_id)
values (890, 890);
insert into ORDER_PRODUCT (product_id, order_id)
values (891, 791);
insert into ORDER_PRODUCT (product_id, order_id)
values (892, 692);
insert into ORDER_PRODUCT (product_id, order_id)
values (892, 792);
insert into ORDER_PRODUCT (product_id, order_id)
values (892, 892);
insert into ORDER_PRODUCT (product_id, order_id)
values (893, 893);
insert into ORDER_PRODUCT (product_id, order_id)
values (895, 795);
insert into ORDER_PRODUCT (product_id, order_id)
values (897, 897);
insert into ORDER_PRODUCT (product_id, order_id)
values (898, 798);
commit;
prompt 520 records loaded
prompt Loading ORDER_SUPPLIER...
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (101, 201);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (101, 601);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (102, 302);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (102, 502);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (109, 309);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (110, 110);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (110, 610);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (111, 211);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (111, 611);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (114, 514);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (117, 617);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (118, 318);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (118, 418);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (120, 120);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (120, 320);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (122, 422);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (123, 323);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (124, 124);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (126, 626);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (130, 130);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (131, 331);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (132, 432);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (133, 233);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (139, 139);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (140, 540);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (141, 641);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (142, 142);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (144, 444);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (146, 246);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (149, 249);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (150, 350);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (152, 352);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (153, 553);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (154, 154);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (154, 354);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (155, 555);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (156, 656);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (157, 557);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (157, 657);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (159, 159);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (161, 261);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (161, 361);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (161, 561);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (162, 362);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (165, 565);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (165, 665);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (167, 567);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (167, 667);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (172, 272);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (172, 572);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (173, 473);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (174, 174);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (175, 175);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (177, 377);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (177, 577);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (178, 178);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (179, 479);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (181, 181);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (181, 381);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (185, 185);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (186, 186);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (188, 388);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (190, 490);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (191, 191);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (192, 692);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (193, 493);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (195, 495);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (197, 597);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (198, 198);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (199, 299);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (301, 201);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (301, 601);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (302, 302);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (302, 502);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (302, 702);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (303, 703);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (304, 704);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (304, 804);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (309, 309);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (310, 110);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (310, 610);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (311, 211);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (311, 611);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (314, 514);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (317, 617);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (318, 318);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (318, 418);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (320, 120);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (320, 320);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (322, 422);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (323, 323);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (323, 723);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (324, 124);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (326, 626);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (327, 827);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (330, 130);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (331, 331);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (332, 432);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (333, 233);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (333, 833);
commit;
prompt 100 records committed...
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (334, 734);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (335, 835);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (337, 737);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (339, 139);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (340, 540);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (341, 641);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (342, 142);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (344, 444);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (346, 246);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (349, 249);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (350, 350);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (352, 352);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (353, 553);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (354, 154);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (354, 354);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (355, 555);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (356, 656);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (357, 557);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (357, 657);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (359, 159);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (359, 859);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (361, 261);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (361, 361);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (361, 561);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (362, 362);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (364, 764);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (365, 565);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (365, 665);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (367, 567);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (367, 667);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (372, 272);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (372, 572);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (373, 473);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (374, 174);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (375, 175);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (377, 377);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (377, 577);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (377, 877);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (378, 178);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (379, 479);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (381, 181);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (381, 381);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (385, 185);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (386, 186);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (386, 786);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (388, 388);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (389, 889);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (390, 490);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (390, 890);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (391, 191);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (392, 692);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (392, 892);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (393, 493);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (393, 893);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (395, 495);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (397, 597);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (397, 897);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (398, 198);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (399, 299);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (401, 201);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (401, 601);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (402, 302);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (402, 502);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (402, 702);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (402, 902);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (403, 703);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (404, 704);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (404, 804);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (409, 309);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (410, 110);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (410, 610);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (410, 910);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (411, 211);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (411, 611);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (414, 514);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (417, 617);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (418, 318);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (418, 418);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (420, 120);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (420, 320);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (422, 422);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (423, 323);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (423, 723);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (424, 124);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (426, 626);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (427, 827);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (427, 927);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (430, 130);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (431, 331);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (432, 432);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (433, 233);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (433, 833);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (434, 734);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (435, 835);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (437, 737);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (439, 139);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (440, 540);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (441, 641);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (442, 142);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (444, 444);
commit;
prompt 200 records committed...
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (445, 945);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (446, 246);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (446, 946);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (447, 947);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (449, 249);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (450, 350);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (452, 352);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (453, 553);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (454, 154);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (454, 354);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (455, 555);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (456, 656);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (457, 557);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (457, 657);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (459, 159);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (459, 859);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (461, 261);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (461, 361);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (461, 561);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (461, 961);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (462, 362);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (464, 764);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (465, 565);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (465, 665);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (467, 567);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (467, 667);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (472, 272);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (472, 572);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (473, 473);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (474, 174);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (475, 175);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (477, 377);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (477, 577);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (477, 877);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (478, 178);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (479, 479);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (481, 181);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (481, 381);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (484, 984);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (485, 185);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (486, 186);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (486, 786);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (488, 388);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (489, 889);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (490, 490);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (490, 890);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (491, 191);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (491, 991);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (492, 692);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (492, 892);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (493, 493);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (493, 893);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (495, 495);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (496, 996);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (497, 597);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (497, 897);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (498, 198);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (498, 998);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (499, 299);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (501, 201);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (501, 601);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (502, 302);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (502, 502);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (502, 702);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (502, 902);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (503, 703);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (504, 704);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (504, 804);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (509, 309);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (510, 110);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (510, 610);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (510, 910);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (511, 211);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (511, 611);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (514, 514);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (517, 617);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (518, 318);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (518, 418);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (520, 120);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (520, 320);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (522, 422);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (523, 323);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (523, 723);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (524, 124);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (526, 626);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (527, 827);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (527, 927);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (530, 130);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (531, 331);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (532, 432);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (533, 233);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (533, 833);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (534, 734);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (535, 835);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (537, 737);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (539, 139);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (540, 540);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (541, 641);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (542, 142);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (544, 444);
commit;
prompt 300 records committed...
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (545, 945);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (546, 246);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (546, 946);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (547, 947);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (549, 249);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (550, 350);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (552, 352);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (553, 553);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (554, 154);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (554, 354);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (555, 555);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (556, 656);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (557, 557);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (557, 657);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (559, 159);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (559, 859);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (561, 261);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (561, 361);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (561, 561);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (561, 961);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (562, 362);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (564, 764);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (565, 565);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (565, 665);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (567, 567);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (567, 667);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (572, 272);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (572, 572);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (573, 473);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (574, 174);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (575, 175);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (577, 377);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (577, 577);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (577, 877);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (578, 178);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (579, 479);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (581, 181);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (581, 381);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (584, 984);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (585, 185);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (586, 186);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (586, 786);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (588, 388);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (589, 889);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (590, 490);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (590, 890);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (591, 191);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (591, 991);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (592, 692);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (592, 892);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (593, 493);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (593, 893);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (595, 495);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (596, 996);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (597, 597);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (597, 897);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (598, 198);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (598, 998);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (599, 299);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (601, 201);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (602, 302);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (602, 502);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (609, 309);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (610, 110);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (611, 211);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (614, 514);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (618, 318);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (618, 418);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (620, 120);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (620, 320);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (622, 422);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (623, 323);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (624, 124);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (630, 130);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (631, 331);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (632, 432);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (633, 233);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (639, 139);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (640, 540);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (642, 142);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (644, 444);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (646, 246);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (649, 249);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (650, 350);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (652, 352);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (653, 553);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (654, 154);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (654, 354);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (655, 555);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (657, 557);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (659, 159);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (661, 261);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (661, 361);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (661, 561);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (662, 362);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (665, 565);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (667, 567);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (672, 272);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (672, 572);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (673, 473);
commit;
prompt 400 records committed...
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (674, 174);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (675, 175);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (677, 377);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (677, 577);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (678, 178);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (679, 479);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (681, 181);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (681, 381);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (685, 185);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (686, 186);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (688, 388);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (690, 490);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (691, 191);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (693, 493);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (695, 495);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (697, 597);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (698, 198);
insert into ORDER_SUPPLIER (supplier_id, order_id)
values (699, 299);
commit;
prompt 418 records loaded
prompt Loading ORDER_WORKER...
insert into ORDER_WORKER (worker_id, order_id)
values (103, 703);
insert into ORDER_WORKER (worker_id, order_id)
values (104, 704);
insert into ORDER_WORKER (worker_id, order_id)
values (104, 804);
insert into ORDER_WORKER (worker_id, order_id)
values (109, 309);
insert into ORDER_WORKER (worker_id, order_id)
values (111, 211);
insert into ORDER_WORKER (worker_id, order_id)
values (111, 611);
insert into ORDER_WORKER (worker_id, order_id)
values (118, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (118, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (120, 120);
insert into ORDER_WORKER (worker_id, order_id)
values (120, 320);
insert into ORDER_WORKER (worker_id, order_id)
values (123, 323);
insert into ORDER_WORKER (worker_id, order_id)
values (123, 723);
insert into ORDER_WORKER (worker_id, order_id)
values (124, 124);
insert into ORDER_WORKER (worker_id, order_id)
values (126, 626);
insert into ORDER_WORKER (worker_id, order_id)
values (127, 827);
insert into ORDER_WORKER (worker_id, order_id)
values (127, 927);
insert into ORDER_WORKER (worker_id, order_id)
values (130, 130);
insert into ORDER_WORKER (worker_id, order_id)
values (131, 331);
insert into ORDER_WORKER (worker_id, order_id)
values (134, 734);
insert into ORDER_WORKER (worker_id, order_id)
values (135, 835);
insert into ORDER_WORKER (worker_id, order_id)
values (137, 737);
insert into ORDER_WORKER (worker_id, order_id)
values (139, 139);
insert into ORDER_WORKER (worker_id, order_id)
values (140, 540);
insert into ORDER_WORKER (worker_id, order_id)
values (142, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (144, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (146, 246);
insert into ORDER_WORKER (worker_id, order_id)
values (146, 946);
insert into ORDER_WORKER (worker_id, order_id)
values (147, 947);
insert into ORDER_WORKER (worker_id, order_id)
values (149, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (150, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (152, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (153, 553);
insert into ORDER_WORKER (worker_id, order_id)
values (154, 154);
insert into ORDER_WORKER (worker_id, order_id)
values (154, 354);
insert into ORDER_WORKER (worker_id, order_id)
values (159, 159);
insert into ORDER_WORKER (worker_id, order_id)
values (159, 859);
insert into ORDER_WORKER (worker_id, order_id)
values (164, 764);
insert into ORDER_WORKER (worker_id, order_id)
values (165, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (165, 665);
insert into ORDER_WORKER (worker_id, order_id)
values (172, 272);
insert into ORDER_WORKER (worker_id, order_id)
values (172, 572);
insert into ORDER_WORKER (worker_id, order_id)
values (173, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (177, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (177, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (177, 877);
insert into ORDER_WORKER (worker_id, order_id)
values (179, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (184, 984);
insert into ORDER_WORKER (worker_id, order_id)
values (185, 185);
insert into ORDER_WORKER (worker_id, order_id)
values (186, 186);
insert into ORDER_WORKER (worker_id, order_id)
values (186, 786);
insert into ORDER_WORKER (worker_id, order_id)
values (188, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (190, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (190, 890);
insert into ORDER_WORKER (worker_id, order_id)
values (191, 191);
insert into ORDER_WORKER (worker_id, order_id)
values (191, 991);
insert into ORDER_WORKER (worker_id, order_id)
values (193, 493);
insert into ORDER_WORKER (worker_id, order_id)
values (193, 893);
insert into ORDER_WORKER (worker_id, order_id)
values (196, 996);
insert into ORDER_WORKER (worker_id, order_id)
values (199, 299);
insert into ORDER_WORKER (worker_id, order_id)
values (201, 201);
insert into ORDER_WORKER (worker_id, order_id)
values (201, 601);
insert into ORDER_WORKER (worker_id, order_id)
values (202, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (202, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (202, 702);
insert into ORDER_WORKER (worker_id, order_id)
values (202, 902);
insert into ORDER_WORKER (worker_id, order_id)
values (203, 703);
insert into ORDER_WORKER (worker_id, order_id)
values (204, 704);
insert into ORDER_WORKER (worker_id, order_id)
values (204, 804);
insert into ORDER_WORKER (worker_id, order_id)
values (209, 309);
insert into ORDER_WORKER (worker_id, order_id)
values (211, 211);
insert into ORDER_WORKER (worker_id, order_id)
values (211, 611);
insert into ORDER_WORKER (worker_id, order_id)
values (218, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (218, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (223, 323);
insert into ORDER_WORKER (worker_id, order_id)
values (223, 723);
insert into ORDER_WORKER (worker_id, order_id)
values (227, 827);
insert into ORDER_WORKER (worker_id, order_id)
values (227, 927);
insert into ORDER_WORKER (worker_id, order_id)
values (232, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (233, 233);
insert into ORDER_WORKER (worker_id, order_id)
values (233, 833);
insert into ORDER_WORKER (worker_id, order_id)
values (234, 734);
insert into ORDER_WORKER (worker_id, order_id)
values (237, 737);
insert into ORDER_WORKER (worker_id, order_id)
values (239, 139);
insert into ORDER_WORKER (worker_id, order_id)
values (241, 641);
insert into ORDER_WORKER (worker_id, order_id)
values (242, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (244, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (245, 945);
insert into ORDER_WORKER (worker_id, order_id)
values (247, 947);
insert into ORDER_WORKER (worker_id, order_id)
values (249, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (250, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (252, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (254, 154);
insert into ORDER_WORKER (worker_id, order_id)
values (254, 354);
insert into ORDER_WORKER (worker_id, order_id)
values (256, 656);
insert into ORDER_WORKER (worker_id, order_id)
values (257, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (257, 657);
insert into ORDER_WORKER (worker_id, order_id)
values (259, 159);
insert into ORDER_WORKER (worker_id, order_id)
values (259, 859);
insert into ORDER_WORKER (worker_id, order_id)
values (264, 764);
insert into ORDER_WORKER (worker_id, order_id)
values (267, 567);
commit;
prompt 100 records committed...
insert into ORDER_WORKER (worker_id, order_id)
values (267, 667);
insert into ORDER_WORKER (worker_id, order_id)
values (272, 272);
insert into ORDER_WORKER (worker_id, order_id)
values (272, 572);
insert into ORDER_WORKER (worker_id, order_id)
values (274, 174);
insert into ORDER_WORKER (worker_id, order_id)
values (277, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (277, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (277, 877);
insert into ORDER_WORKER (worker_id, order_id)
values (278, 178);
insert into ORDER_WORKER (worker_id, order_id)
values (279, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (281, 181);
insert into ORDER_WORKER (worker_id, order_id)
values (281, 381);
insert into ORDER_WORKER (worker_id, order_id)
values (285, 185);
insert into ORDER_WORKER (worker_id, order_id)
values (286, 186);
insert into ORDER_WORKER (worker_id, order_id)
values (286, 786);
insert into ORDER_WORKER (worker_id, order_id)
values (288, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (289, 889);
insert into ORDER_WORKER (worker_id, order_id)
values (291, 191);
insert into ORDER_WORKER (worker_id, order_id)
values (291, 991);
insert into ORDER_WORKER (worker_id, order_id)
values (292, 692);
insert into ORDER_WORKER (worker_id, order_id)
values (292, 892);
insert into ORDER_WORKER (worker_id, order_id)
values (293, 493);
insert into ORDER_WORKER (worker_id, order_id)
values (293, 893);
insert into ORDER_WORKER (worker_id, order_id)
values (296, 996);
insert into ORDER_WORKER (worker_id, order_id)
values (297, 597);
insert into ORDER_WORKER (worker_id, order_id)
values (297, 897);
insert into ORDER_WORKER (worker_id, order_id)
values (302, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (302, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (302, 702);
insert into ORDER_WORKER (worker_id, order_id)
values (302, 902);
insert into ORDER_WORKER (worker_id, order_id)
values (303, 703);
insert into ORDER_WORKER (worker_id, order_id)
values (304, 704);
insert into ORDER_WORKER (worker_id, order_id)
values (304, 804);
insert into ORDER_WORKER (worker_id, order_id)
values (311, 211);
insert into ORDER_WORKER (worker_id, order_id)
values (311, 611);
insert into ORDER_WORKER (worker_id, order_id)
values (317, 617);
insert into ORDER_WORKER (worker_id, order_id)
values (318, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (318, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (320, 120);
insert into ORDER_WORKER (worker_id, order_id)
values (320, 320);
insert into ORDER_WORKER (worker_id, order_id)
values (322, 422);
insert into ORDER_WORKER (worker_id, order_id)
values (323, 323);
insert into ORDER_WORKER (worker_id, order_id)
values (323, 723);
insert into ORDER_WORKER (worker_id, order_id)
values (324, 124);
insert into ORDER_WORKER (worker_id, order_id)
values (331, 331);
insert into ORDER_WORKER (worker_id, order_id)
values (332, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (334, 734);
insert into ORDER_WORKER (worker_id, order_id)
values (335, 835);
insert into ORDER_WORKER (worker_id, order_id)
values (339, 139);
insert into ORDER_WORKER (worker_id, order_id)
values (340, 540);
insert into ORDER_WORKER (worker_id, order_id)
values (341, 641);
insert into ORDER_WORKER (worker_id, order_id)
values (346, 246);
insert into ORDER_WORKER (worker_id, order_id)
values (346, 946);
insert into ORDER_WORKER (worker_id, order_id)
values (347, 947);
insert into ORDER_WORKER (worker_id, order_id)
values (352, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (353, 553);
insert into ORDER_WORKER (worker_id, order_id)
values (354, 154);
insert into ORDER_WORKER (worker_id, order_id)
values (354, 354);
insert into ORDER_WORKER (worker_id, order_id)
values (355, 555);
insert into ORDER_WORKER (worker_id, order_id)
values (357, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (357, 657);
insert into ORDER_WORKER (worker_id, order_id)
values (359, 159);
insert into ORDER_WORKER (worker_id, order_id)
values (359, 859);
insert into ORDER_WORKER (worker_id, order_id)
values (361, 261);
insert into ORDER_WORKER (worker_id, order_id)
values (361, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (361, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (361, 961);
insert into ORDER_WORKER (worker_id, order_id)
values (365, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (365, 665);
insert into ORDER_WORKER (worker_id, order_id)
values (367, 567);
insert into ORDER_WORKER (worker_id, order_id)
values (367, 667);
insert into ORDER_WORKER (worker_id, order_id)
values (373, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (377, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (377, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (377, 877);
insert into ORDER_WORKER (worker_id, order_id)
values (381, 181);
insert into ORDER_WORKER (worker_id, order_id)
values (381, 381);
insert into ORDER_WORKER (worker_id, order_id)
values (388, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (390, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (390, 890);
insert into ORDER_WORKER (worker_id, order_id)
values (392, 692);
insert into ORDER_WORKER (worker_id, order_id)
values (392, 892);
insert into ORDER_WORKER (worker_id, order_id)
values (393, 493);
insert into ORDER_WORKER (worker_id, order_id)
values (393, 893);
insert into ORDER_WORKER (worker_id, order_id)
values (398, 198);
insert into ORDER_WORKER (worker_id, order_id)
values (398, 998);
insert into ORDER_WORKER (worker_id, order_id)
values (399, 299);
insert into ORDER_WORKER (worker_id, order_id)
values (401, 201);
insert into ORDER_WORKER (worker_id, order_id)
values (401, 601);
insert into ORDER_WORKER (worker_id, order_id)
values (402, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (402, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (402, 702);
insert into ORDER_WORKER (worker_id, order_id)
values (402, 902);
insert into ORDER_WORKER (worker_id, order_id)
values (409, 309);
insert into ORDER_WORKER (worker_id, order_id)
values (410, 110);
insert into ORDER_WORKER (worker_id, order_id)
values (410, 610);
insert into ORDER_WORKER (worker_id, order_id)
values (410, 910);
insert into ORDER_WORKER (worker_id, order_id)
values (414, 514);
insert into ORDER_WORKER (worker_id, order_id)
values (418, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (418, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (422, 422);
commit;
prompt 200 records committed...
insert into ORDER_WORKER (worker_id, order_id)
values (432, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (433, 233);
insert into ORDER_WORKER (worker_id, order_id)
values (433, 833);
insert into ORDER_WORKER (worker_id, order_id)
values (434, 734);
insert into ORDER_WORKER (worker_id, order_id)
values (441, 641);
insert into ORDER_WORKER (worker_id, order_id)
values (442, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (445, 945);
insert into ORDER_WORKER (worker_id, order_id)
values (446, 246);
insert into ORDER_WORKER (worker_id, order_id)
values (446, 946);
insert into ORDER_WORKER (worker_id, order_id)
values (449, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (450, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (454, 154);
insert into ORDER_WORKER (worker_id, order_id)
values (454, 354);
insert into ORDER_WORKER (worker_id, order_id)
values (455, 555);
insert into ORDER_WORKER (worker_id, order_id)
values (457, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (457, 657);
insert into ORDER_WORKER (worker_id, order_id)
values (462, 362);
insert into ORDER_WORKER (worker_id, order_id)
values (464, 764);
insert into ORDER_WORKER (worker_id, order_id)
values (465, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (465, 665);
insert into ORDER_WORKER (worker_id, order_id)
values (472, 272);
insert into ORDER_WORKER (worker_id, order_id)
values (472, 572);
insert into ORDER_WORKER (worker_id, order_id)
values (477, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (477, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (477, 877);
insert into ORDER_WORKER (worker_id, order_id)
values (478, 178);
insert into ORDER_WORKER (worker_id, order_id)
values (481, 181);
insert into ORDER_WORKER (worker_id, order_id)
values (481, 381);
insert into ORDER_WORKER (worker_id, order_id)
values (489, 889);
insert into ORDER_WORKER (worker_id, order_id)
values (496, 996);
insert into ORDER_WORKER (worker_id, order_id)
values (497, 597);
insert into ORDER_WORKER (worker_id, order_id)
values (497, 897);
insert into ORDER_WORKER (worker_id, order_id)
values (498, 198);
insert into ORDER_WORKER (worker_id, order_id)
values (498, 998);
insert into ORDER_WORKER (worker_id, order_id)
values (501, 201);
insert into ORDER_WORKER (worker_id, order_id)
values (501, 601);
insert into ORDER_WORKER (worker_id, order_id)
values (502, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (502, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (502, 702);
insert into ORDER_WORKER (worker_id, order_id)
values (502, 902);
insert into ORDER_WORKER (worker_id, order_id)
values (503, 703);
insert into ORDER_WORKER (worker_id, order_id)
values (504, 704);
insert into ORDER_WORKER (worker_id, order_id)
values (504, 804);
insert into ORDER_WORKER (worker_id, order_id)
values (509, 309);
insert into ORDER_WORKER (worker_id, order_id)
values (510, 110);
insert into ORDER_WORKER (worker_id, order_id)
values (510, 610);
insert into ORDER_WORKER (worker_id, order_id)
values (510, 910);
insert into ORDER_WORKER (worker_id, order_id)
values (514, 514);
insert into ORDER_WORKER (worker_id, order_id)
values (518, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (518, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (520, 120);
insert into ORDER_WORKER (worker_id, order_id)
values (520, 320);
insert into ORDER_WORKER (worker_id, order_id)
values (522, 422);
insert into ORDER_WORKER (worker_id, order_id)
values (523, 323);
insert into ORDER_WORKER (worker_id, order_id)
values (523, 723);
insert into ORDER_WORKER (worker_id, order_id)
values (526, 626);
insert into ORDER_WORKER (worker_id, order_id)
values (527, 827);
insert into ORDER_WORKER (worker_id, order_id)
values (527, 927);
insert into ORDER_WORKER (worker_id, order_id)
values (531, 331);
insert into ORDER_WORKER (worker_id, order_id)
values (533, 233);
insert into ORDER_WORKER (worker_id, order_id)
values (533, 833);
insert into ORDER_WORKER (worker_id, order_id)
values (539, 139);
insert into ORDER_WORKER (worker_id, order_id)
values (541, 641);
insert into ORDER_WORKER (worker_id, order_id)
values (542, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (544, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (545, 945);
insert into ORDER_WORKER (worker_id, order_id)
values (546, 246);
insert into ORDER_WORKER (worker_id, order_id)
values (546, 946);
insert into ORDER_WORKER (worker_id, order_id)
values (549, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (552, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (557, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (557, 657);
insert into ORDER_WORKER (worker_id, order_id)
values (561, 261);
insert into ORDER_WORKER (worker_id, order_id)
values (561, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (561, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (561, 961);
insert into ORDER_WORKER (worker_id, order_id)
values (564, 764);
insert into ORDER_WORKER (worker_id, order_id)
values (565, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (565, 665);
insert into ORDER_WORKER (worker_id, order_id)
values (572, 272);
insert into ORDER_WORKER (worker_id, order_id)
values (572, 572);
insert into ORDER_WORKER (worker_id, order_id)
values (574, 174);
insert into ORDER_WORKER (worker_id, order_id)
values (575, 175);
insert into ORDER_WORKER (worker_id, order_id)
values (577, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (577, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (577, 877);
insert into ORDER_WORKER (worker_id, order_id)
values (578, 178);
insert into ORDER_WORKER (worker_id, order_id)
values (579, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (584, 984);
insert into ORDER_WORKER (worker_id, order_id)
values (585, 185);
insert into ORDER_WORKER (worker_id, order_id)
values (586, 186);
insert into ORDER_WORKER (worker_id, order_id)
values (586, 786);
insert into ORDER_WORKER (worker_id, order_id)
values (588, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (589, 889);
insert into ORDER_WORKER (worker_id, order_id)
values (590, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (590, 890);
insert into ORDER_WORKER (worker_id, order_id)
values (591, 191);
insert into ORDER_WORKER (worker_id, order_id)
values (591, 991);
insert into ORDER_WORKER (worker_id, order_id)
values (592, 692);
insert into ORDER_WORKER (worker_id, order_id)
values (592, 892);
commit;
prompt 300 records committed...
insert into ORDER_WORKER (worker_id, order_id)
values (593, 493);
insert into ORDER_WORKER (worker_id, order_id)
values (593, 893);
insert into ORDER_WORKER (worker_id, order_id)
values (596, 996);
insert into ORDER_WORKER (worker_id, order_id)
values (598, 198);
insert into ORDER_WORKER (worker_id, order_id)
values (598, 998);
insert into ORDER_WORKER (worker_id, order_id)
values (599, 299);
insert into ORDER_WORKER (worker_id, order_id)
values (601, 201);
insert into ORDER_WORKER (worker_id, order_id)
values (610, 110);
insert into ORDER_WORKER (worker_id, order_id)
values (611, 211);
insert into ORDER_WORKER (worker_id, order_id)
values (614, 514);
insert into ORDER_WORKER (worker_id, order_id)
values (618, 318);
insert into ORDER_WORKER (worker_id, order_id)
values (618, 418);
insert into ORDER_WORKER (worker_id, order_id)
values (624, 124);
insert into ORDER_WORKER (worker_id, order_id)
values (630, 130);
insert into ORDER_WORKER (worker_id, order_id)
values (632, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (640, 540);
insert into ORDER_WORKER (worker_id, order_id)
values (642, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (649, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (657, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (661, 261);
insert into ORDER_WORKER (worker_id, order_id)
values (661, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (661, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (662, 362);
insert into ORDER_WORKER (worker_id, order_id)
values (665, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (667, 567);
insert into ORDER_WORKER (worker_id, order_id)
values (673, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (679, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (681, 381);
insert into ORDER_WORKER (worker_id, order_id)
values (688, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (695, 495);
insert into ORDER_WORKER (worker_id, order_id)
values (710, 110);
insert into ORDER_WORKER (worker_id, order_id)
values (722, 422);
insert into ORDER_WORKER (worker_id, order_id)
values (730, 130);
insert into ORDER_WORKER (worker_id, order_id)
values (731, 331);
insert into ORDER_WORKER (worker_id, order_id)
values (732, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (733, 233);
insert into ORDER_WORKER (worker_id, order_id)
values (739, 139);
insert into ORDER_WORKER (worker_id, order_id)
values (742, 142);
insert into ORDER_WORKER (worker_id, order_id)
values (744, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (746, 246);
insert into ORDER_WORKER (worker_id, order_id)
values (749, 249);
insert into ORDER_WORKER (worker_id, order_id)
values (750, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (757, 557);
insert into ORDER_WORKER (worker_id, order_id)
values (761, 261);
insert into ORDER_WORKER (worker_id, order_id)
values (761, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (761, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (762, 362);
insert into ORDER_WORKER (worker_id, order_id)
values (765, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (773, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (774, 174);
insert into ORDER_WORKER (worker_id, order_id)
values (775, 175);
insert into ORDER_WORKER (worker_id, order_id)
values (778, 178);
insert into ORDER_WORKER (worker_id, order_id)
values (779, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (781, 181);
insert into ORDER_WORKER (worker_id, order_id)
values (781, 381);
insert into ORDER_WORKER (worker_id, order_id)
values (786, 186);
insert into ORDER_WORKER (worker_id, order_id)
values (788, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (790, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (791, 191);
insert into ORDER_WORKER (worker_id, order_id)
values (793, 493);
insert into ORDER_WORKER (worker_id, order_id)
values (797, 597);
insert into ORDER_WORKER (worker_id, order_id)
values (799, 299);
insert into ORDER_WORKER (worker_id, order_id)
values (801, 201);
insert into ORDER_WORKER (worker_id, order_id)
values (802, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (802, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (820, 320);
insert into ORDER_WORKER (worker_id, order_id)
values (822, 422);
insert into ORDER_WORKER (worker_id, order_id)
values (832, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (833, 233);
insert into ORDER_WORKER (worker_id, order_id)
values (844, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (850, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (852, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (855, 555);
insert into ORDER_WORKER (worker_id, order_id)
values (861, 261);
insert into ORDER_WORKER (worker_id, order_id)
values (861, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (861, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (862, 362);
insert into ORDER_WORKER (worker_id, order_id)
values (865, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (867, 567);
insert into ORDER_WORKER (worker_id, order_id)
values (873, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (877, 377);
insert into ORDER_WORKER (worker_id, order_id)
values (877, 577);
insert into ORDER_WORKER (worker_id, order_id)
values (879, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (888, 388);
insert into ORDER_WORKER (worker_id, order_id)
values (890, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (902, 302);
insert into ORDER_WORKER (worker_id, order_id)
values (902, 502);
insert into ORDER_WORKER (worker_id, order_id)
values (909, 309);
insert into ORDER_WORKER (worker_id, order_id)
values (920, 320);
insert into ORDER_WORKER (worker_id, order_id)
values (931, 331);
insert into ORDER_WORKER (worker_id, order_id)
values (932, 432);
insert into ORDER_WORKER (worker_id, order_id)
values (940, 540);
insert into ORDER_WORKER (worker_id, order_id)
values (944, 444);
insert into ORDER_WORKER (worker_id, order_id)
values (950, 350);
insert into ORDER_WORKER (worker_id, order_id)
values (952, 352);
insert into ORDER_WORKER (worker_id, order_id)
values (955, 555);
insert into ORDER_WORKER (worker_id, order_id)
values (961, 361);
insert into ORDER_WORKER (worker_id, order_id)
values (961, 561);
insert into ORDER_WORKER (worker_id, order_id)
values (965, 565);
insert into ORDER_WORKER (worker_id, order_id)
values (972, 572);
commit;
prompt 400 records committed...
insert into ORDER_WORKER (worker_id, order_id)
values (973, 473);
insert into ORDER_WORKER (worker_id, order_id)
values (979, 479);
insert into ORDER_WORKER (worker_id, order_id)
values (990, 490);
insert into ORDER_WORKER (worker_id, order_id)
values (993, 493);
commit;
prompt 404 records loaded
prompt Loading PURCHASE...
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (604, to_date('27-03-2025', 'dd-mm-yyyy'), to_date('16-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (319, to_date('08-02-2025', 'dd-mm-yyyy'), to_date('02-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (348, to_date('28-03-2025', 'dd-mm-yyyy'), to_date('27-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (179, to_date('15-08-2025', 'dd-mm-yyyy'), to_date('14-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (388, to_date('23-12-2026', 'dd-mm-yyyy'), to_date('07-05-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (863, to_date('24-07-2025', 'dd-mm-yyyy'), to_date('14-03-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (116, to_date('21-05-2029', 'dd-mm-yyyy'), to_date('23-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (814, to_date('22-07-2029', 'dd-mm-yyyy'), to_date('05-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (474, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (436, to_date('02-08-2028', 'dd-mm-yyyy'), to_date('21-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (339, to_date('11-09-2025', 'dd-mm-yyyy'), to_date('17-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (464, to_date('19-11-2028', 'dd-mm-yyyy'), to_date('06-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (676, to_date('29-05-2025', 'dd-mm-yyyy'), to_date('20-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (395, to_date('04-01-2027', 'dd-mm-yyyy'), to_date('22-03-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (183, to_date('27-02-2027', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (677, to_date('21-08-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (611, to_date('18-06-2026', 'dd-mm-yyyy'), to_date('03-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (123, to_date('28-02-2030', 'dd-mm-yyyy'), to_date('06-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (852, to_date('22-05-2025', 'dd-mm-yyyy'), to_date('17-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (157, to_date('24-01-2027', 'dd-mm-yyyy'), to_date('03-07-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (843, to_date('17-10-2029', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (555, to_date('05-12-2024', 'dd-mm-yyyy'), to_date('21-03-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (208, to_date('09-12-2025', 'dd-mm-yyyy'), to_date('18-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (145, to_date('11-01-2025', 'dd-mm-yyyy'), to_date('29-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (778, to_date('25-02-2026', 'dd-mm-yyyy'), to_date('26-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (162, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('26-03-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (377, to_date('04-10-2025', 'dd-mm-yyyy'), to_date('11-08-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (956, to_date('26-12-2030', 'dd-mm-yyyy'), to_date('07-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (911, to_date('14-01-2030', 'dd-mm-yyyy'), to_date('06-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (811, to_date('11-04-2028', 'dd-mm-yyyy'), to_date('05-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (605, to_date('08-06-2030', 'dd-mm-yyyy'), to_date('26-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (982, to_date('14-03-2030', 'dd-mm-yyyy'), to_date('19-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (993, to_date('21-03-2027', 'dd-mm-yyyy'), to_date('13-11-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (965, to_date('10-05-2024', 'dd-mm-yyyy'), to_date('08-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (847, to_date('21-06-2028', 'dd-mm-yyyy'), to_date('14-12-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (178, to_date('20-06-2028', 'dd-mm-yyyy'), to_date('29-11-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (976, to_date('13-04-2027', 'dd-mm-yyyy'), to_date('15-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (590, to_date('06-05-2025', 'dd-mm-yyyy'), to_date('05-06-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (638, to_date('22-07-2028', 'dd-mm-yyyy'), to_date('28-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (294, to_date('09-07-2027', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (307, to_date('19-11-2024', 'dd-mm-yyyy'), to_date('13-05-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (172, to_date('28-03-2026', 'dd-mm-yyyy'), to_date('22-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (207, to_date('12-04-2027', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (725, to_date('29-03-2027', 'dd-mm-yyyy'), to_date('07-11-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (702, to_date('31-08-2030', 'dd-mm-yyyy'), to_date('10-04-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (987, to_date('08-08-2028', 'dd-mm-yyyy'), to_date('28-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (189, to_date('21-07-2024', 'dd-mm-yyyy'), to_date('01-10-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (352, to_date('17-03-2028', 'dd-mm-yyyy'), to_date('16-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (851, to_date('26-08-2024', 'dd-mm-yyyy'), to_date('19-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (358, to_date('07-04-2024', 'dd-mm-yyyy'), to_date('10-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (648, to_date('02-03-2029', 'dd-mm-yyyy'), to_date('14-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (364, to_date('20-10-2026', 'dd-mm-yyyy'), to_date('29-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (498, to_date('05-05-2027', 'dd-mm-yyyy'), to_date('08-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (789, to_date('27-10-2025', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (554, to_date('18-12-2026', 'dd-mm-yyyy'), to_date('30-09-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (266, to_date('29-12-2028', 'dd-mm-yyyy'), to_date('25-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (130, to_date('26-03-2025', 'dd-mm-yyyy'), to_date('23-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (461, to_date('12-09-2030', 'dd-mm-yyyy'), to_date('21-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (878, to_date('07-04-2024', 'dd-mm-yyyy'), to_date('19-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (653, to_date('04-01-2029', 'dd-mm-yyyy'), to_date('31-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (508, to_date('03-12-2029', 'dd-mm-yyyy'), to_date('24-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (949, to_date('30-03-2030', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (968, to_date('08-09-2030', 'dd-mm-yyyy'), to_date('06-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (896, to_date('21-08-2024', 'dd-mm-yyyy'), to_date('12-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (444, to_date('17-07-2029', 'dd-mm-yyyy'), to_date('09-10-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (849, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('23-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (833, to_date('15-02-2028', 'dd-mm-yyyy'), to_date('20-07-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (290, to_date('27-10-2027', 'dd-mm-yyyy'), to_date('15-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (516, to_date('08-03-2026', 'dd-mm-yyyy'), to_date('06-04-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (614, to_date('09-04-2024', 'dd-mm-yyyy'), to_date('31-03-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (805, to_date('23-06-2025', 'dd-mm-yyyy'), to_date('22-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (220, to_date('04-01-2025', 'dd-mm-yyyy'), to_date('08-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (724, to_date('25-09-2025', 'dd-mm-yyyy'), to_date('03-05-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (933, to_date('16-06-2028', 'dd-mm-yyyy'), to_date('04-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (801, to_date('02-07-2028', 'dd-mm-yyyy'), to_date('04-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (793, to_date('11-10-2030', 'dd-mm-yyyy'), to_date('21-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (795, to_date('18-08-2029', 'dd-mm-yyyy'), to_date('24-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (631, to_date('04-01-2025', 'dd-mm-yyyy'), to_date('29-01-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (366, to_date('14-09-2027', 'dd-mm-yyyy'), to_date('01-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (439, to_date('18-11-2030', 'dd-mm-yyyy'), to_date('01-04-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (809, to_date('05-12-2024', 'dd-mm-yyyy'), to_date('31-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (186, to_date('04-02-2030', 'dd-mm-yyyy'), to_date('06-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (650, to_date('14-02-2030', 'dd-mm-yyyy'), to_date('20-09-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (547, to_date('06-03-2028', 'dd-mm-yyyy'), to_date('28-03-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (504, to_date('14-10-2028', 'dd-mm-yyyy'), to_date('22-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (762, to_date('11-11-2024', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (821, to_date('05-07-2024', 'dd-mm-yyyy'), to_date('19-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (640, to_date('19-10-2030', 'dd-mm-yyyy'), to_date('16-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (600, to_date('15-08-2026', 'dd-mm-yyyy'), to_date('25-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (610, to_date('06-01-2028', 'dd-mm-yyyy'), to_date('02-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (258, to_date('14-09-2030', 'dd-mm-yyyy'), to_date('28-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (839, to_date('24-06-2030', 'dd-mm-yyyy'), to_date('23-08-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (527, to_date('20-07-2028', 'dd-mm-yyyy'), to_date('17-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (184, to_date('09-08-2027', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (257, to_date('15-04-2028', 'dd-mm-yyyy'), to_date('08-10-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (672, to_date('03-03-2026', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (935, to_date('13-05-2024', 'dd-mm-yyyy'), to_date('06-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (467, to_date('16-04-2024', 'dd-mm-yyyy'), to_date('30-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (393, to_date('06-04-2025', 'dd-mm-yyyy'), to_date('11-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (767, to_date('05-07-2030', 'dd-mm-yyyy'), to_date('30-08-2024', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (685, to_date('03-07-2030', 'dd-mm-yyyy'), to_date('21-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (728, to_date('23-02-2025', 'dd-mm-yyyy'), to_date('24-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (261, to_date('12-12-2027', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (460, to_date('19-07-2028', 'dd-mm-yyyy'), to_date('22-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (825, to_date('14-05-2026', 'dd-mm-yyyy'), to_date('01-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (705, to_date('15-07-2027', 'dd-mm-yyyy'), to_date('07-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (808, to_date('30-05-2030', 'dd-mm-yyyy'), to_date('03-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (478, to_date('14-09-2024', 'dd-mm-yyyy'), to_date('10-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (582, to_date('22-12-2030', 'dd-mm-yyyy'), to_date('10-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (885, to_date('07-01-2030', 'dd-mm-yyyy'), to_date('23-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (427, to_date('02-08-2026', 'dd-mm-yyyy'), to_date('04-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (782, to_date('29-12-2024', 'dd-mm-yyyy'), to_date('16-07-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (382, to_date('15-03-2028', 'dd-mm-yyyy'), to_date('14-08-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (587, to_date('25-02-2030', 'dd-mm-yyyy'), to_date('01-02-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (699, to_date('10-12-2026', 'dd-mm-yyyy'), to_date('19-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (556, to_date('22-11-2028', 'dd-mm-yyyy'), to_date('05-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (494, to_date('19-03-2024', 'dd-mm-yyyy'), to_date('31-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (837, to_date('19-08-2024', 'dd-mm-yyyy'), to_date('30-06-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (983, to_date('10-07-2028', 'dd-mm-yyyy'), to_date('16-11-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (454, to_date('01-05-2026', 'dd-mm-yyyy'), to_date('15-08-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (295, to_date('06-11-2029', 'dd-mm-yyyy'), to_date('30-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (948, to_date('10-07-2027', 'dd-mm-yyyy'), to_date('09-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (385, to_date('30-06-2028', 'dd-mm-yyyy'), to_date('14-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (522, to_date('28-03-2030', 'dd-mm-yyyy'), to_date('09-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (409, to_date('24-12-2029', 'dd-mm-yyyy'), to_date('15-11-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (376, to_date('15-04-2028', 'dd-mm-yyyy'), to_date('14-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (264, to_date('01-12-2028', 'dd-mm-yyyy'), to_date('16-03-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (749, to_date('13-03-2026', 'dd-mm-yyyy'), to_date('06-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (893, to_date('05-08-2029', 'dd-mm-yyyy'), to_date('16-06-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (649, to_date('11-03-2025', 'dd-mm-yyyy'), to_date('23-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (412, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('03-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (141, to_date('07-02-2030', 'dd-mm-yyyy'), to_date('13-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (637, to_date('19-02-2024', 'dd-mm-yyyy'), to_date('27-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (799, to_date('24-02-2024', 'dd-mm-yyyy'), to_date('18-06-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (137, to_date('26-03-2027', 'dd-mm-yyyy'), to_date('15-10-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (239, to_date('22-09-2025', 'dd-mm-yyyy'), to_date('22-08-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (780, to_date('28-01-2030', 'dd-mm-yyyy'), to_date('27-07-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (149, to_date('21-01-2029', 'dd-mm-yyyy'), to_date('20-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (941, to_date('19-02-2028', 'dd-mm-yyyy'), to_date('20-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (570, to_date('26-02-2029', 'dd-mm-yyyy'), to_date('10-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (296, to_date('08-12-2030', 'dd-mm-yyyy'), to_date('01-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (629, to_date('11-06-2025', 'dd-mm-yyyy'), to_date('03-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (691, to_date('19-02-2029', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (397, to_date('22-10-2029', 'dd-mm-yyyy'), to_date('20-02-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (817, to_date('21-08-2025', 'dd-mm-yyyy'), to_date('11-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (758, to_date('05-08-2027', 'dd-mm-yyyy'), to_date('29-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (874, to_date('11-01-2030', 'dd-mm-yyyy'), to_date('29-12-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (177, to_date('27-11-2029', 'dd-mm-yyyy'), to_date('06-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (868, to_date('25-08-2027', 'dd-mm-yyyy'), to_date('06-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (110, to_date('17-01-2025', 'dd-mm-yyyy'), to_date('20-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (175, to_date('05-01-2029', 'dd-mm-yyyy'), to_date('18-04-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (422, to_date('05-10-2024', 'dd-mm-yyyy'), to_date('22-11-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (625, to_date('16-04-2024', 'dd-mm-yyyy'), to_date('04-06-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (963, to_date('27-03-2027', 'dd-mm-yyyy'), to_date('30-11-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (740, to_date('20-06-2029', 'dd-mm-yyyy'), to_date('08-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (523, to_date('01-11-2025', 'dd-mm-yyyy'), to_date('04-10-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (776, to_date('10-10-2026', 'dd-mm-yyyy'), to_date('05-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (855, to_date('17-06-2026', 'dd-mm-yyyy'), to_date('09-06-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (857, to_date('08-08-2030', 'dd-mm-yyyy'), to_date('02-11-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (410, to_date('24-12-2026', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (297, to_date('18-03-2025', 'dd-mm-yyyy'), to_date('29-06-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (564, to_date('27-06-2025', 'dd-mm-yyyy'), to_date('16-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (323, to_date('10-06-2027', 'dd-mm-yyyy'), to_date('22-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (573, to_date('02-02-2029', 'dd-mm-yyyy'), to_date('18-11-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (344, to_date('27-10-2030', 'dd-mm-yyyy'), to_date('22-05-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (111, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('28-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (652, to_date('01-10-2028', 'dd-mm-yyyy'), to_date('17-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (201, to_date('23-06-2029', 'dd-mm-yyyy'), to_date('09-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (877, to_date('25-10-2025', 'dd-mm-yyyy'), to_date('29-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (932, to_date('27-09-2028', 'dd-mm-yyyy'), to_date('26-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (218, to_date('28-07-2026', 'dd-mm-yyyy'), to_date('04-11-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (219, to_date('18-08-2028', 'dd-mm-yyyy'), to_date('23-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (539, to_date('31-10-2024', 'dd-mm-yyyy'), to_date('08-11-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (727, to_date('19-05-2029', 'dd-mm-yyyy'), to_date('20-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (531, to_date('14-12-2024', 'dd-mm-yyyy'), to_date('16-10-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (197, to_date('25-02-2026', 'dd-mm-yyyy'), to_date('23-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (430, to_date('30-12-2028', 'dd-mm-yyyy'), to_date('28-08-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (456, to_date('04-12-2025', 'dd-mm-yyyy'), to_date('06-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (190, to_date('16-01-2025', 'dd-mm-yyyy'), to_date('15-10-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (337, to_date('02-05-2024', 'dd-mm-yyyy'), to_date('11-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (400, to_date('06-07-2028', 'dd-mm-yyyy'), to_date('13-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (205, to_date('25-11-2026', 'dd-mm-yyyy'), to_date('31-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (288, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('26-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (310, to_date('14-09-2026', 'dd-mm-yyyy'), to_date('04-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (742, to_date('29-01-2025', 'dd-mm-yyyy'), to_date('03-05-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (813, to_date('10-06-2028', 'dd-mm-yyyy'), to_date('05-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (918, to_date('16-03-2028', 'dd-mm-yyyy'), to_date('06-04-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (404, to_date('02-11-2030', 'dd-mm-yyyy'), to_date('03-06-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (748, to_date('01-12-2024', 'dd-mm-yyyy'), to_date('07-04-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (381, to_date('28-02-2024', 'dd-mm-yyyy'), to_date('15-02-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (543, to_date('28-08-2030', 'dd-mm-yyyy'), to_date('26-08-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (589, to_date('04-10-2028', 'dd-mm-yyyy'), to_date('26-05-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (443, to_date('21-01-2026', 'dd-mm-yyyy'), to_date('22-01-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (255, to_date('27-05-2025', 'dd-mm-yyyy'), to_date('02-03-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (670, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('30-11-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (603, to_date('04-11-2029', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (551, to_date('21-11-2025', 'dd-mm-yyyy'), to_date('14-02-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (229, to_date('15-06-2026', 'dd-mm-yyyy'), to_date('25-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (815, to_date('28-03-2025', 'dd-mm-yyyy'), to_date('28-12-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (711, to_date('29-01-2030', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (269, to_date('17-11-2027', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (591, to_date('14-11-2028', 'dd-mm-yyyy'), to_date('13-04-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (254, to_date('21-06-2025', 'dd-mm-yyyy'), to_date('19-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (929, to_date('17-11-2029', 'dd-mm-yyyy'), to_date('09-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (618, to_date('12-12-2025', 'dd-mm-yyyy'), to_date('25-03-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (788, to_date('22-09-2026', 'dd-mm-yyyy'), to_date('22-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (226, to_date('10-06-2030', 'dd-mm-yyyy'), to_date('10-09-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (971, to_date('28-10-2027', 'dd-mm-yyyy'), to_date('14-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (867, to_date('02-11-2024', 'dd-mm-yyyy'), to_date('16-03-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (350, to_date('12-04-2029', 'dd-mm-yyyy'), to_date('26-10-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (526, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (741, to_date('28-03-2026', 'dd-mm-yyyy'), to_date('17-08-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (950, to_date('31-07-2027', 'dd-mm-yyyy'), to_date('08-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (881, to_date('25-12-2027', 'dd-mm-yyyy'), to_date('08-10-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (124, to_date('28-06-2026', 'dd-mm-yyyy'), to_date('31-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (644, to_date('06-02-2029', 'dd-mm-yyyy'), to_date('27-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (368, to_date('01-04-2028', 'dd-mm-yyyy'), to_date('26-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (280, to_date('28-04-2027', 'dd-mm-yyyy'), to_date('14-01-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (155, to_date('24-12-2027', 'dd-mm-yyyy'), to_date('30-10-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (916, to_date('14-07-2025', 'dd-mm-yyyy'), to_date('18-10-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (930, to_date('02-10-2025', 'dd-mm-yyyy'), to_date('17-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (777, to_date('24-01-2029', 'dd-mm-yyyy'), to_date('13-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (442, to_date('11-05-2028', 'dd-mm-yyyy'), to_date('25-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (969, to_date('16-07-2030', 'dd-mm-yyyy'), to_date('11-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (506, to_date('15-11-2028', 'dd-mm-yyyy'), to_date('31-05-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (734, to_date('15-05-2029', 'dd-mm-yyyy'), to_date('24-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (171, to_date('20-02-2026', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (118, to_date('15-02-2025', 'dd-mm-yyyy'), to_date('29-11-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (479, to_date('16-09-2029', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (407, to_date('11-03-2024', 'dd-mm-yyyy'), to_date('31-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (645, to_date('08-02-2028', 'dd-mm-yyyy'), to_date('20-02-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (246, to_date('28-05-2026', 'dd-mm-yyyy'), to_date('29-04-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (580, to_date('23-05-2027', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (844, to_date('01-06-2026', 'dd-mm-yyyy'), to_date('22-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (129, to_date('05-12-2027', 'dd-mm-yyyy'), to_date('09-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (720, to_date('08-06-2027', 'dd-mm-yyyy'), to_date('05-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (925, to_date('06-06-2026', 'dd-mm-yyyy'), to_date('06-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (818, to_date('09-01-2028', 'dd-mm-yyyy'), to_date('03-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (891, to_date('11-04-2030', 'dd-mm-yyyy'), to_date('11-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (101, to_date('17-10-2030', 'dd-mm-yyyy'), to_date('24-09-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (302, to_date('03-11-2027', 'dd-mm-yyyy'), to_date('14-11-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (332, to_date('09-10-2025', 'dd-mm-yyyy'), to_date('08-11-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (519, to_date('25-07-2029', 'dd-mm-yyyy'), to_date('15-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (380, to_date('17-01-2028', 'dd-mm-yyyy'), to_date('02-09-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (306, to_date('14-02-2026', 'dd-mm-yyyy'), to_date('06-11-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (515, to_date('20-08-2030', 'dd-mm-yyyy'), to_date('26-04-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (369, to_date('21-02-2025', 'dd-mm-yyyy'), to_date('10-09-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (892, to_date('19-03-2026', 'dd-mm-yyyy'), to_date('01-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (566, to_date('15-03-2025', 'dd-mm-yyyy'), to_date('25-05-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (390, to_date('15-11-2024', 'dd-mm-yyyy'), to_date('05-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (598, to_date('06-04-2029', 'dd-mm-yyyy'), to_date('05-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (117, to_date('29-08-2029', 'dd-mm-yyyy'), to_date('07-11-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (533, to_date('05-07-2025', 'dd-mm-yyyy'), to_date('02-08-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (535, to_date('27-07-2025', 'dd-mm-yyyy'), to_date('09-11-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (206, to_date('25-03-2024', 'dd-mm-yyyy'), to_date('04-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (505, to_date('24-04-2030', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (944, to_date('17-07-2024', 'dd-mm-yyyy'), to_date('22-06-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (169, to_date('08-01-2028', 'dd-mm-yyyy'), to_date('29-09-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (990, to_date('09-01-2030', 'dd-mm-yyyy'), to_date('04-01-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (770, to_date('29-10-2028', 'dd-mm-yyyy'), to_date('06-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (912, to_date('28-11-2027', 'dd-mm-yyyy'), to_date('04-02-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (899, to_date('27-07-2024', 'dd-mm-yyyy'), to_date('20-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (810, to_date('16-03-2030', 'dd-mm-yyyy'), to_date('12-11-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (624, to_date('25-04-2027', 'dd-mm-yyyy'), to_date('31-05-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (667, to_date('04-10-2027', 'dd-mm-yyyy'), to_date('24-12-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (173, to_date('14-11-2026', 'dd-mm-yyyy'), to_date('16-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (514, to_date('29-06-2027', 'dd-mm-yyyy'), to_date('22-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (466, to_date('14-02-2026', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (658, to_date('04-06-2026', 'dd-mm-yyyy'), to_date('11-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (832, to_date('20-11-2024', 'dd-mm-yyyy'), to_date('18-08-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (939, to_date('18-12-2029', 'dd-mm-yyyy'), to_date('05-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (717, to_date('04-04-2025', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (105, to_date('09-08-2026', 'dd-mm-yyyy'), to_date('25-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (321, to_date('08-08-2029', 'dd-mm-yyyy'), to_date('06-03-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (633, to_date('29-12-2027', 'dd-mm-yyyy'), to_date('28-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (729, to_date('22-02-2027', 'dd-mm-yyyy'), to_date('26-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (700, to_date('27-05-2028', 'dd-mm-yyyy'), to_date('06-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (154, to_date('07-07-2027', 'dd-mm-yyyy'), to_date('03-11-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (946, to_date('17-08-2028', 'dd-mm-yyyy'), to_date('07-01-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (666, to_date('30-07-2030', 'dd-mm-yyyy'), to_date('02-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (991, to_date('09-10-2027', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (247, to_date('27-07-2028', 'dd-mm-yyyy'), to_date('24-04-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (827, to_date('27-10-2029', 'dd-mm-yyyy'), to_date('03-06-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (225, to_date('14-02-2024', 'dd-mm-yyyy'), to_date('15-07-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (534, to_date('16-07-2029', 'dd-mm-yyyy'), to_date('17-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (260, to_date('10-12-2024', 'dd-mm-yyyy'), to_date('06-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (903, to_date('10-07-2025', 'dd-mm-yyyy'), to_date('20-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (938, to_date('07-11-2030', 'dd-mm-yyyy'), to_date('16-10-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (662, to_date('14-10-2025', 'dd-mm-yyyy'), to_date('14-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (627, to_date('25-06-2024', 'dd-mm-yyyy'), to_date('04-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (796, to_date('15-03-2025', 'dd-mm-yyyy'), to_date('28-06-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (544, to_date('07-12-2029', 'dd-mm-yyyy'), to_date('04-12-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (797, to_date('26-07-2030', 'dd-mm-yyyy'), to_date('21-02-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (765, to_date('05-04-2026', 'dd-mm-yyyy'), to_date('08-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (664, to_date('03-03-2026', 'dd-mm-yyyy'), to_date('10-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (790, to_date('21-01-2028', 'dd-mm-yyyy'), to_date('06-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (865, to_date('23-06-2030', 'dd-mm-yyyy'), to_date('22-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (730, to_date('21-06-2029', 'dd-mm-yyyy'), to_date('23-11-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (235, to_date('16-01-2026', 'dd-mm-yyyy'), to_date('15-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (324, to_date('03-11-2028', 'dd-mm-yyyy'), to_date('22-04-2029', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (606, to_date('22-07-2027', 'dd-mm-yyyy'), to_date('12-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (673, to_date('18-02-2028', 'dd-mm-yyyy'), to_date('31-10-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (182, to_date('01-09-2024', 'dd-mm-yyyy'), to_date('18-03-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (739, to_date('01-03-2024', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (304, to_date('24-07-2026', 'dd-mm-yyyy'), to_date('18-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (998, to_date('03-03-2027', 'dd-mm-yyyy'), to_date('09-10-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (655, to_date('12-10-2027', 'dd-mm-yyyy'), to_date('29-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (492, to_date('06-01-2030', 'dd-mm-yyyy'), to_date('22-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (828, to_date('05-05-2026', 'dd-mm-yyyy'), to_date('15-11-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (872, to_date('03-05-2029', 'dd-mm-yyyy'), to_date('29-11-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (824, to_date('25-02-2025', 'dd-mm-yyyy'), to_date('11-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (146, to_date('20-01-2025', 'dd-mm-yyyy'), to_date('10-11-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (919, to_date('28-01-2027', 'dd-mm-yyyy'), to_date('27-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (602, to_date('22-12-2030', 'dd-mm-yyyy'), to_date('16-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (571, to_date('09-09-2025', 'dd-mm-yyyy'), to_date('19-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (771, to_date('13-11-2024', 'dd-mm-yyyy'), to_date('24-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (340, to_date('01-11-2025', 'dd-mm-yyyy'), to_date('02-08-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (181, to_date('28-03-2030', 'dd-mm-yyyy'), to_date('30-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (854, to_date('25-08-2024', 'dd-mm-yyyy'), to_date('22-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (542, to_date('30-10-2028', 'dd-mm-yyyy'), to_date('28-07-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (663, to_date('25-11-2030', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (913, to_date('08-06-2024', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (905, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('30-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (387, to_date('01-01-2029', 'dd-mm-yyyy'), to_date('12-02-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (158, to_date('25-06-2029', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (986, to_date('29-03-2028', 'dd-mm-yyyy'), to_date('28-02-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (265, to_date('26-06-2024', 'dd-mm-yyyy'), to_date('11-07-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (546, to_date('06-10-2029', 'dd-mm-yyyy'), to_date('28-12-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (707, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('10-03-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (906, to_date('05-05-2025', 'dd-mm-yyyy'), to_date('02-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (768, to_date('25-06-2029', 'dd-mm-yyyy'), to_date('30-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (540, to_date('18-07-2030', 'dd-mm-yyyy'), to_date('23-05-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (609, to_date('12-12-2026', 'dd-mm-yyyy'), to_date('22-12-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (209, to_date('21-03-2024', 'dd-mm-yyyy'), to_date('15-10-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (715, to_date('12-11-2026', 'dd-mm-yyyy'), to_date('13-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (485, to_date('28-03-2026', 'dd-mm-yyyy'), to_date('06-09-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (371, to_date('24-06-2024', 'dd-mm-yyyy'), to_date('15-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (639, to_date('01-08-2027', 'dd-mm-yyyy'), to_date('22-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (253, to_date('30-07-2026', 'dd-mm-yyyy'), to_date('06-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (530, to_date('21-03-2025', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (584, to_date('02-07-2026', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (417, to_date('24-12-2027', 'dd-mm-yyyy'), to_date('29-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (864, to_date('08-04-2028', 'dd-mm-yyyy'), to_date('23-03-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (697, to_date('14-06-2025', 'dd-mm-yyyy'), to_date('09-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (528, to_date('05-04-2026', 'dd-mm-yyyy'), to_date('02-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (470, to_date('26-06-2030', 'dd-mm-yyyy'), to_date('10-12-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (626, to_date('27-04-2030', 'dd-mm-yyyy'), to_date('14-01-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (884, to_date('08-08-2026', 'dd-mm-yyyy'), to_date('01-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (634, to_date('17-10-2025', 'dd-mm-yyyy'), to_date('14-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (834, to_date('24-05-2025', 'dd-mm-yyyy'), to_date('04-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (308, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('26-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (379, to_date('06-01-2030', 'dd-mm-yyyy'), to_date('08-10-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (636, to_date('25-06-2028', 'dd-mm-yyyy'), to_date('11-05-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (999, to_date('15-06-2024', 'dd-mm-yyyy'), to_date('21-04-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (894, to_date('10-02-2024', 'dd-mm-yyyy'), to_date('22-04-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (882, to_date('21-05-2028', 'dd-mm-yyyy'), to_date('03-11-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (343, to_date('27-07-2026', 'dd-mm-yyyy'), to_date('28-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (274, to_date('19-10-2027', 'dd-mm-yyyy'), to_date('15-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (284, to_date('19-01-2026', 'dd-mm-yyyy'), to_date('14-07-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (755, to_date('13-10-2027', 'dd-mm-yyyy'), to_date('24-07-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (977, to_date('07-09-2027', 'dd-mm-yyyy'), to_date('08-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (736, to_date('04-03-2027', 'dd-mm-yyyy'), to_date('27-02-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (907, to_date('17-09-2029', 'dd-mm-yyyy'), to_date('10-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (500, to_date('17-03-2024', 'dd-mm-yyyy'), to_date('04-01-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (572, to_date('10-12-2026', 'dd-mm-yyyy'), to_date('18-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (335, to_date('04-10-2026', 'dd-mm-yyyy'), to_date('28-07-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (841, to_date('11-10-2027', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (674, to_date('07-07-2030', 'dd-mm-yyyy'), to_date('06-04-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (413, to_date('09-09-2026', 'dd-mm-yyyy'), to_date('25-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (954, to_date('14-03-2026', 'dd-mm-yyyy'), to_date('21-08-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (168, to_date('09-09-2028', 'dd-mm-yyyy'), to_date('01-08-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (651, to_date('26-08-2030', 'dd-mm-yyyy'), to_date('03-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (426, to_date('08-12-2029', 'dd-mm-yyyy'), to_date('02-08-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (160, to_date('12-02-2024', 'dd-mm-yyyy'), to_date('02-11-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (131, to_date('08-04-2026', 'dd-mm-yyyy'), to_date('06-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (268, to_date('12-06-2025', 'dd-mm-yyyy'), to_date('15-05-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (803, to_date('17-11-2024', 'dd-mm-yyyy'), to_date('11-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (970, to_date('18-05-2027', 'dd-mm-yyyy'), to_date('02-06-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (469, to_date('22-10-2025', 'dd-mm-yyyy'), to_date('19-09-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (305, to_date('18-12-2027', 'dd-mm-yyyy'), to_date('25-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (180, to_date('03-04-2025', 'dd-mm-yyyy'), to_date('02-02-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (753, to_date('08-08-2030', 'dd-mm-yyyy'), to_date('20-03-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (126, to_date('11-04-2025', 'dd-mm-yyyy'), to_date('03-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (448, to_date('03-09-2029', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (128, to_date('07-09-2029', 'dd-mm-yyyy'), to_date('06-10-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (104, to_date('26-06-2029', 'dd-mm-yyyy'), to_date('01-01-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (721, to_date('25-03-2025', 'dd-mm-yyyy'), to_date('05-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (423, to_date('14-04-2027', 'dd-mm-yyyy'), to_date('15-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (270, to_date('29-01-2025', 'dd-mm-yyyy'), to_date('16-05-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (613, to_date('04-05-2029', 'dd-mm-yyyy'), to_date('21-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (228, to_date('03-03-2024', 'dd-mm-yyyy'), to_date('01-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (349, to_date('30-04-2025', 'dd-mm-yyyy'), to_date('22-03-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (365, to_date('22-07-2030', 'dd-mm-yyyy'), to_date('17-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (277, to_date('28-11-2027', 'dd-mm-yyyy'), to_date('31-10-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (457, to_date('25-12-2030', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (862, to_date('16-04-2028', 'dd-mm-yyyy'), to_date('10-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (125, to_date('22-05-2026', 'dd-mm-yyyy'), to_date('03-09-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (517, to_date('04-01-2029', 'dd-mm-yyyy'), to_date('07-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (244, to_date('15-02-2025', 'dd-mm-yyyy'), to_date('14-10-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (518, to_date('05-04-2026', 'dd-mm-yyyy'), to_date('21-10-2029', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (238, to_date('23-06-2028', 'dd-mm-yyyy'), to_date('11-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (746, to_date('21-02-2028', 'dd-mm-yyyy'), to_date('26-06-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (563, to_date('15-11-2029', 'dd-mm-yyyy'), to_date('26-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (445, to_date('24-04-2026', 'dd-mm-yyyy'), to_date('21-05-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (769, to_date('23-07-2026', 'dd-mm-yyyy'), to_date('01-11-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (831, to_date('29-12-2024', 'dd-mm-yyyy'), to_date('23-05-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (951, to_date('08-01-2029', 'dd-mm-yyyy'), to_date('16-04-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (537, to_date('17-09-2024', 'dd-mm-yyyy'), to_date('10-08-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (785, to_date('27-02-2024', 'dd-mm-yyyy'), to_date('16-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (121, to_date('31-08-2027', 'dd-mm-yyyy'), to_date('19-02-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (552, to_date('14-02-2030', 'dd-mm-yyyy'), to_date('03-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (798, to_date('14-05-2030', 'dd-mm-yyyy'), to_date('13-08-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (953, to_date('16-11-2028', 'dd-mm-yyyy'), to_date('22-08-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (414, to_date('03-12-2029', 'dd-mm-yyyy'), to_date('22-12-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (120, to_date('12-04-2029', 'dd-mm-yyyy'), to_date('08-12-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (133, to_date('05-08-2027', 'dd-mm-yyyy'), to_date('03-11-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (334, to_date('24-02-2025', 'dd-mm-yyyy'), to_date('25-04-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (415, to_date('22-06-2025', 'dd-mm-yyyy'), to_date('19-01-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (754, to_date('08-11-2024', 'dd-mm-yyyy'), to_date('10-08-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (227, to_date('15-06-2028', 'dd-mm-yyyy'), to_date('23-09-2027', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (763, to_date('24-04-2024', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (320, to_date('23-08-2028', 'dd-mm-yyyy'), to_date('03-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (623, to_date('28-10-2028', 'dd-mm-yyyy'), to_date('22-12-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (287, to_date('31-07-2025', 'dd-mm-yyyy'), to_date('31-07-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (812, to_date('02-06-2029', 'dd-mm-yyyy'), to_date('27-11-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (106, to_date('17-06-2024', 'dd-mm-yyyy'), to_date('31-03-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (588, to_date('09-06-2029', 'dd-mm-yyyy'), to_date('26-02-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (693, to_date('16-08-2027', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (973, to_date('07-06-2029', 'dd-mm-yyyy'), to_date('12-11-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (314, to_date('11-06-2025', 'dd-mm-yyyy'), to_date('04-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (792, to_date('28-10-2027', 'dd-mm-yyyy'), to_date('17-04-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (779, to_date('01-06-2029', 'dd-mm-yyyy'), to_date('16-08-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (622, to_date('20-02-2026', 'dd-mm-yyyy'), to_date('13-06-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (732, to_date('04-10-2027', 'dd-mm-yyyy'), to_date('09-09-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (401, to_date('28-01-2029', 'dd-mm-yyyy'), to_date('11-12-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (140, to_date('03-02-2026', 'dd-mm-yyyy'), to_date('27-12-2025', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (241, to_date('14-10-2026', 'dd-mm-yyyy'), to_date('26-09-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (558, to_date('30-09-2027', 'dd-mm-yyyy'), to_date('29-07-2029', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (712, to_date('12-03-2030', 'dd-mm-yyyy'), to_date('16-12-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (166, to_date('24-09-2024', 'dd-mm-yyyy'), to_date('05-12-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (752, to_date('07-07-2025', 'dd-mm-yyyy'), to_date('14-01-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (641, to_date('28-02-2028', 'dd-mm-yyyy'), to_date('25-02-2030', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (822, to_date('31-07-2024', 'dd-mm-yyyy'), to_date('28-01-2026', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (509, to_date('12-04-2027', 'dd-mm-yyyy'), to_date('16-06-2028', 'dd-mm-yyyy'));
insert into PURCHASE (purchase_id, purchase_date, dellivery_date)
values (281, to_date('18-10-2025', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'));
commit;
prompt 445 records loaded
prompt Loading PURCHASE_CLIENT...
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (1, 677);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (1, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (2, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (3, 814);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (5, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (9, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (9, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (9, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (13, 814);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (19, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (22, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (23, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (24, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (24, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (26, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (26, 814);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (27, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (28, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (28, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (29, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (35, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (36, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (36, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (37, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (45, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (48, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (49, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (50, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (52, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (54, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (57, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (58, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (61, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (62, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (65, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (67, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (67, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (68, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (70, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (70, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (74, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (75, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (75, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (81, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (84, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (89, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (92, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (94, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (95, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (95, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (98, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (98, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (99, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (101, 101);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (101, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (104, 104);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (105, 105);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (106, 106);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (106, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (107, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (108, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (109, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (109, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (110, 110);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (110, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (111, 111);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (112, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (114, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (115, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (116, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (117, 117);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (117, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (118, 118);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (119, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (120, 120);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (120, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (120, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (121, 121);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (123, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (124, 124);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (125, 125);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (126, 126);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (127, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (128, 128);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (128, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (129, 129);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (130, 130);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (131, 131);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (133, 133);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (133, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (137, 137);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (139, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (139, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (140, 140);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (141, 141);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (144, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (145, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (145, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (146, 146);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (148, 348);
commit;
prompt 100 records committed...
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (148, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (149, 149);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (151, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (154, 154);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (154, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (155, 155);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (156, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (156, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (157, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (157, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (158, 158);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (160, 160);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (161, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (161, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (162, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (162, 956);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (164, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (166, 166);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (168, 168);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (169, 169);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (171, 171);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (172, 172);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (173, 173);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (175, 175);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (176, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (177, 177);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (177, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (178, 178);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (179, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (180, 180);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (181, 181);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (182, 182);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (183, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (183, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (184, 184);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (185, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (185, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (186, 186);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (187, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (188, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (188, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (188, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (189, 189);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (190, 190);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (195, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (195, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (195, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (197, 197);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (200, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (201, 101);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (201, 201);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (201, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (202, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (203, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (203, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (204, 104);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (204, 956);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (205, 105);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (205, 205);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (206, 106);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (206, 206);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (207, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (207, 207);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (207, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (208, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (209, 209);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (209, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (210, 110);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (211, 111);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (212, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (212, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (213, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (216, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (216, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (216, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (217, 117);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (218, 118);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (218, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (218, 218);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (219, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (219, 219);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (219, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (220, 120);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (220, 220);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (220, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (221, 121);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (221, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (223, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (223, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (223, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (224, 124);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (225, 125);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (225, 225);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (226, 126);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (226, 226);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (226, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (227, 227);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (228, 128);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (228, 228);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (229, 129);
commit;
prompt 200 records committed...
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (229, 229);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (230, 130);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (231, 131);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (231, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (232, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (232, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (233, 133);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (235, 235);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (236, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (237, 137);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (238, 238);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (239, 239);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (239, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (240, 140);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (241, 141);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (241, 241);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (244, 244);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (245, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (245, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (245, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (246, 146);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (246, 246);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (247, 247);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (248, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (249, 149);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (251, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (253, 253);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (253, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (254, 154);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (254, 254);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (254, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (255, 155);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (255, 255);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (257, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (257, 257);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (258, 158);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (258, 258);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (259, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (260, 160);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (260, 260);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (261, 261);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (262, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (264, 264);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (264, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (264, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (265, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (265, 265);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (266, 166);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (266, 266);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (268, 168);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (268, 268);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (269, 169);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (269, 269);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (270, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (270, 270);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (271, 171);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (271, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (272, 172);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (272, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (273, 173);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (274, 274);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (274, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (274, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (275, 175);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (276, 852);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (277, 177);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (277, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (277, 277);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (277, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (277, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (278, 178);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (279, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (280, 180);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (280, 280);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (281, 181);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (281, 281);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (282, 182);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (283, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (283, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (284, 184);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (284, 284);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (285, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (286, 186);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (287, 287);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (288, 288);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (288, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (289, 189);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (290, 190);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (290, 290);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (291, 863);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (293, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (294, 294);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (295, 295);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (295, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (296, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (296, 296);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (297, 197);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (297, 297);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (298, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (300, 605);
commit;
prompt 300 records committed...
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (300, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (301, 201);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (302, 302);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (302, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (304, 304);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (305, 205);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (305, 305);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (306, 206);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (306, 306);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (307, 207);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (307, 307);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (308, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (308, 308);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (308, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (309, 209);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (309, 555);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (310, 310);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (310, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (310, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (314, 314);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (315, 956);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (316, 116);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (318, 218);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (319, 219);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (319, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (320, 220);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (320, 320);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (321, 321);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (323, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (323, 323);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (324, 324);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (325, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (325, 225);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (325, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (326, 226);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (327, 227);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (328, 228);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (329, 229);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (330, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (331, 677);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (332, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (332, 332);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (334, 334);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (335, 235);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (335, 335);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (336, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (337, 337);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (338, 238);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (339, 239);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (339, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (340, 340);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (341, 241);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (343, 343);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (344, 244);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (344, 344);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (344, 956);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (345, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (346, 246);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (347, 247);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (348, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (348, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (349, 349);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (350, 350);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (350, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (352, 352);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (353, 253);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (354, 254);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (355, 255);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (355, 555);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (357, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (357, 257);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (358, 258);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (358, 358);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (359, 339);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (359, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (359, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (360, 260);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (361, 261);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (362, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (363, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (364, 264);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (364, 364);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (364, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (365, 265);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (365, 365);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (366, 266);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (366, 366);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (368, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (368, 268);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (368, 368);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (368, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (369, 269);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (369, 369);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (370, 270);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (370, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (371, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (371, 371);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (371, 778);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (372, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (372, 436);
commit;
prompt 400 records committed...
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (373, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (374, 274);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (374, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (374, 474);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (376, 376);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (377, 277);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (377, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (377, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (379, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (379, 179);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (379, 379);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (380, 280);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (380, 380);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (381, 281);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (381, 381);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (382, 382);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (383, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (384, 284);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (385, 385);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (386, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (387, 287);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (387, 387);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (387, 956);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (388, 288);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (388, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (389, 319);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (390, 290);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (390, 390);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (390, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (393, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (393, 393);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (394, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (394, 294);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (395, 295);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (395, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (396, 296);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (396, 395);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (396, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (397, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (397, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (397, 297);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (397, 397);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (400, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (400, 400);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (400, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (405, 305);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (405, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (423, 123);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (423, 323);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (423, 423);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (462, 162);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (487, 387);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (489, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (492, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (492, 814);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (501, 401);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (501, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (504, 404);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (504, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (512, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (512, 412);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (513, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (513, 413);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (536, 436);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (544, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (544, 444);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (551, 388);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (551, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (555, 555);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (592, 492);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (608, 208);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (611, 611);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (611, 811);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (615, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (685, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (704, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (704, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (727, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (728, 676);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (730, 377);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (764, 464);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (791, 157);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (830, 604);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (868, 183);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (896, 145);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (896, 843);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (920, 605);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (928, 911);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (955, 555);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (975, 348);
insert into PURCHASE_CLIENT (client_id, purchase_id)
values (998, 183);
commit;
prompt 491 records loaded
prompt Loading PURCHASE_PRODUCT...
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (101, 101);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (101, 162);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (104, 104);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (105, 105);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (107, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (109, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (109, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (109, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (110, 110);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (111, 111);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (116, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (116, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (116, 339);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (117, 117);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (118, 118);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (120, 120);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (121, 121);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (123, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (123, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (124, 124);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (126, 126);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (128, 128);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (129, 129);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (130, 130);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (131, 131);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (133, 133);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (139, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (140, 140);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (141, 141);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (145, 145);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (157, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (159, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (164, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (166, 166);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (166, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (167, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (171, 171);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (172, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (172, 172);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (177, 177);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (178, 178);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (182, 145);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (182, 182);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (183, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (183, 208);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (184, 184);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (199, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (201, 201);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (203, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (205, 205);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (205, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (207, 207);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (209, 209);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (213, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (218, 218);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (220, 220);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (226, 226);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (227, 227);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (228, 228);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (229, 229);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (229, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (229, 852);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (230, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (235, 235);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (239, 239);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (240, 474);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (241, 241);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (243, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (244, 244);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (247, 247);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (253, 253);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (257, 257);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (264, 264);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (264, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (266, 266);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (271, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (274, 274);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (277, 277);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (283, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (284, 284);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (288, 288);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (291, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (295, 295);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (296, 296);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (302, 302);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (304, 304);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (305, 305);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (305, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (307, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (307, 307);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (310, 310);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (310, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (312, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (314, 314);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (317, 162);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (318, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (320, 320);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (320, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (320, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (321, 321);
commit;
prompt 100 records committed...
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (323, 323);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (324, 324);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (331, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (332, 332);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (333, 464);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (335, 335);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (339, 339);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (339, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (340, 340);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (340, 778);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (343, 343);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (343, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (344, 344);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (348, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (357, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (357, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (364, 364);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (366, 366);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (371, 371);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (377, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (377, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (382, 382);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (384, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (388, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (395, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (395, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (399, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (400, 400);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (401, 401);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (403, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (404, 404);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (407, 407);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (409, 409);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (410, 410);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (410, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (412, 412);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (413, 179);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (413, 413);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (414, 414);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (415, 415);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (417, 417);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (417, 555);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (418, 179);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (423, 423);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (426, 426);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (427, 427);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (427, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (430, 430);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (430, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (436, 436);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (439, 439);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (442, 442);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (443, 443);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (444, 444);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (444, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (445, 445);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (448, 448);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (448, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (456, 456);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (457, 457);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (463, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (464, 464);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (466, 466);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (467, 467);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (474, 474);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (478, 478);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (482, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (482, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (492, 492);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (500, 500);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (504, 504);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (505, 505);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (507, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (509, 509);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (513, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (514, 514);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (515, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (515, 515);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (516, 183);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (516, 516);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (517, 517);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (518, 518);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (523, 523);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (524, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (524, 555);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (526, 526);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (527, 527);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (528, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (528, 528);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (528, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (530, 530);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (531, 531);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (533, 533);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (535, 474);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (535, 535);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (539, 539);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (539, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (540, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (540, 540);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (541, 436);
commit;
prompt 200 records committed...
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (542, 542);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (543, 543);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (544, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (544, 544);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (547, 547);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (556, 556);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (557, 474);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (557, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (559, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (563, 563);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (564, 564);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (566, 566);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (571, 571);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (572, 572);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (577, 145);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (582, 582);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (583, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (584, 584);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (588, 588);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (588, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (591, 591);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (600, 600);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (602, 602);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (603, 603);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (604, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (604, 604);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (605, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (605, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (606, 606);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (606, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (606, 911);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (607, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (609, 609);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (610, 610);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (611, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (611, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (613, 613);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (613, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (614, 614);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (616, 339);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (618, 618);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (622, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (622, 622);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (623, 623);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (624, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (624, 624);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (625, 625);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (626, 626);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (627, 627);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (628, 852);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (628, 911);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (629, 629);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (630, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (630, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (630, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (631, 631);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (633, 633);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (633, 911);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (634, 634);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (636, 636);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (637, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (637, 464);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (637, 637);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (637, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (638, 638);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (639, 639);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (640, 640);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (641, 641);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (644, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (644, 644);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (645, 645);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (648, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (648, 648);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (651, 651);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (653, 653);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (655, 655);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (656, 388);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (658, 658);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (662, 662);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (663, 663);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (664, 664);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (665, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (666, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (666, 666);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (667, 667);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (670, 670);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (671, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (672, 672);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (673, 673);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (674, 674);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (675, 179);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (676, 676);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (677, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (682, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (684, 436);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (685, 685);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (691, 691);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (694, 778);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (694, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (699, 699);
commit;
prompt 300 records committed...
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (700, 700);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (702, 702);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (704, 911);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (705, 676);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (705, 705);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (709, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (711, 711);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (712, 712);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (715, 715);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (717, 717);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (720, 720);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (721, 721);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (723, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (724, 724);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (725, 725);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (727, 727);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (728, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (728, 728);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (729, 729);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (730, 730);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (732, 732);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (734, 734);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (736, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (736, 736);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (739, 739);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (739, 852);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (740, 740);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (741, 741);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (742, 742);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (743, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (744, 162);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (746, 746);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (748, 748);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (749, 749);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (752, 752);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (753, 753);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (754, 754);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (755, 755);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (757, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (758, 758);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (759, 605);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (762, 762);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (763, 763);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (765, 765);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (767, 767);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (768, 768);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (768, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (769, 769);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (770, 770);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (771, 771);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (775, 555);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (776, 776);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (776, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (777, 777);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (778, 778);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (779, 779);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (780, 780);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (782, 782);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (785, 785);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (788, 788);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (789, 789);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (790, 790);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (791, 162);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (792, 208);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (792, 792);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (793, 793);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (795, 795);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (796, 796);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (797, 676);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (797, 797);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (799, 799);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (801, 801);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (803, 803);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (803, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (805, 805);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (808, 808);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (809, 809);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (810, 810);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (811, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (812, 812);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (813, 813);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (814, 814);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (815, 815);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (816, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (818, 818);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (819, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (821, 821);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (822, 822);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (823, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (824, 824);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (825, 825);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (827, 162);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (827, 827);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (828, 611);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (828, 828);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (830, 157);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (831, 831);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (832, 832);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (833, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (833, 833);
commit;
prompt 400 records committed...
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (834, 834);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (837, 837);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (837, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (839, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (839, 839);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (841, 841);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (843, 843);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (844, 844);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (847, 179);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (847, 847);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (849, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (849, 849);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (851, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (851, 851);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (852, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (852, 852);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (853, 339);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (853, 555);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (854, 854);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (857, 857);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (862, 862);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (863, 208);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (863, 377);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (863, 863);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (863, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (864, 864);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (864, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (865, 865);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (867, 867);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (868, 778);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (868, 868);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (870, 395);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (870, 555);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (871, 319);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (872, 872);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (874, 874);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (877, 811);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (877, 877);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (877, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (878, 878);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (880, 123);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (880, 145);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (881, 881);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (882, 882);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (883, 956);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (884, 884);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (885, 885);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (886, 677);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (891, 891);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (892, 116);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (892, 892);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (893, 179);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (893, 893);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (894, 894);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (895, 348);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (896, 896);
insert into PURCHASE_PRODUCT (product_id, purchase_id)
values (899, 899);
commit;
prompt 457 records loaded
prompt Loading WORKER...
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wNIphurCXr', 158, to_date('22-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('puxetLwKiI', 657, to_date('16-11-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CQdRtxWwse', 794, to_date('22-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fBQlCbHYDF', 640, to_date('10-08-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VVZPsTNsdu', 131, to_date('09-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WenaOnSMuX', 381, to_date('03-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qHyXvQubmi', 651, to_date('28-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uRcpOpRhcl', 269, to_date('25-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tSfOPJzCuC', 172, to_date('03-02-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LbSDWHroML', 289, to_date('23-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XSMzHonvPn', 541, to_date('21-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yBETYoLSLE', 844, to_date('12-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jYbNUuafyx', 705, to_date('11-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DfaqtdNerj', 807, to_date('06-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QmWenKDtiy', 105, to_date('29-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LXlZoEKAZT', 855, to_date('22-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LEolmByKar', 744, to_date('24-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jUzleQCzVd', 280, to_date('31-08-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ziVrVEBGSU', 361, to_date('14-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vBguqBtnTO', 113, to_date('28-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LMHneGcjSs', 938, to_date('14-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qBDWviOnPd', 209, to_date('19-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oTFsXBdyST', 591, to_date('19-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sGjuiFIfkw', 666, to_date('07-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OcpeYvkFoC', 355, to_date('24-07-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LeJxgaFhLR', 790, to_date('13-08-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TLwiJwTUge', 835, to_date('16-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ncrsBoTani', 616, to_date('16-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YuIQQgwssZ', 739, to_date('13-11-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RwMOElWpzo', 643, to_date('04-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RzzphUKGOv', 944, to_date('16-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jnguVFOEtx', 518, to_date('13-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('igFPQwpXZJ', 188, to_date('03-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RhjwTDmwKE', 136, to_date('12-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FQsmAmfyvD', 618, to_date('17-11-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SGoTzXTpMY', 494, to_date('22-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HcrrvVRAsK', 695, to_date('27-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GPhhxdywyH', 564, to_date('01-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QWoRASgRaq', 357, to_date('06-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rrUKELHOmX', 992, to_date('13-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vscBzCJjhH', 514, to_date('20-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NuLDfrVvGt', 419, to_date('05-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('URACssXXip', 367, to_date('07-04-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NFrUypuGIQ', 966, to_date('30-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BfgZhqoTRV', 509, to_date('28-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('lAmYEUUiqt', 978, to_date('08-04-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FHpIWhjFjl', 737, to_date('02-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vVZtBQpAGw', 799, to_date('23-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XgxfyHfeoH', 279, to_date('01-07-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fltgPPdjum', 839, to_date('14-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('MEvYixIQWe', 722, to_date('08-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jYHaNSkYiy', 630, to_date('27-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rAmOYjywKP', 786, to_date('01-01-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PSXwABoVxN', 180, to_date('09-11-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SZjwqdciFI', 902, to_date('16-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('lGFyPlPsRG', 761, to_date('07-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ulBgmakWLA', 454, to_date('18-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IaVNNewCHE', 928, to_date('16-08-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vTqyOfmxlH', 278, to_date('21-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cPMgPVHPpj', 323, to_date('15-08-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VImXfpyIkT', 340, to_date('08-12-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('codRbqqYuN', 879, to_date('08-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qruxnykGWc', 575, to_date('14-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uppQBAyjVu', 512, to_date('25-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YmDIgNmBcw', 585, to_date('05-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HxnwyDaczK', 332, to_date('13-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GQAqQnAlBG', 256, to_date('13-11-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('iBokoIqrtK', 932, to_date('26-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PLSGuDgUCd', 955, to_date('03-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SCvaQeERbD', 815, to_date('25-09-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dWWIqoKpjE', 670, to_date('22-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SweqTMAFzv', 137, to_date('29-10-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HOHhFUxEHB', 574, to_date('17-06-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TVHLheyXqX', 847, to_date('12-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LVmTNcucSQ', 108, to_date('15-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eLwpVykqww', 548, to_date('20-02-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NVYGusCsjP', 974, to_date('21-05-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GZKOMaScCY', 578, to_date('06-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PBBEGmSCOB', 614, to_date('02-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RBRnzciWaF', 254, to_date('19-06-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WAWgDvppVd', 781, to_date('13-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rWiNlKuDwj', 193, to_date('07-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hphoKSGmAk', 873, to_date('25-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ARHuiDAUhy', 594, to_date('13-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uoawxjqsNz', 552, to_date('04-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SYyJeMSWUo', 365, to_date('21-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KgZbtaNcPG', 120, to_date('27-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sygoVxtZIo', 304, to_date('03-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wemmTSPkiR', 843, to_date('04-10-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KYmRsfrGld', 664, to_date('16-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DTHJVLijsL', 487, to_date('28-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wHBIlfAkDm', 680, to_date('28-11-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZgexKJaCbi', 756, to_date('16-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('aALtGIqGdO', 816, to_date('28-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hEyeQGJNkO', 960, to_date('13-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZAgpomQoGE', 908, to_date('26-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DOMuCnwvjX', 593, to_date('08-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EEDecCKTMk', 252, to_date('07-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YVgHyAoHmP', 154, to_date('02-09-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NYgHjHUFRi', 961, to_date('30-01-2030', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ctfPLOkJGb', 445, to_date('28-10-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('caQXruPFmJ', 106, to_date('01-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dqJNkZSipS', 751, to_date('21-09-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QRkiQSjZFM', 171, to_date('15-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('isNugTcYpW', 673, to_date('29-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bSxSbsSiWX', 842, to_date('24-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yjOykJCZUx', 472, to_date('31-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CVtVQwmyri', 692, to_date('20-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ugKlvqJQql', 196, to_date('02-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HJfNUjHqLo', 793, to_date('11-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cwAFbfbtxy', 303, to_date('15-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PUvCSORgHq', 546, to_date('17-01-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xxfJedYTul', 635, to_date('28-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PYBgSyhLaO', 129, to_date('05-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RrmFpWuYLG', 721, to_date('30-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cWJRTXfeqn', 868, to_date('19-04-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RAwNggvDZm', 920, to_date('05-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PFSGENbAKV', 592, to_date('31-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nvHYJlEaMB', 516, to_date('15-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tsvNSDLayw', 661, to_date('03-05-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UnWlRDNrqm', 586, to_date('24-08-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nGBoNPasme', 124, to_date('12-08-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fxUlOQOJbv', 503, to_date('06-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hTFNNKRAVg', 590, to_date('15-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qsrpJdGOqW', 613, to_date('15-08-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('URxfxTHvOe', 422, to_date('04-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JtnrWLzWRb', 272, to_date('06-06-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NQBmodNtGp', 572, to_date('03-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('AHiFqthFDk', 257, to_date('12-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WSIMDgjnMW', 678, to_date('27-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oHWpEQZeSd', 802, to_date('23-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BCcCAXPqLU', 599, to_date('14-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RyyMLFfxLN', 943, to_date('15-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZXaPBIzSmb', 526, to_date('11-09-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('USzxGxVRxi', 890, to_date('28-02-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KPBxhCOdYr', 832, to_date('16-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OcbcoQkncN', 525, to_date('01-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bWhuRaSsZe', 762, to_date('23-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JOnOeRTZDB', 649, to_date('10-12-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LeSqRmgoLA', 531, to_date('07-03-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qPiBpsAZoO', 935, to_date('14-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gVPRaKQNMi', 773, to_date('27-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WobuFoMydg', 429, to_date('14-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RkgCazIijF', 353, to_date('23-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DihovFHzhK', 898, to_date('18-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bnAjqcMeqs', 259, to_date('15-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jQPrMyyAGB', 610, to_date('20-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EwNncaqHVP', 294, to_date('07-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('pJQjwCZhmT', 505, to_date('28-03-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ncfCeylxQK', 121, to_date('20-06-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FxStAbbPhm', 109, to_date('12-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nPECpcDjLI', 223, to_date('27-02-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dnYVGnZOdw', 862, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('umYgbqAlzH', 861, to_date('17-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KpfvCiryEX', 749, to_date('28-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hlWuHZONJp', 202, to_date('27-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cthCWnSBrJ', 694, to_date('12-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('MziCLbIJtF', 561, to_date('17-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FbslAStfJv', 579, to_date('18-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZclTPvnJxf', 207, to_date('04-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PCRswRUGEF', 406, to_date('13-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EqAGrWFpHc', 557, to_date('01-11-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OKsowRYIIT', 836, to_date('23-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IMPMuBpyai', 688, to_date('22-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SoEJLkEctp', 359, to_date('22-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WWWzyDFvva', 442, to_date('01-10-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('iLWtmiLRUX', 963, to_date('10-05-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QtVXXryoPW', 394, to_date('24-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FzyDrDpeMW', 859, to_date('29-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bXVjOMlBkR', 457, to_date('23-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('MAWdvgvgBz', 611, to_date('23-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('weRUOGvujg', 900, to_date('06-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZFHeKyOISP', 177, to_date('19-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dJPEdpbpeB', 268, to_date('12-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nwHroRmusN', 140, to_date('09-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xSxBrgiPfY', 909, to_date('21-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WvKUmobkTj', 335, to_date('04-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CMhplglpHc', 218, to_date('19-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FyOgzRsUWd', 468, to_date('08-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('kNHnaiCLst', 959, to_date('06-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qHizOqkflh', 691, to_date('17-12-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('roNjRkxoyN', 476, to_date('01-04-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FbGIuJIwbk', 948, to_date('14-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vvwkzKokjj', 199, to_date('13-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TdihvSTYSW', 791, to_date('07-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZIiNddfhQg', 502, to_date('13-11-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CJqDTlWovH', 247, to_date('07-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EGJWOpjHHZ', 245, to_date('22-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RCCAnXZmgL', 852, to_date('01-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dyadIbfMPa', 939, to_date('01-01-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZiXMYPnPBJ', 837, to_date('05-01-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('elXTvkQKvQ', 250, to_date('06-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RKaBrqwKlJ', 341, to_date('02-03-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BYaqfKmnjp', 184, to_date('18-01-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dPPXTiAURg', 498, to_date('26-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sRrExnGarx', 778, to_date('15-11-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DgFVFrkicR', 127, to_date('17-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('AFvDKLFWRP', 329, to_date('16-08-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FZAFkjqExk', 746, to_date('25-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LFAdVGUwfm', 130, to_date('05-11-2025', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dJfUqLHOxN', 418, to_date('17-01-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('kJDRlpxqXa', 432, to_date('02-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UffJuTFzez', 621, to_date('22-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jCBInGDWhs', 173, to_date('08-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VIzasGLQKc', 542, to_date('26-10-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fvNbmbXBbh', 339, to_date('13-07-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CiuVTxeGaw', 264, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BHFaehRPYo', 153, to_date('23-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uICuuuhNQc', 865, to_date('05-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hQTchgrSsd', 880, to_date('20-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WycPPvKzgS', 428, to_date('05-08-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vSSPQMDlon', 237, to_date('17-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OnprdqiHdZ', 648, to_date('11-08-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xcqvtTbRYB', 267, to_date('26-04-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wYRoebsBmO', 527, to_date('25-03-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RaEIooRNTv', 797, to_date('13-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sQyHNOkOAx', 783, to_date('31-12-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('pcQXSmNsIS', 973, to_date('21-05-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ipwwHWNCEZ', 382, to_date('27-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VAupsYeBSP', 984, to_date('25-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TqaEtIUBMr', 731, to_date('08-08-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bAeZcGhhac', 251, to_date('19-06-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ncQozySmbu', 285, to_date('10-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FwqREOEbHB', 820, to_date('24-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('iCZQtasDnR', 570, to_date('27-02-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TedyzyDapo', 320, to_date('25-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QUBVteCYxi', 412, to_date('07-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EnnAvFFAIu', 286, to_date('09-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('slUrpzvajE', 377, to_date('07-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rdjhpImUyL', 185, to_date('10-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wOrAvDTnOF', 334, to_date('17-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ksoatANLOr', 449, to_date('28-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RcqJyPJUSz', 671, to_date('06-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yElaUfvJYI', 450, to_date('29-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DTDWfppNQo', 213, to_date('23-04-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vjOCDGjkfA', 993, to_date('20-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gIfNdCPipr', 363, to_date('02-01-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TbYwEvKcQu', 822, to_date('13-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wVccRNTwaf', 321, to_date('16-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YzFGFltYSg', 302, to_date('04-08-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GmIxAvmOiU', 774, to_date('24-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ifugbOEigW', 826, to_date('18-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UHiSEAKQEF', 126, to_date('26-09-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CGzDUvMlUq', 860, to_date('16-02-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bqtCzCNjzF', 346, to_date('09-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gFytZkCDJT', 297, to_date('25-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wgPiCijuQk', 632, to_date('17-01-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nxFnRIxuvT', 660, to_date('29-06-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UAyALXiRuT', 972, to_date('12-06-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eTzWxWfuWG', 446, to_date('07-03-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vZdERUmWwN', 147, to_date('14-03-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FqlVWSEVgk', 698, to_date('14-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cobMEtlzQQ', 249, to_date('10-11-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KWHzBzlZvy', 848, to_date('07-08-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KpzfMjqaKu', 219, to_date('19-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GvoWmWaACM', 582, to_date('25-03-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rSVvzEDnqF', 544, to_date('16-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NiPZKkkuRm', 165, to_date('14-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rEycyHELTe', 471, to_date('02-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('syhqtGVqBs', 715, to_date('25-01-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PBAQKWTiAq', 627, to_date('05-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('lEaUEirSgH', 965, to_date('31-10-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sfSYMjLJVK', 674, to_date('25-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OHAsJTUllv', 523, to_date('23-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('zxOFIPMSVA', 169, to_date('09-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DKbnEPZrSe', 318, to_date('13-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xSFvWGhoxP', 248, to_date('18-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('knNnkqbBFP', 813, to_date('17-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('MsBVFrNdTJ', 504, to_date('21-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nKQRvnsFxC', 281, to_date('13-10-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OfzvUBtYZg', 833, to_date('26-08-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IFLwmsQXuI', 182, to_date('01-11-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XIhPdKycLs', 662, to_date('23-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('OBuUqsKOGo', 311, to_date('18-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WXnbuXKZMo', 934, to_date('28-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hiiubliGmA', 911, to_date('26-07-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xhsOaFYgyU', 945, to_date('14-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hbZflclogO', 291, to_date('25-08-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('iRssupUNvb', 139, to_date('07-11-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('cXsWgtJtdt', 804, to_date('07-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mULNrvGuRX', 324, to_date('10-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FeSxaxMVwN', 522, to_date('26-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('brtbDLtBbN', 577, to_date('20-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TpIcIJAzEB', 888, to_date('22-11-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PoajTFImRj', 834, to_date('21-01-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oJKrbwdDHU', 904, to_date('24-08-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JbBqtjGIGY', 354, to_date('09-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RZcWsJweyh', 775, to_date('12-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UrxjDcmrTY', 584, to_date('13-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('efDTzAjmqD', 782, to_date('18-08-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('pWTdaxJghq', 186, to_date('01-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QyqvtEMruL', 748, to_date('02-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qSrLPIsTre', 179, to_date('30-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KtYlVjUlui', 144, to_date('11-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QwbWNsMkjK', 481, to_date('18-08-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mkfosAnnVr', 421, to_date('03-05-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QcuVJQeHNi', 496, to_date('30-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QKtVzADvHt', 543, to_date('16-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BmnNufUmIT', 641, to_date('29-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ONfRWrSGoh', 433, to_date('25-09-2028', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('haKRraOFXu', 212, to_date('04-12-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UbTbmzCieH', 747, to_date('09-05-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TtwzHfISeu', 600, to_date('19-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QrPrNYAEen', 598, to_date('07-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QuNOzREOhE', 736, to_date('30-03-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('PhrixWJyeh', 947, to_date('25-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tksfvpnyLE', 216, to_date('23-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TStnDAEOIV', 164, to_date('24-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GlQjQPVJYk', 700, to_date('03-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('APDPeJhzDA', 501, to_date('16-11-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('zqelSjRGSB', 970, to_date('15-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UTYumfCLJA', 441, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XwKgVxvqKf', 203, to_date('25-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IXuaLKrcSo', 741, to_date('13-10-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EnGaScHpCx', 765, to_date('10-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KDZgWCjHbS', 637, to_date('30-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dFPZEAsOGh', 407, to_date('04-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hYSJtwbEUg', 296, to_date('05-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rrbGzRVXku', 515, to_date('31-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZGKDkcuPxS', 913, to_date('19-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JEYChhcMsy', 489, to_date('02-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IZkPhMsUGP', 366, to_date('13-09-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XRmUknqOIZ', 478, to_date('23-06-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ALwrUHVIko', 438, to_date('23-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('firzFaNnYd', 742, to_date('23-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TKYHnoSEsL', 103, to_date('02-05-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('opBuyJeSCI', 347, to_date('03-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eLxdBvWCxm', 520, to_date('07-04-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VWjkcMsgYq', 292, to_date('03-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TVXIODQiov', 152, to_date('24-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HWOJTxtNRv', 596, to_date('14-11-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RLsINFKHDy', 234, to_date('30-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YQMjLrpvmv', 244, to_date('26-01-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wuuhzWzSoU', 352, to_date('29-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QgBpQgDmmT', 239, to_date('10-10-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SRqLgxwxxn', 682, to_date('07-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tQUtAyoMZB', 710, to_date('08-03-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xmamJDAMoI', 227, to_date('02-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IDAYkulHNy', 625, to_date('25-07-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xNvKGoxMRK', 118, to_date('26-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZDDYHIvpWf', 128, to_date('22-12-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('zbyXiuLARy', 393, to_date('10-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LhgoLbOfIV', 940, to_date('14-06-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rNkEEZdQVM', 283, to_date('01-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ehHASMXNdb', 288, to_date('21-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HriDdijaSb', 497, to_date('28-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WvnDFqAZrt', 539, to_date('15-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qbmUPyTRzs', 982, to_date('14-01-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CsnfFUArFg', 821, to_date('20-08-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('pdLLmFMKSH', 917, to_date('13-07-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bTyFNbjfKP', 455, to_date('12-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bstWkVLVHi', 937, to_date('03-01-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RMgyVylKJn', 358, to_date('30-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('viIsSmbMFE', 976, to_date('14-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ALWICLbgDm', 551, to_date('04-06-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GpuzYjcLME', 952, to_date('10-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tOCKkkvfXp', 191, to_date('18-01-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YZVMskhyNK', 401, to_date('20-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yNSEUcTDkn', 146, to_date('24-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jMcqyjFKLx', 510, to_date('12-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NINvtwoKhT', 994, to_date('07-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UkdxHeyamf', 434, to_date('07-04-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DJnCrirMXI', 414, to_date('22-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SjTIcxolgQ', 979, to_date('08-04-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gVWcktNcMH', 931, to_date('09-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IVaYFhhtHM', 392, to_date('23-07-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yOmriIhjlW', 469, to_date('21-04-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uwqDTuKhbL', 876, to_date('14-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JemHIYlftw', 941, to_date('19-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('puBwUvfjAx', 545, to_date('23-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BezaMMddgw', 877, to_date('29-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JkLxZFVuwp', 134, to_date('04-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('AoKUlbEgWa', 306, to_date('15-09-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TmOuzxqMaY', 803, to_date('19-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('aNFRotGrie', 924, to_date('14-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TlgBPUBuzp', 348, to_date('02-06-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('enzknTrTLf', 123, to_date('14-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eguCZFtzRd', 205, to_date('29-11-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xaGbbpSnls', 322, to_date('19-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('BIEVgCahEU', 190, to_date('24-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CJtmfwkwER', 656, to_date('04-10-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fllQFAcUQM', 779, to_date('06-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('fZpyYpUaXa', 603, to_date('03-06-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qkqjRlUUil', 270, to_date('25-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hHuAORJJvd', 726, to_date('30-03-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hMecbzuxnX', 667, to_date('25-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZqgQWrAwcs', 369, to_date('02-12-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ijCXrTjwhE', 116, to_date('16-05-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CDMNZqlztz', 409, to_date('17-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ctCfxuxrtN', 408, to_date('11-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eWgBgBnDFw', 104, to_date('14-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RqWEhAXaIE', 684, to_date('20-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tzTnMAWJJI', 675, to_date('14-05-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('jPLBAvurfQ', 142, to_date('09-02-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ESHGmWuPaW', 513, to_date('07-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qFYpZgCyfj', 589, to_date('24-06-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('qDVbWdYvaJ', 111, to_date('31-01-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yUIQqQShIp', 642, to_date('22-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gZLwAGpmEm', 566, to_date('05-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mhLqfUyVRU', 331, to_date('29-06-2027', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EQyYHZuIAw', 679, to_date('22-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('JLpCIIqWcJ', 776, to_date('29-11-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dIOJYVKNgg', 729, to_date('23-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oNgWhmaLMr', 410, to_date('24-10-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('kopRCBozNj', 629, to_date('24-10-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sqazLFeZbP', 919, to_date('27-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WIyoNdSvPJ', 242, to_date('10-07-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hlrAVFMHgc', 317, to_date('08-09-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('eWjmfjmjId', 996, to_date('18-03-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hCrCpVypWm', 681, to_date('15-11-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EHXyHCsNpj', 470, to_date('29-04-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('VcZgVKllbi', 201, to_date('19-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YFOtICGdGa', 728, to_date('23-01-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('kaXKJAzJIH', 477, to_date('27-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('lsiszKazQI', 150, to_date('13-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XhdFnsdjZc', 789, to_date('16-02-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KnuMvDhkzs', 665, to_date('19-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KlCJysTzAv', 533, to_date('17-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xdoRUunoVY', 933, to_date('25-08-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('CNNYXCcIYr', 601, to_date('31-10-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('EzuXAUkTLp', 159, to_date('30-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HRCEhpZxLA', 936, to_date('15-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('kLHprvgStz', 883, to_date('12-07-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('bzJLxzNKON', 232, to_date('03-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TjYxavemQK', 788, to_date('14-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NSqMxTtYNY', 166, to_date('07-06-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('zFqlqZcWmf', 668, to_date('31-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wQPFuNUcCp', 588, to_date('15-05-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FyJFdbDXbe', 371, to_date('06-01-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xRHfRYISnb', 863, to_date('04-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mnRTKwXcck', 443, to_date('31-08-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZJhduUEgru', 808, to_date('26-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nBLlWLcgWD', 183, to_date('27-04-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('KXyLVaIzdT', 801, to_date('18-08-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('wkqOVlvjRH', 336, to_date('17-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('muQGsUzfNJ', 912, to_date('12-02-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('YllkzQCwjn', 204, to_date('09-03-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DXeMVzSTmY', 387, to_date('31-03-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('FeXngcUVpB', 950, to_date('15-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uasjdPjaAm', 619, to_date('10-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NMaWfoTrAS', 398, to_date('20-01-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DLOFDqWhXw', 645, to_date('06-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('NtLOnGtSGM', 149, to_date('01-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LeCNqeWAbt', 293, to_date('27-07-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DzCoTELrfI', 135, to_date('20-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('HuBwbmUFVv', 211, to_date('14-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XmzSNdjkwC', 399, to_date('07-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gUPuTITMvP', 112, to_date('22-09-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ewzGMghkuh', 274, to_date('10-12-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('iiybbjmAho', 604, to_date('12-12-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('gXQqzZwtHF', 989, to_date('18-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('arXyKkUuJU', 758, to_date('18-05-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QfrOVyFzmi', 606, to_date('07-09-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dxvrpnMMda', 733, to_date('09-07-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sAqheuDhps', 170, to_date('02-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yVEJokyoUl', 757, to_date('03-03-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('GONWfnmJYj', 750, to_date('21-10-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('sZSpmLtkfW', 719, to_date('11-11-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('UIKbTLptjk', 792, to_date('19-08-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('aCoXaEuzlK', 874, to_date('17-06-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('yWNOkniTzx', 390, to_date('01-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('DBDtzFhuti', 745, to_date('17-11-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('esXPugoyXb', 241, to_date('09-11-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('LiljHwojYI', 624, to_date('14-03-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('skSgbdrQRD', 536, to_date('21-09-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('terlVmaRtH', 727, to_date('26-12-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ePrzmiqjJF', 538, to_date('07-01-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ryDFPJNxdY', 703, to_date('22-11-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('SDAHScflCx', 896, to_date('23-12-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dEdnqCRStK', 563, to_date('07-05-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oOizagSAau', 951, to_date('23-02-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nXEUPBJQyF', 565, to_date('12-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ATgOCyXgvc', 949, to_date('05-11-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TYZlhlWMnC', 313, to_date('11-09-2027', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ZdAJvlzmJV', 402, to_date('19-01-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mLushwbwrl', 990, to_date('20-06-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TKjQGidwkB', 465, to_date('06-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('hZzGKFjAfn', 730, to_date('08-02-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('oBwpGBxKeU', 263, to_date('18-11-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('WYPvvheqbG', 519, to_date('07-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mGolgZtDvE', 732, to_date('30-12-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('IKBiXJXdiD', 308, to_date('15-08-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('nsHRXTnKck', 850, to_date('12-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('mteInjzisf', 462, to_date('24-07-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('XIKoIdOieD', 233, to_date('28-04-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('vFokUVBlmj', 277, to_date('30-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('tmkTYvstjJ', 766, to_date('23-09-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('aKtwYjsYBH', 615, to_date('31-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('xAaHEKmFfU', 867, to_date('06-04-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('pPuQvFkZAO', 983, to_date('31-05-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('dvtlmrYTsP', 325, to_date('01-12-2026', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('uuWCOQPtop', 464, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('ErnATsByMD', 373, to_date('29-04-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('QClMDojYmd', 458, to_date('08-11-2025', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('AqexZbzHHf', 568, to_date('01-03-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('rJXZCYWAqj', 208, to_date('29-01-2030', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('lmFWftbXNv', 388, to_date('22-05-2029', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('RTotRoTYNS', 975, to_date('18-08-2028', 'dd-mm-yyyy'));
insert into WORKER (worker_name, worker_id, start_of_work_date)
values ('TobsLJfEsw', 549, to_date('29-06-2024', 'dd-mm-yyyy'));
commit;
prompt 499 records loaded
prompt Loading PURCHASE_WORKER...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (104, 104);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (104, 208);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (104, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (105, 105);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (106, 106);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (108, 208);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (111, 111);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (116, 116);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (118, 118);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (120, 120);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (121, 121);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (123, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (124, 124);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (126, 126);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (128, 128);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (129, 129);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (130, 130);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (131, 131);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (135, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (136, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (137, 137);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (139, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (140, 140);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (146, 146);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (149, 149);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (154, 154);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (158, 158);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (164, 464);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (166, 166);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (166, 676);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (169, 169);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (171, 171);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (172, 172);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (173, 173);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (177, 177);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (177, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (179, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (180, 180);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (182, 182);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (183, 183);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (184, 184);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (186, 186);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (188, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (190, 190);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (201, 101);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (201, 201);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (204, 104);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (204, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (205, 105);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (205, 205);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (205, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (207, 207);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (208, 208);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (209, 209);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (211, 111);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (211, 611);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (216, 116);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (216, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (218, 118);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (218, 218);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (219, 219);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (219, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (223, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (227, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (227, 227);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (233, 133);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (237, 137);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (239, 239);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (239, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (241, 141);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (241, 241);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (244, 244);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (245, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (247, 247);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (248, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (249, 149);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (254, 154);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (254, 254);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (257, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (257, 257);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (264, 264);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (264, 464);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (268, 168);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (268, 268);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (269, 169);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (269, 269);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (270, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (270, 270);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (272, 172);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (274, 274);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (274, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (277, 177);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (277, 277);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (277, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (278, 178);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (279, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (280, 180);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (280, 280);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (281, 181);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (281, 281);
commit;
prompt 100 records committed...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (283, 183);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (286, 186);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (288, 288);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (288, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (289, 189);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (294, 294);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (296, 296);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (297, 197);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (297, 297);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (302, 302);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (304, 304);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (304, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (306, 206);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (306, 306);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (308, 208);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (308, 308);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (311, 611);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (318, 218);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (320, 220);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (320, 320);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (321, 321);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (323, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (323, 323);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (324, 324);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (325, 225);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (329, 229);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (329, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (332, 332);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (334, 334);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (335, 235);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (335, 335);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (336, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (339, 239);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (339, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (340, 340);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (341, 241);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (346, 246);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (347, 247);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (348, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (352, 352);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (353, 253);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (353, 852);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (354, 254);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (355, 255);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (355, 555);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (357, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (357, 257);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (358, 258);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (358, 358);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (361, 261);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (365, 265);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (365, 365);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (366, 266);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (366, 366);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (369, 269);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (369, 369);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (371, 371);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (377, 277);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (377, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (377, 677);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (381, 281);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (381, 381);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (382, 382);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (387, 287);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (387, 387);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (388, 288);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (388, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (390, 290);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (390, 390);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (393, 393);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (394, 294);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (401, 401);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (402, 302);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (406, 306);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (407, 307);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (407, 407);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (408, 208);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (408, 308);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (409, 409);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (410, 310);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (410, 410);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (412, 412);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (414, 314);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (414, 414);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (419, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (421, 321);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (422, 422);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (432, 332);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (434, 334);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (442, 442);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (443, 343);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (443, 443);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (445, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (445, 445);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (449, 349);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (450, 350);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (454, 454);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (455, 555);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (457, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (457, 457);
commit;
prompt 200 records committed...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (458, 358);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (462, 162);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (464, 364);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (464, 464);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (465, 365);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (468, 368);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (469, 369);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (469, 469);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (470, 470);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (471, 371);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (476, 376);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (476, 676);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (477, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (477, 677);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (478, 478);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (478, 778);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (481, 381);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (487, 387);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (494, 494);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (497, 397);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (498, 498);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (501, 401);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (502, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (504, 404);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (504, 504);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (504, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (505, 505);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (505, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (509, 409);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (509, 509);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (510, 410);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (512, 412);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (513, 413);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (514, 414);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (514, 514);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (514, 814);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (515, 415);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (515, 515);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (516, 116);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (516, 516);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (518, 518);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (519, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (519, 519);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (522, 422);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (522, 522);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (522, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (523, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (523, 423);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (523, 523);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (526, 426);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (526, 526);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (527, 427);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (527, 527);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (531, 531);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (533, 533);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (536, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (539, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (539, 439);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (539, 539);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (542, 442);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (542, 542);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (543, 443);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (543, 543);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (543, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (544, 444);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (544, 544);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (545, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (545, 445);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (546, 546);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (548, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (548, 448);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (551, 551);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (552, 552);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (552, 852);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (557, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (557, 457);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (561, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (561, 461);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (563, 563);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (563, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (563, 863);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (564, 464);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (564, 564);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (566, 466);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (566, 566);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (570, 470);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (570, 570);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (572, 572);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (574, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (577, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (577, 677);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (578, 478);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (578, 778);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (579, 116);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (579, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (579, 479);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (582, 582);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (584, 584);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (585, 485);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (588, 388);
commit;
prompt 300 records committed...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (588, 588);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (589, 589);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (590, 590);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (591, 591);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (592, 492);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (594, 494);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (598, 498);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (598, 598);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (600, 500);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (600, 600);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (603, 603);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (604, 504);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (604, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (606, 506);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (606, 606);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (610, 610);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (611, 611);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (611, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (611, 911);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (613, 613);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (614, 514);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (614, 614);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (614, 814);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (615, 515);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (616, 116);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (616, 516);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (618, 518);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (618, 618);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (619, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (619, 519);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (624, 624);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (625, 625);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (627, 527);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (627, 627);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (629, 629);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (630, 530);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (635, 535);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (637, 537);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (637, 637);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (637, 863);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (640, 540);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (640, 640);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (641, 641);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (642, 542);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (643, 543);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (643, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (645, 123);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (645, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (645, 645);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (648, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (648, 648);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (649, 649);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (651, 551);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (651, 651);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (651, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (656, 556);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (656, 956);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (657, 157);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (662, 162);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (662, 662);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (664, 464);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (664, 564);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (664, 664);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (666, 566);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (666, 666);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (667, 667);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (670, 570);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (670, 670);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (671, 571);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (673, 573);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (673, 673);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (674, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (674, 674);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (678, 778);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (679, 179);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (680, 580);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (682, 582);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (684, 584);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (688, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (688, 588);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (691, 591);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (691, 691);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (695, 395);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (698, 598);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (700, 600);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (700, 700);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (703, 603);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (705, 605);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (705, 705);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (710, 610);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (715, 145);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (715, 715);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (719, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (721, 721);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (722, 622);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (726, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (726, 626);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (727, 627);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (727, 727);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (728, 728);
commit;
prompt 400 records committed...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (729, 629);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (729, 729);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (730, 730);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (731, 631);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (732, 732);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (733, 633);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (736, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (736, 636);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (736, 736);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (737, 637);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (739, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (739, 639);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (739, 739);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (741, 641);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (741, 741);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (742, 742);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (744, 644);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (745, 645);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (746, 746);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (748, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (748, 648);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (748, 748);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (749, 649);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (749, 749);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (750, 650);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (750, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (751, 651);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (756, 956);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (758, 658);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (758, 758);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (761, 911);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (762, 662);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (762, 762);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (765, 765);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (766, 666);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (773, 673);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (774, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (774, 674);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (776, 676);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (776, 776);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (778, 778);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (779, 779);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (782, 782);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (783, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (788, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (788, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (788, 788);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (789, 789);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (790, 790);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (791, 691);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (792, 792);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (793, 693);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (793, 793);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (797, 697);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (797, 797);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (799, 699);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (799, 799);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (801, 801);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (802, 702);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (803, 803);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (804, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (807, 707);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (808, 808);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (813, 813);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (815, 715);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (815, 815);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (820, 720);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (821, 721);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (821, 821);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (822, 822);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (832, 732);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (832, 832);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (833, 833);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (834, 734);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (834, 834);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (836, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (836, 736);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (837, 837);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (839, 339);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (839, 739);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (839, 839);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (842, 742);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (843, 395);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (843, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (844, 844);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (847, 847);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (848, 348);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (848, 748);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (852, 752);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (852, 852);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (855, 555);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (855, 755);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (855, 855);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (862, 762);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (862, 862);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (863, 763);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (863, 852);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (863, 863);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (865, 765);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (865, 865);
commit;
prompt 500 records committed...
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (867, 767);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (867, 867);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (868, 768);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (868, 868);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (874, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (874, 874);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (876, 676);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (876, 776);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (876, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (877, 377);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (877, 677);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (877, 777);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (877, 877);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (879, 779);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (880, 780);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (888, 388);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (888, 788);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (890, 790);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (896, 796);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (896, 896);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (898, 798);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (902, 395);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (904, 604);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (908, 808);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (909, 809);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (911, 319);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (911, 611);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (911, 811);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (911, 911);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (912, 812);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (912, 912);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (913, 813);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (913, 913);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (917, 817);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (919, 919);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (924, 824);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (928, 828);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (931, 831);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (932, 832);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (932, 932);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (933, 833);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (933, 933);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (934, 834);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (935, 935);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (936, 436);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (937, 837);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (938, 938);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (939, 839);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (939, 939);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (941, 841);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (941, 941);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (943, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (944, 844);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (944, 944);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (947, 847);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (948, 948);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (949, 849);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (949, 949);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (950, 950);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (951, 851);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (951, 951);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (952, 852);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (955, 555);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (955, 855);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (963, 863);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (963, 963);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (965, 865);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (965, 965);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (970, 970);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (972, 872);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (973, 973);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (974, 474);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (974, 874);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (976, 676);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (976, 976);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (978, 778);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (978, 843);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (978, 878);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (982, 882);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (982, 982);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (983, 983);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (984, 884);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (990, 990);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (992, 892);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (993, 893);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (993, 993);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (994, 894);
insert into PURCHASE_WORKER (worker_id, purchase_id)
values (996, 896);
commit;
prompt 588 records loaded
prompt Loading SUPPLIER...
insert into SUPPLIER (supplier_id, supplier_name, region)
values (100, 'Judy', 'Maarssen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (101, 'Steve', 'Franklin');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (102, 'Val', 'Sorocaba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (103, 'Chloe', 'Morioka');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (104, 'Jody', 'Tlalpan');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (105, 'Raymond', 'Gummersbach');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (106, 'Ivan', 'Tokyo');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (107, 'Dom', 'Springville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (108, 'Buffy', 'Montreal');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (109, 'Liev', 'Monroe');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (110, 'Kate', 'Stanford');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (111, 'Vonda', 'Wakayama');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (112, 'Natascha', 'Chur');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (113, 'Sarah', 'Moreno Valley');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (114, 'Vivica', 'Palo Alto');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (115, 'Regina', 'Pirapora bom Je');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (116, 'Ty', 'Coslada');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (118, 'Debra', 'Whittier');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (119, 'Kirsten', 'High Wycombe');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (120, 'Domingo', 'Richmond');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (121, 'Joey', 'Monterrey');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (122, 'Casey', 'Olsztyn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (123, 'Heath', 'Monterrey');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (124, 'Lorraine', 'Goiania');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (125, 'Renee', 'Brisbane');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (126, 'Jonny', 'Lake worth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (127, 'Rory', 'Nizhnevartovsk');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (128, 'Ed', 'Angers');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (129, 'Fiona', 'Des Plaines');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (130, 'Christian', 'Storrington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (131, 'Nick', 'Kaohsiung');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (132, 'Boz', 'Adamstown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (133, 'Carrie-Anne', 'Lincoln');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (134, 'Roscoe', 'Yamagata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (135, 'Radney', 'Oberwangen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (136, 'Henry', 'Adelaide');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (138, 'Tramaine', 'West Chester');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (139, 'Nicole', 'Aberdeen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (140, 'Jim', 'Zurich');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (141, 'Davy', 'Fukuoka');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (142, 'Ali', 'Toledo');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (143, 'Adina', 'Salvador');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (144, 'Cheech', 'Copenhagen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (145, 'Fisher', 'Streamwood');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (146, 'Shawn', 'Utrecht');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (147, 'Kenny', 'Kevelaer');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (148, 'Dustin', 'Takapuna');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (149, 'Gloria', 'Leverkusen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (150, 'Nicole', 'Bozeman');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (151, 'Stewart', 'Saint Paul');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (152, 'Boz', 'Kaysville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (153, 'Debi', 'Terrasa');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (154, 'Fiona', 'Peine');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (155, 'Hal', 'Suwon-city');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (156, 'Nikka', 'Vantaa');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (157, 'Geena', 'Fort worth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (158, 'Sandra', 'Sparrows Point');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (159, 'Russell', 'Seatle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (160, 'Remy', 'Thame');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (161, 'Miles', 'Longview');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (162, 'Anna', 'Tadley');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (163, 'Lou', 'West Sussex');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (164, 'CeCe', 'Macau');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (165, 'Jonny', 'Kungens kurva');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (166, 'Remy', 'Anyang-si');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (167, 'Franco', 'Paderborn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (168, 'Janice', 'Moreno Valley');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (169, 'Rowan', 'Spresiano');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (170, 'Liev', 'Mechelen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (171, 'Peabo', 'Snoqualmie');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (172, 'Toshiro', 'Mumbai');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (173, 'Keanu', 'Tucson');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (175, 'Isabella', 'Gelsenkirchen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (176, 'Lea', 'Mount Laurel');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (177, 'Pablo', 'Stockholm');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (178, 'Bridgette', 'Ferraz  vasconc');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (179, 'Seth', 'Lenexa');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (180, 'Aimee', 'North bethesda');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (181, 'Johnnie', 'San Ramon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (182, 'Katrin', 'Coppell');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (183, 'Sonny', 'Pasadena');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (184, 'Bobby', 'Menlo Park');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (185, 'Ewan', 'Athens');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (186, 'Patty', 'Niles');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (187, 'Fred', 'Barueri');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (188, 'Laurie', 'Sorocaba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (189, 'Freda', 'Traralgon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (190, 'Susan', 'West Sussex');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (191, 'Roberta', 'Bekescsaba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (192, 'Judi', 'Kyoto');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (193, 'Joshua', 'Verwood');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (194, 'CeCe', 'Fairborn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (195, 'Balthazar', 'Kingston');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (196, 'Hazel', 'West Lafayette');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (197, 'Carla', 'Zuerich');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (198, 'Reese', 'San Ramon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (199, 'Judi', 'Charlottesville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (300, 'Bonnie', 'Malm׳³ֲ¦');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (301, 'Rebecca', 'Pompeia');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (302, 'Garth', 'Mablethorpe');
commit;
prompt 100 records committed...
insert into SUPPLIER (supplier_id, supplier_name, region)
values (303, 'Christine', 'Fairfax');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (304, 'Ethan', 'Geneve');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (305, 'Dustin', 'Columbus');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (306, 'Rascal', 'Ithaca');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (307, 'Temuera', 'Vallauris');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (308, 'Illeana', 'Glendale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (309, 'Frances', 'Venice');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (310, 'Dick', 'Silver Spring');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (311, 'Stockard', 'Wavre');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (312, 'Allan', 'Altamonte Sprin');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (313, 'Robbie', 'Billund');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (314, 'Hugh', 'Ft. Leavenworth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (315, 'Diane', 'Milsons Point');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (316, 'Juice', 'Dorval');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (317, 'Ike', 'Horb');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (318, 'Julia', 'Tokushima');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (319, 'Willie', 'Fuchstal-asch');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (320, 'Bryan', 'Berlin-Adlersho');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (321, 'Frederic', 'Monroe');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (322, 'Ving', 'Maebashi');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (323, 'Miko', 'Coldmeece');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (324, 'Connie', 'Rua eteno');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (325, 'Sal', 'Rosario');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (326, 'Benjamin', 'Natal');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (327, 'Bryan', 'Koeln');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (328, 'Johnnie', 'Irkutsk');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (329, 'Mae', 'Duisburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (330, 'Sylvester', 'Roanoke');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (331, 'Thora', 'Brentwood');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (332, 'Glenn', 'Maryville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (333, 'Laura', 'Zwolle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (334, 'Paula', 'Schlieren');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (335, 'Juan', 'Overland park');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (336, 'Cary', 'Matsuyama');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (337, 'Donald', 'Runcorn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (338, 'Rebecca', 'Wuerzburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (339, 'Heath', 'Dearborn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (340, 'Temuera', 'Leinfelden-Echt');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (341, 'Lara', 'Appenzell');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (342, 'Solomon', 'Chicago');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (343, 'Mykelti', 'Warrington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (344, 'Franz', 'Solikamsk');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (345, 'Mary-Louise', 'Sao caetano do ');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (346, 'Miriam', 'Pandrup');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (347, 'Derrick', 'Tualatin');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (348, 'Rutger', 'Hermitage');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (349, 'Domingo', 'Kreuzau');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (350, 'Amanda', 'Takapuna');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (351, 'Edward', 'Ricardson');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (352, 'Laurence', 'Hackensack');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (353, 'Davis', 'Guadalajara');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (354, 'Gordie', 'Villata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (355, 'Hugh', 'El Masnou');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (356, 'Pelvic', 'Waalwijk');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (357, 'Arnold', 'T׳³ג€by');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (358, 'Robby', 'Sorocaba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (359, 'Chalee', 'Bedfordshire');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (360, 'Patty', 'Lexington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (361, 'Mint', 'Huntsville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (362, 'Madeline', 'Derwood');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (363, 'Lonnie', 'Billerica');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (364, 'Kieran', 'Terrasa');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (365, 'Patricia', 'Guadalajara');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (366, 'Keanu', 'Los Angeles');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (367, 'Bernard', 'Franklin');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (368, 'Allan', 'Edmonton');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (369, 'Zooey', 'Barcelona');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (370, 'Jeroen', 'Yomgok-dong');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (371, 'Todd', 'Matsue');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (372, 'Holly', 'Sorocaba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (373, 'Vivica', 'Lathrop');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (374, 'Rueben', 'Zurich');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (375, 'Azucar', 'Milwaukee');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (376, 'Freddie', 'Laguna Bbeach');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (377, 'Belinda', 'Hamburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (378, 'Franz', 'Ettlingen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (379, 'Stevie', 'Taoyuan');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (380, 'Lara', 'Breda');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (381, 'Gavin', 'Monmouth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (382, 'Gailard', 'Trieste');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (383, 'Lili', 'Buenos Aires');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (384, 'Suzanne', 'Birkenhead');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (385, 'Lila', 'Naestved');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (386, 'Madeleine', 'Essen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (387, 'Sean', 'Valladolid');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (389, 'Herbie', 'Zwolle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (390, 'Fionnula', 'Kreuzau');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (391, 'Madeleine', 'Bellevue');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (392, 'Don', 'New orleans');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (393, 'Goran', 'Shoreline');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (394, 'Angela', 'Sainte-foy');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (396, 'Donna', 'Parsippany');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (397, 'Jonny', 'San Francisco');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (398, 'Charles', 'Mito');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (399, 'Charlie', 'Ohita');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (400, 'Josh', 'Lake worth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (401, 'Christine', 'Farmington Hill');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (402, 'Glen', 'San Jose');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (403, 'Rich', 'W׳³ֲ¦rth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (404, 'Jessica', 'Huntington');
commit;
prompt 200 records committed...
insert into SUPPLIER (supplier_id, supplier_name, region)
values (405, 'Alice', 'Hayward');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (406, 'Nick', 'Columbia');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (407, 'Saul', 'Kuraby');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (408, 'Wang', 'T׳³ג€by');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (409, 'Denzel', 'Dalmine');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (410, 'Dave', 'Debary');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (411, 'Carlos', 'Dortmund');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (412, 'Bette', 'Mablethorpe');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (413, 'Thomas', 'Mountain View');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (414, 'Thin', 'Karachi');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (415, 'Oliver', 'Tottori');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (416, 'Sissy', 'Edwardstown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (417, 'Rickie', 'Curitiba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (418, 'Freddie', 'Nuernberg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (419, 'Ving', 'Coppell');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (420, 'Yolanda', 'Edison');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (421, 'Matthew', 'Huntington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (422, 'Chris', 'Santa Cruz');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (423, 'Geggy', 'Parsippany');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (424, 'Suzanne', 'Franklin');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (425, 'Nikki', 'Alpharetta');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (426, 'Beth', 'South Jordan');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (427, 'Jean-Claude', 'Berlin-Adlersho');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (428, 'Ed', 'Horsham');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (429, 'Holland', 'Pacific Grove');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (430, 'Vin', 'Barnegat');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (431, 'Tom', 'Seoul');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (432, 'Robin', 'Hochwald');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (433, 'Joey', 'Neuquen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (434, 'Wayne', 'Adamstown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (435, 'Jon', 'Mantova');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (436, 'Ned', 'Szazhalombatta');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (437, 'Celia', 'Greenville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (438, 'Annie', 'Bloomington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (439, 'Ashton', 'Carlingford');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (440, 'Randy', 'San Jose');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (441, 'Anna', 'Edison');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (442, 'Maxine', 'Winnipeg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (443, 'Harrison', 'Maintenon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (444, 'Lorraine', 'Silver Spring');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (445, 'Ty', 'Netanya');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (446, 'Viggo', 'Sao caetano do ');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (447, 'Darius', 'Somerset');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (448, 'Merillee', 'Lexington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (449, 'Minnie', 'Helsingborg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (450, 'Kelly', 'Green bay');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (451, 'Shawn', 'Rochester');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (452, 'Celia', 'Newcastle upon ');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (453, 'Domingo', 'Santa Clarat');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (454, 'Howard', 'Long Island Cit');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (455, 'Grace', 'Ludbreg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (456, 'Guy', 'Key Biscayne');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (457, 'Alfred', 'Lake worth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (458, 'Clay', 'Herne');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (459, 'Melanie', 'Berlin-Adlersho');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (460, 'Nancy', 'N. ft. Myers');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (461, 'Kylie', 'Smyrna');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (462, 'Jane', 'Boucherville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (463, 'Taryn', 'Berkshire');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (464, 'Samuel', 'Zaandam');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (465, 'Roy', 'Ricardson');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (466, 'Bill', 'Lima');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (467, 'Hank', 'Piacenza');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (468, 'Natasha', 'Chapeco');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (469, 'Gino', 'Middleburg Heig');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (470, 'Spike', 'Kuraby');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (471, 'Gary', 'Cardiff');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (472, 'Manu', 'Hilversum');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (473, 'Rhea', 'Gainesville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (474, 'Hope', 'Campana');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (475, 'Rose', 'El Dorado Hills');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (476, 'Wang', 'Ohtsu');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (477, 'Julianne', 'Lund');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (478, 'Fairuza', 'Scottsdale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (479, 'Mekhi', 'Milford');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (480, 'Russell', 'Vallauris');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (481, 'Cheryl', 'Di Savigliano');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (482, 'Colin', 'Sao caetano do ');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (483, 'Dom', 'Burlington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (484, 'Meredith', 'Cromwell');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (485, 'Sandra', 'Salisbury');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (486, 'Machine', 'Sundsvall');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (487, 'Kyle', 'Buffalo Grove');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (488, 'Bebe', 'Utrecht');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (489, 'Graham', 'Salt Lake City');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (490, 'Shannyn', 'Bretzfeld-Waldb');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (491, 'Nora', 'Aracruz');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (492, 'Lara', 'Woodbridge');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (493, 'Nickel', 'T׳³ג€by');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (494, 'Tony', 'Kozani');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (495, 'Linda', 'Santa Clarita');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (496, 'Scarlett', 'Boucherville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (497, 'Toni', 'Wilmington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (498, 'Suzanne', 'Joinville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (499, 'Norm', 'Vienna');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (500, 'Chrissie', 'Chinnor');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (501, 'Tamala', 'Villata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (502, 'Juliet', 'Bruneck');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (503, 'Stephanie', 'Johor Bahru');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (504, 'Ned', 'Bozeman');
commit;
prompt 300 records committed...
insert into SUPPLIER (supplier_id, supplier_name, region)
values (505, 'Tcheky', 'Lake worth');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (506, 'Michael', 'Golden');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (507, 'Dick', 'Trieste');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (508, 'Edgar', 'Blacksburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (509, 'Paula', 'Menlo Park');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (510, 'Viggo', 'Traralgon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (511, 'Toni', 'Villata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (512, 'Avril', 'Dardilly');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (513, 'Rawlins', 'Akita');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (514, 'Lena', 'Guelph');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (515, 'Frances', 'Philadelphia');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (516, 'Julie', 'Ulm');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (517, 'Woody', 'Turku');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (518, 'Neve', 'Graz');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (519, 'Aaron', 'Bras׳³ֲlia');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (520, 'Lydia', 'Abbotsford');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (521, 'Phil', 'Campinas');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (522, 'Milla', 'Kongserbg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (523, 'Harry', 'Kyunnam');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (524, 'Illeana', 'Zagreb');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (525, 'Gil', 'Berwyn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (526, 'Don', 'Salzburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (527, 'Julianne', 'Banbury');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (528, 'Fisher', 'Mayfield Villag');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (529, 'Coley', 'Pomona');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (530, 'Adina', 'Belo Horizonte');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (531, 'Cheech', 'Syracuse');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (532, 'Loren', 'Boucherville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (533, 'Rhys', 'Miami');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (534, 'Adam', 'Mobile');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (535, 'Jimmy', 'Campinas');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (536, 'Anjelica', 'Alpharetta');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (537, 'Cameron', 'Conshohocken');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (538, 'Colleen', 'Glendale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (539, 'Gord', 'La Plata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (540, 'Maceo', 'St Kilda');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (541, 'Hookah', 'Cardiff');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (542, 'Night', 'N. ft. Myers');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (543, 'Isabella', 'Melrose');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (544, 'Balthazar', 'Matsuyama');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (545, 'Uma', 'Warren');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (546, 'Val', 'Silver Spring');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (547, 'Neneh', 'London');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (548, 'Merle', 'Firenze');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (549, 'Meg', 'Szazhalombatta');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (550, 'Ethan', 'Linz');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (551, 'Chubby', 'Seatle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (552, 'Mark', 'Middleburg Heig');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (553, 'Jake', 'Frederiksberg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (554, 'Dave', 'Kevelaer');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (555, 'Joely', 'Saga');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (556, 'Desmond', 'Oak park');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (557, 'Devon', 'Draper');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (558, 'Miranda', 'Ani׳³ֻres');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (559, 'Madeleine', 'Horb');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (560, 'Benicio', 'O''fallon');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (561, 'Jim', 'Fountain Hills');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (562, 'Mae', 'Buffalo Grove');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (563, 'Mary', 'Courbevoie');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (564, 'Loren', 'Sugar Hill');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (565, 'Trey', 'Tyne & Wear');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (566, 'Alice', 'Cottbus');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (567, 'Whoopi', 'Hyderabad');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (568, 'Nile', 'Antwerpen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (569, 'Laura', 'Pirapora bom Je');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (570, 'Merle', 'Harahan');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (571, 'Judge', 'Nantes');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (572, 'Temuera', 'Saint-vincent-d');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (573, 'Julie', 'Middletown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (574, 'Vanessa', 'Harrisburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (575, 'Susan', 'Charlotte');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (576, 'Suzy', 'Tucson');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (577, 'Phoebe', 'Oldwick');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (578, 'Al', 'Mountain View');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (579, 'Hugh', 'Gen׳³ֻve');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (580, 'Warren', 'Akita');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (581, 'Roy', 'Huntington');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (582, 'Karon', 'Naha');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (583, 'Cuba', 'Leipzig');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (584, 'Robin', 'Hearst');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (585, 'Christina', 'East Peoria');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (586, 'Carol', 'Fleet');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (587, 'Isaac', 'Sidney');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (588, 'Jeroen', 'Mayfield Villag');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (589, 'Jodie', 'Ithaca');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (590, 'Alex', 'Houma');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (591, 'Luis', 'Eindhoven');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (592, 'Rhett', 'Sale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (593, 'Vin', 'Okayama');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (595, 'Benicio', 'Ellicott City');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (596, 'Cheech', 'Richardson');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (597, 'Breckin', 'Livermore');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (598, 'Carol', 'Woodland Hills');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (599, 'Vickie', 'Kaiserslautern');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (600, 'Tobey', 'Cambridge');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (601, 'Jessica', 'Terrasa');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (602, 'Gabriel', 'Athens');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (603, 'Joely', 'Wageningen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (604, 'Mena', 'El Segundo');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (605, 'Lin', 'Boulder');
commit;
prompt 400 records committed...
insert into SUPPLIER (supplier_id, supplier_name, region)
values (606, 'Maria', 'Belgrad');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (608, 'Pablo', 'Bloemfontein');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (609, 'Rick', 'Verwood');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (610, 'Herbie', 'Horsens');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (611, 'Kate', 'Kuraby');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (612, 'Jeff', 'Goiania');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (613, 'Terry', 'Stans');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (614, 'Mickey', 'Bellerose');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (615, 'Jaime', 'Calcutta');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (616, 'Christine', 'Spresiano');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (617, 'Kirk', 'Chiba');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (618, 'Courtney', 'Royersford');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (619, 'Melanie', 'Peine');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (620, 'Carrie', 'Kyunnam');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (621, 'Aaron', 'Hercules');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (622, 'Gil', 'High Wycombe');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (623, 'Armin', 'Ismaning');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (624, 'Tcheky', 'Los Alamos');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (625, 'Jann', 'Rome');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (626, 'Steven', 'Debary');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (627, 'Edwin', 'New Delhi');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (628, 'Dar', 'Freising');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (629, 'Franco', 'Heubach');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (630, 'Gailard', 'Glasgow');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (631, 'Stellan', 'Fort Lewis');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (632, 'Frank', 'Middletown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (633, 'Taye', 'Zwolle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (634, 'Halle', 'Treviso');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (635, 'Scott', 'Annandale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (636, 'Steve', 'Schlieren');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (637, 'Emmylou', 'Soest');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (638, 'Daryl', 'Macau');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (639, 'Lena', 'Lodi');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (640, 'Reese', 'Halfway house');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (641, 'Malcolm', 'Hermitage');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (642, 'Nigel', 'Newnan');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (643, 'Debbie', 'London');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (644, 'Crispin', 'Nizhnevartovsk');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (646, 'Robby', 'Edenbridge');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (647, 'Merrill', 'Seatle');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (648, 'Suzanne', 'Kanata');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (649, 'Rik', 'Stockholm');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (650, 'Lizzy', 'Saint-vincent-d');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (651, 'Liv', 'Madrid');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (652, 'Kitty', 'Jacksonville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (653, 'Robin', 'Bartlesville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (654, 'Ahmad', 'Geneve');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (655, 'Wayne', 'Oak Park');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (656, 'Illeana', 'Los Alamos');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (657, 'Benjamin', 'Eschen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (658, 'Thin', 'Cheshire');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (659, 'Teri', 'Glen Cove');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (660, 'Queen', 'Wien');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (661, 'Milla', 'Lakeville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (662, 'Franz', 'Erlangen');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (663, 'Cate', 'Gliwice');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (664, 'Rory', 'Clark');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (665, 'Giovanni', 'San Dimas');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (666, 'Simon', 'Maryville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (667, 'Sean', 'Annandale');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (668, 'Frederic', 'Runcorn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (669, 'Glenn', 'Bartlesville');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (670, 'Temuera', 'Ferraz  vasconc');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (671, 'Austin', 'Slough');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (672, 'Christmas', 'Leipzig');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (673, 'Javon', 'Tsu');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (674, 'Kazem', 'Dearborn');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (675, 'Nicolas', 'Ankara');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (676, 'Harold', 'Balmoral');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (678, 'Bonnie', 'Syracuse');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (679, 'Ted', 'Casselberry');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (680, 'Coley', 'El Paso');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (681, 'Robin', 'Freiburg');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (682, 'Isabella', 'Spresiano');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (683, 'Vivica', 'Amsterdam');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (684, 'Jena', 'Boston');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (685, 'Garland', 'Zaandam');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (686, 'Ceili', 'Olivette');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (687, 'Donna', 'Chemnitz');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (688, 'Jeffery', 'Akita');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (689, 'Cliff', 'Luedenscheid');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (690, 'Laurie', 'Paris');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (691, 'Rita', 'Salt Lake City');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (692, 'Hazel', 'Chorz׳³ֲ£w');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (693, 'Ron', 'Stony Point');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (694, 'Gordie', 'Hjallerup');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (695, 'Lea', 'Sao jose rio pr');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (696, 'Harold', 'Herdecke');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (697, 'Joaquim', 'Yucca');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (698, 'Ani', 'Cesena');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (699, 'Todd', 'Udine');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (999, 'JOMNB', 'ITALY');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (998, 'ABC Suppliers', 'Unknown');
insert into SUPPLIER (supplier_id, supplier_name, region)
values (98, 'A Suppliers', 'Unknown');
commit;
prompt 494 records loaded
prompt Enabling foreign key constraints for PRODUCTS...
alter table PRODUCTS enable constraint SYS_C007191;
prompt Enabling foreign key constraints for ORDER_PRODUCT...
alter table ORDER_PRODUCT enable constraint SYS_C007195;
alter table ORDER_PRODUCT enable constraint SYS_C007196;
prompt Enabling foreign key constraints for ORDER_SUPPLIER...
alter table ORDER_SUPPLIER enable constraint SYS_C007200;
prompt Enabling foreign key constraints for ORDER_WORKER...
alter table ORDER_WORKER enable constraint SYS_C007204;
prompt Enabling foreign key constraints for PURCHASE_CLIENT...
alter table PURCHASE_CLIENT enable constraint SYS_C007212;
alter table PURCHASE_CLIENT enable constraint SYS_C007213;
prompt Enabling foreign key constraints for PURCHASE_PRODUCT...
alter table PURCHASE_PRODUCT enable constraint SYS_C007217;
alter table PURCHASE_PRODUCT enable constraint SYS_C007218;
prompt Enabling foreign key constraints for PURCHASE_WORKER...
alter table PURCHASE_WORKER enable constraint SYS_C007226;
alter table PURCHASE_WORKER enable constraint SYS_C007227;
prompt Enabling triggers for CATEGORYS...
alter table CATEGORYS enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for PRODUCTS...
alter table PRODUCTS enable all triggers;
prompt Enabling triggers for ORDER_PRODUCT...
alter table ORDER_PRODUCT enable all triggers;
prompt Enabling triggers for ORDER_SUPPLIER...
alter table ORDER_SUPPLIER enable all triggers;
prompt Enabling triggers for ORDER_WORKER...
alter table ORDER_WORKER enable all triggers;
prompt Enabling triggers for PURCHASE...
alter table PURCHASE enable all triggers;
prompt Enabling triggers for PURCHASE_CLIENT...
alter table PURCHASE_CLIENT enable all triggers;
prompt Enabling triggers for PURCHASE_PRODUCT...
alter table PURCHASE_PRODUCT enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for PURCHASE_WORKER...
alter table PURCHASE_WORKER enable all triggers;
prompt Enabling triggers for SUPPLIER...
alter table SUPPLIER enable all triggers;
set feedback on
set define on
prompt Done.
