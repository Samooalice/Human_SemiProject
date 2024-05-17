-- 대체뭐니(That's money) 데이터베이스 작업(jennie는 테이블이 너무 많은 관계로 프로젝트 동안은 이 chatbot계정으로 할 것)

-- system 계정으로 작업할 내용
-- chatbot이란 이름의 계정 생성
create user chatbot IDENTIFIED by 12345 account unlock;
 
-- chatbot에 테이블 스페이스 관련 권한 부여(계속 생성)
grant unlimited tablespace to chatbot;
 
-- 기본 테이블스페이스 설정
ALTER USER chatbot DEFAULT TABLESPACE USERS;
 
-- 임시 테이블스페이스 설정
ALTER USER chatbot TEMPORARY TABLESPACE TEMP;

-- chatbot 사용자 계정에 권한 부여
grant connect, resource to chatbot;
 
-- chatbot 사용자 계정 접속 권한 부여
grant create session to chatbot;
 
-- chatbot 사용자 계정에 테이블 생성 권한 부여
grant create table to chatbot;

-- 다른 사람들은 system계정의 이 명령어를 실행하면 됨(system 계정으로)
conn chatbot/12345;

-- chat_member(회원) 테이블 생성
CREATE TABLE chat_member(
    mno NUMBER(4)
        CONSTRAINT BOT_MNO_PK primary key,
    nickname VARCHAR2(15 CHAR)
        CONSTRAINT BOT_NICKNAME_UK unique
        CONSTRAINT BOT_NICKNAME_NN not null,
    period_day VARCHAR2(15 CHAR)
        CONSTRAINT BOT_PERIOD_NN not null,
    birthdate DATE
        CONSTRAINT BOT_BIRTH_NN not null,
    gen CHAR(1)
        CONSTRAINT BOT_GEN_NN not null,
    main_bank VARCHAR2(100 CHAR)
        CONSTRAINT BOT_MAINBANK_NN not null,
    interest_type VARCHAR2(100 CHAR)
        CONSTRAINT BOT_TYPE_NN not null
);

-- Product_info(상품안내) 테이블 생성
CREATE TABLE product_info(
    product_no NUMBER(4)
        CONSTRAINT PRODUCT_NO_PK primary key,
    ages VARCHAR2(10 CHAR)
        CONSTRAINT PRODUCT_AGES_NN not null,
    product_bank VARCHAR2(10 CHAR)
        CONSTRAINT PRODUCT_BANK_NN not null,
    product_name VARCHAR2(100 CHAR)
        CONSTRAINT PRODUCT_NAME_UK unique
        CONSTRAINT PRODUCT_NAME_NN not null,
    product_file VARCHAR2(4000 CHAR)
        CONSTRAINT PRODUCT_FILE_NN not null,
    product_type VARCHAR2(50 CHAR)
        CONSTRAINT PRODUCT_TYPE_NN not null,
    join_target VARCHAR2(50 CHAR)
        CONSTRAINT PRODUCT_TARGET_NN not null
);

-- 제약조건 조회
-- select * from user_constraints;

-- NOW_PRODUCT(현재가입상품) 테이블 생성
CREATE TABLE now_product(
    now_no NUMBER(4)
        CONSTRAINT NOW_NO_PK primary key,
    mno NUMBER(4)
        CONSTRAINT NOW_MNO_FK REFERENCES chat_member(mno)
        CONSTRAINT NOW_MNO_NN not null,
    product_no NUMBER(4)
        CONSTRAINT NOW_PNO_FK REFERENCES product_info(product_no)
        CONSTRAINT NOW_PNO_NN not null,
    isshow CHAR(1)
        CONSTRAINT NOW_ISSHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT NOW_ISSHOW_NN not null
);