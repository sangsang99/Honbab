SHOW USER;
SELECT * FROM USER_TAB_PRIVS_RECD;
--member ------------------------------------------------------------------------
   CREATE TABLE USER_JOIN(
         id VARCHAR2(100) PRIMARY KEY,
         pw VARCHAR2(100) NOT NULL,
         name VARCHAR2(100) NOT NULL,
         nickName VARCHAR2(100) NOT NULL UNIQUE,
         tel VARCHAR2(100) NOT NULL,
         region VARCHAR2(100) NOT NULL,
         gender VARCHAR2(100) NOT NULL,
         email VARCHAR2(100) NOT NULL
         );
   CREATE TABLE BUSINES_JOIN(
         id VARCHAR2(100) PRIMARY KEY,
         pw VARCHAR2(100) NOT NULL,
         name VARCHAR2(100) NOT NULL,
         comName VARCHAR2(100) NOT NULL UNIQUE,
         tel VARCHAR2(100) NOT NULL,
         addr VARCHAR2(1000) NOT NULL,
         bizNum VARCHAR2(100) NOT NULL,
         email VARCHAR2(100) NOT NULL
         );
         
--admin ------------------------------------------------------------------------

CREATE TABLE ADMIN_LOGIN(
    ADMIN_ID VARCHAR2(100) PRIMARY KEY,
    ADMIN_PW VARCHAR2(100) NOT NULL
);

CREATE TABLE ADMIN_MANAGE(
    AD_NO NUMBER UNIQUE,
    AD_WRITE_NO NUMBER UNIQUE
);

CREATE TABLE ADMIN_NOTICE_BOARD(
    WRITE_NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    VIEWS NUMBER DEFAULT 0,
    WRITE_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE ADMIN_NOTICE_BOARD_SEQ INCREMENT BY 1 MAXVALUE 5000 NOCACHE NOCYCLE;

CREATE TABLE ADMIN_NOTICE_RE(
RE_ID VARCHAR2(100) NOT NULL,
RE_COMENT VARCHAR2(300) NOT NULL,
WRITE_GROUP NUMBER,
RE_DATE DATE DEFAULT SYSDATE,
RE_NICK VARCHAR2(100) NOT NULL,
CONSTRAINT FK_NOTICE_RE_BOARD FOREIGN KEY(WRITE_GROUP) REFERENCES ADMIN_NOTICE_BOARD(WRITE_NO) ON DELETE CASCADE
);

--find ------------------------------------------------------------------------

CREATE TABLE FIND_BOARD(
    WRITE_NO NUMBER(10) PRIMARY KEY,
    NICKNAME VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    VIEWS NUMBER(10) DEFAULT 0,
    WRITE_DATE DATE DEFAULT SYSDATE,
    AGE NUMBER NOT NULL,
    REGION VARCHAR(100) NOT NULL,
    GENDER VARCHAR2(100) NOT NULL,
    ID VARCHAR(100) NOT NULL
);


CREATE SEQUENCE FIND_BOARD_SEQ INCREMENT BY 1 MAXVALUE 1000;

CREATE TABLE FIND_RE(
RE_ID VARCHAR2(100) NOT NULL,
RE_COMENT VARCHAR2(300) NOT NULL,
WRITE_GROUP NUMBER,
RE_DATE DATE DEFAULT SYSDATE,
RE_NICK VARCHAR2(100) NOT NULL,
CONSTRAINT FK_FIND_RE_BOARD FOREIGN KEY(WRITE_GROUP) REFERENCES FIND_BOARD(WRITE_NO) ON DELETE CASCADE
);


--chall ------------------------------------------------------------------------

CREATE TABLE LEVEL_CHALLENGE(
    WRITE_NO NUMBER(10) PRIMARY KEY,
    CH_LEVEL NUMBER(10) NOT NULL,
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    NICKNAME VARCHAR2(100) NOT NULL,
    SAVE_DATE DATE DEFAULT SYSDATE,
    VIEWS NUMBER(10) DEFAULT 0,
    IMGNAME VARCHAR2(1000),
    LIKES NUMBER(10) DEFAULT 0,
    ID VARCHAR(100) NOT NULL
    );

--review ------------------------------------------------------------------------
CREATE TABLE REVIEW_BOARD(
    WRITE_NO NUMBER(10) PRIMARY KEY,
    NICKNAME VARCHAR2(100) NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    VIEWS NUMBER(10) DEFAULT 0,
    WRITE_DATE DATE DEFAULT SYSDATE,
    IMGNAME VARCHAR2(1000),
    LIKES NUMBER(10) DEFAULT 0,
    ID VARCHAR(100) NOT NULL
);

CREATE SEQUENCE REVIEW_BOARD_SEQ INCREMENT BY 1 MAXVALUE 1000;

CREATE TABLE REVIEW_RE(
RE_ID VARCHAR2(100) NOT NULL,
RE_COMENT VARCHAR2(300) NOT NULL,
WRITE_GROUP NUMBER,
RE_DATE DATE DEFAULT SYSDATE,
RE_NICK VARCHAR2(100) NOT NULL,
CONSTRAINT FK_REVIEW_RE_BOARD FOREIGN KEY(WRITE_GROUP) REFERENCES REVIEW_BOARD(WRITE_NO) ON DELETE CASCADE
);

--USER_JOIN 생성하면 실행
--CONSTRAINT 포린키이름 FOREIGN KEY 자식속성 REFERENCES 부모테이블명(자식속성이 참고할 부모속성) ON DELETE CASCADE;
ALTER TABLE REVIEW_BOARD ADD CONSTRAINT FK_REVIEW_BOARD_JOIN FOREIGN KEY(ID) REFERENCES USER_JOIN(ID) ON DELETE CASCADE;
ALTER TABLE REVIEW_BOARD ADD CONSTRAINT FK_REVIEW_RE_JOIN FOREIGN KEY(ID) REFERENCES USER_JOIN(id) ON DELETE CASCADE;

--promo ------------------------------------------------------------------------


CREATE TABLE PROMO_BOARD(
WRITE_NO NUMBER(10) PRIMARY KEY,
TITLE VARCHAR2(100),
CONTENT VARCHAR2(300),
SAVEDATE DATE DEFAULT SYSDATE,
HIT NUMBER(10) default 0,
IMAGE_FILE_NAME VARCHAR2(100),
ID VARCHAR2(20) NOT NULL,
COMNAME VARCHAR2(200),
ADDRESS VARCHAR2(300)
--CONSTRAINT FK_TEST FOREIGN key(id) REFERENCES membership(id) on delete cascade
);

CREATE SEQUENCE PROMO_BOARD_SEQ NOCACHE NOCYCLE;

CREATE TABLE PROMO_REPLY(
ID VARCHAR2(100),
TITLE VARCHAR(100),
CONTENT VARCHAR2(300),
WRITE_GROUP NUMBER(10),
WRITE_DATE DATE DEFAULT SYSDATE,
RE_NICK VARCHAR2(200),
STAR NUMBER
);










