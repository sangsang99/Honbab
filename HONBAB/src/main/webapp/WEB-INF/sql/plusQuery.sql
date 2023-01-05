insert into busines_join values('bizhonbab', 'honbab', 'biz', 'È¥¹ä', '01012341234', '¼­¿ï½Ã °­³²±¸', '023334444', 'email@email');

create table review_like(
    like_id VARCHAR2(100),
    like_write_no number(10)
);

create table find_like(
    like_id VARCHAR2(100),
    like_write_no number(10)
);

ALTER TABLE FIND_BOARD
ADD(LIKES NUMBER(10) DEFAULT 0);

CREATE SEQUENCE level_challenge_seq START WITH 1 INCREMENT BY 1;

create table challenge_like(
    like_id VARCHAR2(100),
    like_write_no number(10)
);