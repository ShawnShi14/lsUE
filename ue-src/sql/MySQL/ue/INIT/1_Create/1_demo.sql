####创建组织树表
CREATE TABLE DEMO_ORGAN(
	ID VARCHAR(32) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	PARENT_ID VARCHAR(32) NOT NULL,
	IS_PARENT CHAR(1) 
);
ALTER TABLE DEMO_ORGAN 
	ADD CONSTRAINT DEMO_ORGAN_PK
	PRIMARY KEY (ID);

####创建用户、用户档案表
DROP TABLE IF EXISTS DEMO_ARCHIVES;
DROP TABLE IF EXISTS DEMO_USER;

####用户
CREATE TABLE DEMO_USER (
	USER_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	USER_NAME VARCHAR(30) NOT NULL,
	NICKNAME VARCHAR(30),
	PASSWORD VARCHAR(128) NOT NULL,
	ACT_STATUS CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'N: 正常 L: 锁定(待激活) X：删除'
); 
	
####用户档案
CREATE TABLE DEMO_ARCHIVES (
	USER_ID INT NOT NULL,
	GENDER CHAR(1) NOT NULL COMMENT 'M:男 F:女 N:未知',
	BIRTHDAY CHAR(15),
	EDUCATION CHAR(1) COMMENT '学历',
	ID VARCHAR(20) COMMENT '身份证号',
	SCHOOL VARCHAR(30) COMMENT '学校',
	EMAIL  VARCHAR(30) COMMENT '邮箱'
);
ALTER TABLE DEMO_ARCHIVES 
	ADD CONSTRAINT DEMO_ARCHIVES_PK
	PRIMARY KEY (USER_ID); 
	
####创建产品表
CREATE TABLE DEMO_PRODUCT(
   ID VARCHAR(32) NOT NULL,
   PRODUCT_CODE VARCHAR(32) NOT NULL,
   PRODUCT_NAME VARCHAR(32) NOT NULL,
   PRODUCT_TYPE VARCHAR(32) NOT NULL,
   PRODUCT_MANU VARCHAR(32),
   PRODUCT_NUM  INT NOT NULL,
   PRODUCT_DATE VARCHAR(32) NOT NULL,
   PRODUCT_PRICE DOUBLE NOT NULL
);
ALTER TABLE DEMO_PRODUCT 
	ADD CONSTRAINT DEMO_PRODUCT_PK
	PRIMARY KEY (ID); 

####新增行政区划表
CREATE TABLE pub_cant (
  CANT_CODE varchar(20) NOT NULL,
  CANT_NAME varchar(250) NOT NULL,
  SHORT_NAME varchar(120) DEFAULT NULL,
  CANT_TYPE varchar(10) NOT NULL,
  SUPER_CODE varchar(20) NOT NULL,
  COUNTRY_CODE varchar(30) DEFAULT NULL,
  CANT_NOTE varchar(10) DEFAULT NULL,
  IN_USE char(1) NOT NULL,
  PRIMARY KEY (CANT_CODE)
);