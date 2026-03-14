UPDATE configuration
SET value = '9l2Y04Q6r6YFTXD72vHC'
WHERE config_type = 'ZALO_OA' AND key = 'SECRET_KEY';


UPDATE configuration
SET value = '803032256782634770'
WHERE config_type = 'ZALO_OA' AND key = 'APP_ID';

UPDATE configuration
SET value = 'OKx-A86Vc1DWI_ijYvYO5snE-YwHdS9V9YEYByMplq1G5xKkyBwJSM4Ij4pJdhueTYszIyU9Xof43Q55xOYiV7ykgntezh1yMblK6EpBz45WPemfwx7eH59YwYlYyuPGQIEsFDlparvWQwHZskR4BavHv7Qgyu59L2gdEiYibsjp7we7pCwePdD7oJlMrUn3A0BuUSsewWWe0irMaOlDQpibxWoFYFDY91EL2PIAy7KHMT0JyEZXK7j0XX79zhjMTL-XAkpSn6r84DGIx8NCJWXJe2-KnQnlFM6j28drrJOp9UaFqg_lDNOeWalriv1lKHlyK_FDnm11S_DW_FVK06uWnrFQaASvPJh4OyIXn0nw4DD1pCIo3dj6gc7bpPvSP1wdBSt6bt58H8m2qkw_CdFJuLK9Xe6J4G'
WHERE config_type = 'ZALO_OA' AND key = 'REFRESH_TOKEN';

INSERT INTO configuration (id, config_type, "KEY", value, status)
VALUES
    ('66d92230-98bd-4037-a9f9-ef071aa8a269', 'ZALO_OA', 'TEMPLATE_ID_ON_DUE', '503203',1);

INSERT INTO configuration (id, config_type, "KEY", value, status)
VALUES
    ('736b9610-ab31-4192-8234-1c00c91e0ff2', 'ZALO_OA', 'TEMPLATE_ID_PRE_5_DAYS', '507610', 1);


DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM user_tab_cols
WHERE table_name = 'CONFIGURATION'
  AND column_name = 'UPDATED_AT';

IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE CONFIGURATION ADD (UPDATED_AT TIMESTAMP(6))';
END IF;
END;
/


-- Thêm các cột phục vụ ZNS
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_tab_cols
    WHERE table_name = 'SMS'
      AND column_name = 'JSON_DATA';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE SMS ADD (JSON_DATA VARCHAR2(4000))';
    END IF;
END;
/

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_tab_cols
    WHERE table_name = 'SMS'
      AND column_name = 'JSON_DATA';

    IF v_count > 0 THEN
        EXECUTE IMMEDIATE q'[
            COMMENT ON COLUMN SMS.JSON_DATA IS 
            'Chua du lieu JSON map vao ZNS/Email.'
        ]';
    END IF;
END;
/


DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_tables
    WHERE table_name = 'NOTIFICATION_HISTORY';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE NOTIFICATION_HISTORY (
                ID              VARCHAR2(36) NOT NULL PRIMARY KEY,
                SMS_ID          NUMBER,                
                SOURCE          VARCHAR2(100),       
                SOURCE_TYPE     VARCHAR2(20),        
                TEMPLATE_ID     VARCHAR2(50),
                SENT_AT         TIMESTAMP DEFAULT SYSTIMESTAMP,
                STATUS          NUMBER,                
                REQUEST         VARCHAR2(4000),       
                RESPONSE        VARCHAR2(4000),       
                CREATED_DATE    DATE DEFAULT SYSDATE
            )
        ';
    END IF;
END;
/



DECLARE
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM user_tables WHERE table_name = 'NOTIFICATION_HISTORY';

    IF v_exists > 0 THEN
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.SMS_ID IS ''ID tham chieu sang bang SMS (neu co)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.SOURCE IS ''Dia chi nguoi nhan (Vi du: 0912345678 hoac email@domain.com)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.SOURCE_TYPE IS ''Loai kenh gui ( EMAIL, ZALO)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.TEMPLATE_ID IS ''ID mau tin ZNS (Template ID)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.SENT_AT IS ''Thoi gian thuc hien gui tin''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.STATUS IS ''Trang thai gui (1: Success, -1: Failed)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.REQUEST IS ''Du lieu JSON request gui sang Zalo (Payload)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.RESPONSE IS ''Du lieu JSON response tra ve tu Zalo (hoac thong bao loi)''';
        EXECUTE IMMEDIATE 'COMMENT ON COLUMN NOTIFICATION_HISTORY.CREATED_DATE IS ''Ngay tao log''';
    END IF;
