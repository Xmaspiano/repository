
DROP TRIGGER TR_TOUSER;
DROP SEQUENCE SEQ_TOUSER;
DROP TABLE TOUSER

DROP TRIGGER TR_PENCILIMG;
DROP SEQUENCE SEQ_PENCILIMG;
DROP TABLE PENCILIMG

DROP TRIGGER TR_PENCIL;
DROP SEQUENCE SEQ_PENCIL;
DROP TABLE PENCIL

-- Create table
create table PENCIL
(
  id         NUMBER(10) not null,
  jjcd       NUMBER(2),
  bt         VARCHAR2(200),
  wtlb       NUMBER(2),
  wtms       VARCHAR2(500),
  touser     VARCHAR2(500),
  createdate DATE default sysdate,

  constraint PK_PENCIL primary key (id)
);
-- Add comments to the columns
comment on column PENCIL.jjcd
  is '紧急程度';
comment on column PENCIL.bt
  is '标题';
comment on column PENCIL.wtlb
  is '问题类别';
comment on column PENCIL.wtms
  is '问题描述';
comment on column PENCIL.touser
  is '问题通知人';
comment on column PENCIL.createdate
  is '记录时间';

--创建序列
create sequence SEQ_PENCIL
minvalue 1
nomaxvalue
start with 1
increment by 1
nocycle   --一直累加，不循环
nocache  --不缓存
;

--创建触发器，如果insert语句不指定ID自动插入增长值
CREATE OR REPLACE TRIGGER TR_PENCIL
BEFORE INSERT ON PENCIL FOR EACH ROW WHEN (new.id is null)
begin
select SEQ_PENCIL.nextval into:new.id from dual;
end;


-- Create table
create table PENCILIMG
(
  id         NUMBER(10) not null,
  imgdata    BLOB,
  rotate     VARCHAR2(3),
  pencilid   NUMBER(10),
  createdate DATE default sysdate,

  constraint PK_PENCILIMG primary key (id)
);
-- Add comments to the columns
comment on column PENCILIMG.imgdata
  is '通知表单图片数据';
comment on column PENCILIMG.rotate
  is '图片修正角度';
comment on column PENCILIMG.pencilid
  is '通知表单ID';
comment on column PENCILIMG.createdate
  is '记录操作时间';

--创建序列
create sequence SEQ_PENCILIMG
minvalue 1
nomaxvalue
start with 1
increment by 1
nocycle   --一直累加，不循环
nocache  --不缓存
;

--创建触发器，如果insert语句不指定ID自动插入增长值
CREATE OR REPLACE TRIGGER TR_PENCILIMG
BEFORE INSERT ON PENCILIMG FOR EACH ROW WHEN (new.id is null)
begin
select SEQ_PENCILIMG.nextval into:new.id from dual;
end;



-- Create table
create table TOUSER
(
  id         NUMBER(10) not null,
  touser     VARCHAR2(10),
  lastname   VARCHAR2(50),
  pencilid   NUMBER(10),
  createdate DATE default sysdate,

  constraint PK_TOUSER primary key (id)
);
-- Add comments to the columns
comment on column TOUSER.touser
  is '通知人用户ID';
comment on column TOUSER.name
  is '姓名';
comment on column TOUSER.pencilid
  is '通知表单ID';
comment on column TOUSER.createdate
  is '记录时间';

--创建序列
create sequence SEQ_TOUSER
minvalue 1
nomaxvalue
start with 1
increment by 1
nocycle   --一直累加，不循环
nocache  --不缓存
;

--创建触发器，如果insert语句不指定ID自动插入增长值
CREATE OR REPLACE TRIGGER TR_TOUSER
BEFORE INSERT ON TOUSER FOR EACH ROW WHEN (new.id is null)
begin
select SEQ_TOUSER.nextval into:new.id from dual;
end;


-- Create table
create table ANSWER
(
  id         NUMBER(10) not null,
  pencilid   NUMBER(10),
  answer     VARCHAR2(500),
  creator    NUMBER(10),
  createdate DATE default sysdate,

  constraint PK_ANSWER primary key (id)
);
-- Add comments to the columns
comment on column ANSWER.pencilid
  is '通知表单ID';
comment on column ANSWER.answer
  is '处理意见';
comment on column ANSWER.creator
  is '处理人姓名';
comment on column ANSWER.createdate
  is '记录时间';

--创建序列
create sequence SEQ_ANSWER
minvalue 1
nomaxvalue
start with 1
increment by 1
nocycle   --一直累加，不循环
nocache  --不缓存
;

--创建触发器，如果insert语句不指定ID自动插入增长值
CREATE OR REPLACE TRIGGER TR_ANSWER
BEFORE INSERT ON ANSWER FOR EACH ROW WHEN (new.id is null)
begin
select SEQ_ANSWER.nextval into:new.id from dual;
end;

-- Create table
create table MESSAGE
(
  id         NUMBER(10) not null,
  pencilid   NUMBER(10),
  message     VARCHAR2(500),
  creator    NUMBER(10),
  createdate DATE default sysdate,

  constraint PK_MESSAGE primary key (id)
);
-- Add comments to the columns
comment on column MESSAGE.pencilid
  is '通知表单ID';
comment on column MESSAGE.message
  is '留言信息';
comment on column MESSAGE.creator
  is '留言人姓名';
comment on column MESSAGE.createdate
  is '记录时间';

--创建序列
create sequence SEQ_MESSAGE
minvalue 1
nomaxvalue
start with 1
increment by 1
nocycle   --一直累加，不循环
nocache  --不缓存
;

--创建触发器，如果insert语句不指定ID自动插入增长值
CREATE OR REPLACE TRIGGER TR_MESSAGE
BEFORE INSERT ON MESSAGE FOR EACH ROW WHEN (new.id is null)
begin
select SEQ_MESSAGE.nextval into:new.id from dual;
end;
