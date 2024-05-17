-- ��ü����(That's money) �����ͺ��̽� �۾�(jennie�� ���̺��� �ʹ� ���� ����� ������Ʈ ������ �� chatbot�������� �� ��)

-- system �������� �۾��� ����
-- chatbot�̶� �̸��� ���� ����
create user chatbot IDENTIFIED by 12345 account unlock;
 
-- chatbot�� ���̺� �����̽� ���� ���� �ο�(��� ����)
grant unlimited tablespace to chatbot;
 
-- �⺻ ���̺����̽� ����
ALTER USER chatbot DEFAULT TABLESPACE USERS;
 
-- �ӽ� ���̺����̽� ����
ALTER USER chatbot TEMPORARY TABLESPACE TEMP;

-- chatbot ����� ������ ���� �ο�
grant connect, resource to chatbot;
 
-- chatbot ����� ���� ���� ���� �ο�
grant create session to chatbot;
 
-- chatbot ����� ������ ���̺� ���� ���� �ο�
grant create table to chatbot;

-- �ٸ� ������� system������ �� ��ɾ �����ϸ� ��(system ��������)
conn chatbot/12345;

-- chat_member(ȸ��) ���̺� ����
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

-- Product_info(��ǰ�ȳ�) ���̺� ����
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

-- �������� ��ȸ
-- select * from user_constraints;

-- NOW_PRODUCT(���簡�Ի�ǰ) ���̺� ����
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