END;
/



create or replace PROCEDURE LOANANNOUNCEMENT
as  
    v_cnt number(5);
    v_total number(20,4);
    v_custid number;
    v_custName varchar2(200);
    v_mobile varchar2(20);
    v_content varchar2(500);
    v_sumTotal number(20,4);
    v_balance number(20,4);
    v_documentNo varchar2(30);
    
    -- [NEW] Biến cho ZNS
    v_jsonData varchar2(4000);
    v_amountFormatted varchar2(100);
    v_dateFormatted varchar2(50);
begin
    --Nhac no truoc 5 ngay
    --Kiem tra xem da gui tin chua
    select count(*) into v_cnt from sms where smstype = 1 and to_date(cast(createddate as date),'dd/MM/rrrr') = to_date(sysdate,'dd/MM/rrrr');
    
    if v_cnt = 0 then
        --Lay cac ky den han sau 5 ngay nua
        for i in (select * from loanschedule where duedate - to_date(sysdate,'dd/MM/rrrr') = 5 and prinnml + intnml + assetmanagementfee + expertisefee > 0
                    and loanid in (select id from loan where status = '1'))
        loop
            --Lay tong so tien can phai thanh toan cua ky
            v_total := ceil(i.prinnml + i.estint);
            select count(*) into v_cnt from customer where id in (select custid from loan where id = i.loanid);
            
            if v_cnt > 0 and v_total > 0 then
                --Lay thong tin KH
                select id, fullname, mobile into v_custId, v_custName, v_mobile from customer where id in (select custid from loan where id = i.loanid);
                
                --Lay tong so tien phai thanh toan sau 5 ngay nua (truong hop KH co nhieu khoan vay)
                select sum(prinnml + estint) into v_sumTotal from loanschedule where loanid in (select id from loan where custid = v_custId) 
                    and duedate - to_date(sysdate,'dd/MM/rrrr') = 5;
                
                --Lay so du cua KH
                select balance into v_balance from customer_balance where custid = v_custId;
                
                -- [NEW] Lấy số hợp đồng và Format dữ liệu dùng chung cho cả ZNS và SMS
                select documentno into v_documentNo from loan where id = i.loanid;
                v_amountFormatted := trim(replace(to_char(v_total, '9G999G999G999G999'), ',', '.'));
                v_dateFormatted := to_char(i.duedate,'dd/MM/rrrr');

                -- [NEW] Tạo chuỗi JSON cho ZNS
                v_jsonData := '{' ||
                    '"sohopdong": "' || v_documentNo || '",' ||
                    '"sotien": "' || v_amountFormatted || '",' ||
                    '"ngay": "' || v_dateFormatted || '",' ||
                    '"hoten": "' || v_custName || '",' ||
                    '"hoten_sodienthoai": "' || v_custName || ' ' || v_mobile || '"' ||
                '}';

                if v_balance < v_sumTotal then --Chi gui tin nhan cho nhung KH chua nop tien hoac so du khong du
                   
                    if substr(trim(v_mobile), 1, 3) in ('090', '093', '089', '070', '079', '077', '076', '078') then
                        v_content := 'FINY thong bao quy khach hang ' || trim(converttounsign(v_custName)) || ' den han tra hop dong ' 
                                        || v_documentNo || ' so tien ' || v_amountFormatted 
                                        || ' vao ngay ' || v_dateFormatted || '. Quy khach vui long thanh toan dung han.';
                    else
                        v_content := 'FINY thong bao quy khach hang ' || trim(converttounsign(v_custName)) || ' den han thanh toan so tien ' 
                                        || v_amountFormatted
                                        || ' vao ngay ' || v_dateFormatted || '. Quy khach vui long thanh toan dung han.';
                    end if;
                    
                    -- [UPDATED] Insert vào bảng SMS có thêm cột JSON_DATA
                    INSERT INTO SMS (ID, TOMOBILE, TEXT, SMSTYPE, CREATEDDATE, STATUS, CUSTID, JSON_DATA) 
                    VALUES (seq_sms.nextval, v_mobile, v_content, 1, systimestamp, 0, v_custId, v_jsonData);
                end if;
            end if;
        end loop;
    end if;
    
    --Nhac no dung ngay
    --Kiem tra xem da gui tin chua
    select count(*) into v_cnt from sms where smstype = 2 and to_date(cast(createddate as date),'dd/MM/rrrr') = to_date(sysdate,'dd/MM/rrrr');
    
    if v_cnt = 0 then
        --Lay cac ky han den han ngay hom nay
        for i in (select * from loanschedule where duedate - to_date(sysdate,'dd/MM/rrrr') = 0 and prinnml + intnml + assetmanagementfee + expertisefee > 0
                    and loanid in (select id from loan where status = '1'))
        loop
            --Lay tong so tien can phai thanh toan cua ky
            v_total := ceil(i.prinnml + i.estint);
            select count(*) into v_cnt from customer where id in (select custid from loan where id = i.loanid);
            
            if v_cnt > 0 and v_total > 0 then
                --Lay thong tin KH
                select id, fullname, mobile into v_custId, v_custName, v_mobile from customer where id in (select custid from loan where id = i.loanid);
                
                --Lay tong so tien phai thanh toan hom nay (truong hop KH co nhieu khoan vay)
                select sum(prinnml + estint) into v_sumTotal from loanschedule where loanid in (select id from loan where custid = v_custId) 
                    and duedate - to_date(sysdate,'dd/MM/rrrr') = 0;
                
                --Lay so du cua KH
                select balance into v_balance from customer_balance where custid = v_custId;
                
                -- [NEW] Chuẩn bị dữ liệu ZNS
                select documentno into v_documentNo from loan where id = i.loanid;
                v_amountFormatted := trim(replace(to_char(v_total, '9G999G999G999G999'), ',', '.'));
                v_dateFormatted := to_char(i.duedate,'dd/MM/rrrr');

                v_jsonData := '{' ||
                    '"sohopdong": "' || v_documentNo || '",' ||
                    '"sotien": "' || v_amountFormatted || '",' ||
                    '"ngay": "' || v_dateFormatted || '",' ||
                    '"hoten": "' || v_custName || '",' ||
                    '"hoten_sodienthoai": "' || v_custName || ' ' || v_mobile || '"' ||
                '}';

                if v_balance < v_sumTotal then --Chi gui tin nhan cho nhung KH chua nop tien hoac so du khong du
                    
                    if substr(trim(v_mobile), 1, 3) in ('090', '093', '089', '070', '079', '077', '076', '078') then
                        v_content := 'FINY thong bao quy khach hang ' || trim(converttounsign(v_custName)) || ' den han tra hop dong ' 
                                        || v_documentNo || ' so tien ' || v_amountFormatted
                                        || '. Quy khach vui long thanh toan truoc 17h hom nay ' || v_dateFormatted;
                    else
                        v_content := 'FINY thong bao quy khach hang ' || trim(converttounsign(v_custName)) || ' den han tra no so tien ' 
                                        || v_amountFormatted 
                                        || '. Quy khach vui long thanh toan truoc 17h hom nay ' || v_dateFormatted || '.';
                    end if;
                    
                    INSERT INTO SMS (ID, TOMOBILE, TEXT, SMSTYPE, CREATEDDATE, STATUS, CUSTID, JSON_DATA) 
                    VALUES (seq_sms.nextval, v_mobile, v_content, 2, systimestamp, 0, v_custId, v_jsonData);
                end if;
            end if;
        end loop;
    end if;
