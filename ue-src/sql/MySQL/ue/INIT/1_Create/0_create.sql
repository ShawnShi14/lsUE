##组件类型表
CREATE TABLE UE_COM_TYPE (
    ID VARCHAR(32) NOT NULL,
    NAME VARCHAR(100) NOT NULL,
    PARENT_ID VARCHAR(32) NOT NULL,
    DISPLAY_ORDER INTEGER NOT NULL,
    DESCRIPTION VARCHAR(500)
);
ALTER TABLE UE_COM_TYPE 
	ADD CONSTRAINT UE_COM_TYPE_PK
	PRIMARY KEY (ID); 

##组件表
CREATE TABLE UE_COM (
    ID VARCHAR(32) NOT NULL,
    NAME VARCHAR(100) NOT NULL, 
    USER_ID VARCHAR(32) NOT NULL,
    TYPE_ID VARCHAR(32) NOT NULL,
    BROWSER_IE INTEGER NOT NULL,
    WEBSITE VARCHAR(500),
    DESCRIPTION VARCHAR(500),
    DOWNLOAD_COUNT INTEGER,
    BROWSE_COUNT INTEGER,
    CREATE_TIME CHAR(17) NOT NULL,
    UPDATE_TIME CHAR(17) NOT NULL,
    RELEASE_VERSION	VARCHAR (10),
    FEEDBACK_COUNT INTEGER,
    SUFFIX VARCHAR(10) NOT NULL DEFAULT 'html'
);
ALTER TABLE UE_COM 
	ADD CONSTRAINT UE_COM_PK
	PRIMARY KEY (ID); 

##反馈表
CREATE TABLE UE_FEEDBACK (
   ID VARCHAR(32) NOT NULL,
   USER_ID  VARCHAR(32) NOT NULL,
   COM_ID  VARCHAR(32) NOT NULL,
   CONTENT  VARCHAR(2000) NOT NULL,
   CREATE_TIME CHAR(17) NOT NULL,
   SCORE  CHAR(1) NOT NULL
);
ALTER TABLE UE_FEEDBACK 
	ADD CONSTRAINT UE_FEEDBACK_PK
	PRIMARY KEY (ID);