end;
/

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_tab_cols
    WHERE table_name = 'SMS'
      AND column_name = 'PROVIDER';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE SMS ADD (provider VARCHAR2(10 BYTE) DEFAULT ''SMS'')';
    END IF;
END;
/




DECLARE
    v_count NUMBER;
BEGIN
   
    SELECT COUNT(*)
    INTO v_count
    FROM user_tables
    WHERE table_name = 'NOTIFICATION_WHITELIST';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE NOTIFICATION_WHITELIST (
                ID              NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                 "TO"        VARCHAR2(50),
                IS_ACTIVE       NUMBER DEFAULT 1
            )
        ';
    END IF;
END;
/

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM user_indexes
    WHERE index_name = 'IDX_WL_ACTIVE_STATUS';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE INDEX IDX_WL_ACTIVE_TO
            ON NOTIFICATION_WHITELIST(IS_ACTIVE, "TO")
        ';
    END IF;
END;
/
COMMENT ON COLUMN NOTIFICATION_WHITELIST.IS_ACTIVE IS
    'Trạng thái: 1 = Active, 0 = Inactive';

 
  INSERT   INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
        '0337305098',
        1
    );

 INSERT   INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
        '0334767768',
        1
    );

  INSERT  INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
     
        '0904191941',
        1
        );

 INSERT  INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
    
        '0984055083',
        1 );

  INSERT  INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
     
        '0976214911',
        1
        )
;
  INSERT   INTO NOTIFICATION_WHITELIST ("TO", IS_ACTIVE)
    VALUES (
     
        '0359794109',
        1 );
 
