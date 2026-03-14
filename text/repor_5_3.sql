create or replace PACKAGE pck_report AS
    /*
        Sale
    */
    --So lieu tong quan
    PROCEDURE saleoverview (
        pv_refcursor  IN OUT SYS_REFCURSOR,
        pv_userid     NUMBER
    );

    --Top doanh so

    PROCEDURE topsale (
        pv_refcursor IN OUT SYS_REFCURSOR
    );

    /*
        Van hanh
    */
    --So lieu tong quan

    PROCEDURE operatoroverview (
        pv_refcursor  IN OUT SYS_REFCURSOR,
        pv_userid     NUMBER
    );

    --Danh sach khoan vay

    PROCEDURE operatorloan (
        pv_refcursor     IN OUT SYS_REFCURSOR,
        pv_id            NUMBER,
        pv_custid        NUMBER,
        pv_fullname      VARCHAR,
        pv_mobile        VARCHAR,
        pv_idnumber      VARCHAR,
        pv_loantype      VARCHAR,
        pv_term          NUMBER,
        pv_rate          NUMBER,
        pv_rateovd       NUMBER,
        pv_feerate       NUMBER,
        pv_status        VARCHAR,
        pv_paytype       VARCHAR,
        pv_termtype      VARCHAR,
        pv_loanstatus    VARCHAR,
        pv_saleid        NUMBER,
        pv_salefullname  VARCHAR,
        pv_lnfromdate    VARCHAR,
        pv_lntodate      VARCHAR
    );

    --Danh sach lich tra no

    PROCEDURE operatorloanschedule (
        pv_refcursor       IN OUT SYS_REFCURSOR,
        pv_loanid          NUMBER,
        pv_loanscheduleid  NUMBER,
        pv_custid          NUMBER,
        pv_fullname        VARCHAR,
        pv_mobile          VARCHAR,
        pv_idnumber        VARCHAR,
        pv_branch          VARCHAR,
        pv_paytype         VARCHAR,
        pv_loanstatus      VARCHAR,
        pv_loantype        VARCHAR,
        pv_salefullname    VARCHAR,
        pv_lnfromdate      VARCHAR,
        pv_lntodate        VARCHAR,
        pv_userid          NUMBER,
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
        pv_page            NUMBER,
        pv_size            NUMBER,
        pv_custtype        VARCHAR2,
        pv_record_total    OUT NUMBER
    );


    --Danh sach giao dich

    PROCEDURE operatortransaction (
        pv_refcursor  IN OUT SYS_REFCURSOR,
        pv_fullname   VARCHAR,
        pv_mobile     VARCHAR,
        pv_idnumber   VARCHAR,
        pv_branch     VARCHAR,
        pv_tranname   VARCHAR,
        pv_trandes    VARCHAR,
        pv_fromdate   VARCHAR,
        pv_todate     VARCHAR,
        pv_userid     NUMBER
    );

    --Bao cao du thu
    -- ThaiDT - FINY-90 - Date 08/01/2026
    PROCEDURE operatorestpayment (
        pv_refcursor   IN OUT SYS_REFCURSOR,
        pv_fullname    VARCHAR,
        pv_mobile      VARCHAR,
        pv_idnumber    VARCHAR,
        pv_branch      VARCHAR,
        pv_userid      NUMBER,
        pv_documentno  VARCHAR,
        pv_fromdate    VARCHAR,
        pv_todate      VARCHAR
    );


    --Bao cao du no
    -- ThaiDT FINY-90 add filter by debtGroup(lnClass) Date 06/01/2026

    PROCEDURE outstandingloan (
        pv_refcursor       IN OUT SYS_REFCURSOR,
        pv_userid          NUMBER,
        pv_fullname        VARCHAR,
        pv_branch          VARCHAR,
        pv_fromdate        VARCHAR,
        pv_todate          VARCHAR,
   
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
        pv_page            NUMBER,
        pv_size            NUMBER,
        pv_custtype        VARCHAR2,
        pv_record_total    OUT NUMBER
    );

    --Bao cao no qua han

    PROCEDURE debtovdmanagement (
        pv_refcursor   IN OUT SYS_REFCURSOR,
        pv_documentno  VARCHAR,
        pv_fullname    VARCHAR,
        pv_mobile      VARCHAR,
        pv_idnumber    VARCHAR,
        pv_branch      VARCHAR,
        pv_sale        VARCHAR,
        pv_lnclass     VARCHAR,
        pv_fromdate    VARCHAR,
        pv_todate      VARCHAR,
        pv_userid      NUMBER,
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
        pv_page            NUMBER,
        pv_size            NUMBER,
        pv_custtype        VARCHAR2,
        pv_record_total    OUT NUMBER
);

    --Bao cao trich lap du phong

    PROCEDURE init_table_tmp_report_provision;

    PROCEDURE report_provision (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_from_date     VARCHAR2,
        p_to_date       VARCHAR2,
        p_mien          VARCHAR2,
        p_pgd           VARCHAR2,
        p_ten_kh        VARCHAR2,
        p_sp_vay        VARCHAR2,
        p_so_hd         VARCHAR2,
        p_ky_han_vay    VARCHAR2,
        p_sort_type     VARCHAR2,
        p_sort_name     VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2
    );

    --Bao cao trich lap du phong v2

    PROCEDURE init_table_tmp_report_provision_v2 (
        p_batch_date DATE
    );

    PROCEDURE report_provision_v2 (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_ten_kh        VARCHAR2,
        p_so_hd         VARCHAR2,
        p_ma_pgd        VARCHAR2,
        p_ten_pgd       VARCHAR2,
        p_nhom_no       VARCHAR2,
        p_from_date     VARCHAR2,
        p_to_date       VARCHAR2,
        p_sort_type     VARCHAR2,
        p_sort_name     VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2,
        -- THAIDT: FINY-106 06/03/2026 Them custtype
        p_custtype      VARCHAR2
    );

    --Bao cao ty le chuyen nhom

    PROCEDURE conversion_rate_report (
        pv_refcursor    IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        pv_userid       NUMBER,
        pv_fullname     VARCHAR2,
        pv_branchname   VARCHAR2,
        pv_areaname     VARCHAR2,
        pv_regionname   VARCHAR2,
        pv_fromdate     VARCHAR2,
        pv_todate       VARCHAR2,
        pv_page         VARCHAR2,
        pv_size         VARCHAR2,
        pv_mod          VARCHAR2,
         -- THAIDT: FINY-106 05/03/2026 Them moi tham so custtype
        pv_custtype varchar2
    );

    --Báo cáo thực thu

    PROCEDURE init_table_tmp_avenue_report (
        p_lastdaymonpre  VARCHAR2,
        p_fromdate       VARCHAR2,
        p_todate         VARCHAR2
    );

    PROCEDURE avenuereport (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_fromdate      VARCHAR2,
        p_todate        VARCHAR2,
        p_customername  VARCHAR2,
        p_documentno    VARCHAR2,
        p_productname   VARCHAR2,
        p_term          VARCHAR2,
        p_lnclass       VARCHAR2,
        p_invoice       VARCHAR2,
        p_idnumber      VARCHAR2,
        p_sorttype      VARCHAR2,
        p_sortname      VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2,
        -- THAIDT: FINY-106 06/03/2026 Them custtype
        p_custtype      VARCHAR2
    );

    -- Báo cáo giao dịch

    PROCEDURE init_table_tmp_transaction_report;

    PROCEDURE transaction_report (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_fullname      VARCHAR2,
        p_mobile        VARCHAR2,
        p_idnumber      VARCHAR2,
        p_documentno    VARCHAR2,
        p_branch        VARCHAR2,
        p_loantype      VARCHAR2,
        p_tranname      VARCHAR2,
        p_trandes       VARCHAR2,
        p_tranfromdate  VARCHAR2,
        p_trantodate    VARCHAR2,
        p_lnfromdate    VARCHAR2,
        p_lntodate      VARCHAR2,
        p_sorttype      VARCHAR2,
        p_sortname      VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2,
        p_custtype      VARCHAR2 --ThaiDT finy-106
    );

    --Báo cáo dự thu

    PROCEDURE init_table_tmp_estpayment_report;

    PROCEDURE estpayment_report (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_fullname      VARCHAR2,
        p_mobile        VARCHAR2,
        p_idnumber      VARCHAR2,
        p_documentno    VARCHAR2,
        p_branch        VARCHAR2,
        p_fromdate      VARCHAR2,
        p_todate        VARCHAR2,
        p_sorttype      VARCHAR2,
        p_sortname      VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2,
        p_debtGroup     VARCHAR2,
        p_custtype      VARCHAR2
    );

END;
/
create or replace package body      pck_report
is
    procedure saleOverview(pv_refcursor in out sys_refcursor, pv_userId number)
    is
        v_cnt number;
        v_userRole number;
        v_userBranch varchar(20);
        v_needToAdd number;
        v_waitForApprove number;
        v_amtPaid number(20,4);
        v_amtAvailable number(20,4);
        v_waitForRelease number;
        
        v_except EXCEPTION;
        v_errcode VARCHAR2(10);
        v_errmsg VARCHAR2(200);
    begin
        select count(*) into v_cnt from admin_user where user_id = pv_userId;
        if v_cnt = 0 then
            v_errcode := '0';
            v_errmsg := 'Thông tin người dùng không tồn tại';
            raise v_except;
        end if;
        
        --Lay thong tin quyen va cua hang cua user
        select role, branch into v_userRole, v_userBranch from admin_user where user_id = pv_userId;
        
        --Lay so ho so cho bo sung
        select count(id) into v_needToAdd from loanregistration where saleid = pv_userId and status = '2';
        --User la truong phong giao dich
        if v_userRole = 5 then 
            select count(id) into v_needToAdd from loanregistration r where status = '2' 
                and exists (select user_id from admin_user where user_id = r.saleid and branch = v_userBranch);
        end if;
        
        --Lay so ho so cho phe duyet
        select count(id) into v_waitForApprove from loanregistration where saleid = pv_userId and status in ('4','6','13');
        --User la truong phong giao dich
        if v_userRole = 5 then 
            select count(id) into v_waitForApprove from loanregistration r where status in ('4','6','13') 
                and exists (select user_id from admin_user where user_id = r.saleid and branch = v_userBranch);
        end if;
        
        --Lay so tien da thu
        select nvl(sum(prinpaid + intpaid + assetmanagementpaid +feeovdpaid + expertisefeepaid), 0) into v_amtPaid 
        from loan l, loanregistration r where l.regid = r.id and r.saleid = pv_userId;
        --User la truong phong giao dich
        if v_userRole = 5 then 
            select nvl(sum(prinpaid + intpaid + assetmanagementpaid +feeovdpaid + expertisefeepaid), 0) into v_amtPaid 
            from loan l, loanregistration r 
            where l.regid = r.id and exists (select user_id from admin_user where user_id = r.saleid and branch = v_userBranch);
        end if;
        
        --Lay so tien phai thu
        select nvl(sum(prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + feeovd + expertisefee + expertisefeeovd), 0) into v_amtAvailable 
        from loan l, loanregistration r where l.regid = r.id and r.saleid = pv_userId;
        --User la truong phong giao dich
        if v_userRole = 5 then 
            select nvl(sum(prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + feeovd + expertisefee + expertisefeeovd), 0) into v_amtAvailable 
            from loan l, loanregistration r 
            where l.regid = r.id and exists (select user_id from admin_user where user_id = r.saleid and branch = v_userBranch);
        end if;
        
        --Lay so ho so cho giai ngan
        select count(id) into v_waitForRelease from loanregistration where saleid = pv_userId and status in ('9','10');
        --User la truong phong giao dich
        if v_userRole = 5 then 
            select count(id) into v_waitForRelease from loanregistration r where status in ('9','10') 
                and exists (select user_id from admin_user where user_id = r.saleid and branch = v_userBranch);
        end if;
        
        open pv_refcursor for
        select v_needToAdd needToAdd, 
                v_waitForApprove waitForApprove, 
                v_amtPaid amtPaid, 
                v_amtAvailable amtAvailable, 
                v_waitForRelease waitForRelease 
        from dual;
    exception when v_except then
        open pv_refcursor for
        select v_errcode pv_status, v_errmsg pv_des from dual;
    end;
    
    procedure topSale(pv_refcursor in out sys_refcursor)
    is
    begin
        open pv_refcursor for
        select * from (
            select u.full_name fullName, sum(l.loanamount) loanAmt, g.name grName from admin_user u, loanregistration l, group_user g
            where u.user_id = l.saleid and u.gid = g.gid and to_char(l.regdate, 'MM/rrrr') = to_char(to_date(sysdate, 'dd/MM/rrrr'), 'MM/rrrr')
            group by u.full_name, g.name
        ) 
        where rownum = 10 order by loanAmt desc;
    end;
    
    procedure operatorOverview(pv_refcursor in out sys_refcursor, pv_userId number)
    is
        v_cnt number;
        v_userRole number;
        v_waitForApprove number;
        v_waitForRelease number;
        v_waitForSignature number;
        
        v_except EXCEPTION;
        v_errcode VARCHAR2(10);
        v_errmsg VARCHAR2(200);
    begin
        select count(*) into v_cnt from admin_user where user_id = pv_userId;
        if v_cnt = 0 then
            v_errcode := '0';
            v_errmsg := 'Thông tin người dùng không tồn tại';
            raise v_except;
        end if;
        
        --Lay thong tin quyen cua user
        select role into v_userRole from admin_user where user_id = pv_userId;
        
        --Lay so ho so cho giai ngan
        select count(id) into v_waitForRelease from loanregistration where status = '9';
        --User la truong phong van hanh
        if v_userRole = 6 then 
            select count(id) into v_waitForRelease from loanregistration r where status = '9';
        end if;
        
        --Lay so ho so cho phe duyet giai ngan
        select count(id) into v_waitForApprove from loan where status = '0';
        --User la truong phong van hanh
        if v_userRole = 6 then 
            select count(id) into v_waitForApprove from loan where status = '0';
        end if;
        
        --Lay so ho so cho ky hop dong
        select count(id) into v_waitForSignature from loanregistration where status = '10';
        --User la truong phong van hanh
        if v_userRole = 6 then 
            select count(id) into v_waitForSignature from loanregistration r where status = '10';
        end if;
        
        open pv_refcursor for
        select v_waitForRelease waitForRelease, 
                v_waitForApprove waitForApprove,
                v_waitForSignature waitForSignature
        from dual;
    exception when v_except then
        open pv_refcursor for
        select v_errcode pv_status, v_errmsg pv_des from dual;
    end;
    
    procedure operatorLoan(pv_refcursor in out sys_refcursor, pv_id number, pv_custId number, pv_fullName varchar, pv_mobile varchar, pv_idNumber varchar,  
                            pv_loanType varchar, pv_term number, pv_rate number, pv_rateOvd number, pv_feeRate number, pv_status varchar, pv_payType varchar, 
                            pv_termType varchar, pv_loanStatus varchar, pv_saleId number, pv_saleFullName varchar, pv_lnFromDate varchar, pv_lnToDate varchar)
    is
    begin
        open pv_refcursor for
        select saleid, idnumber, mobile, id, custid, fullname, lndate, amount, term, rate, feerate, rateovd, prinnml, prinovd, lnclass, intnml, intovd, assetmanagementfee, 
                assetmanagementovd, status, paytype, termtype, createddate, loanstatus, regid, loantype, salefullname
        from (
                select lr.saleid, c.idnumber, c.mobile, l.id, l.custid, c.fullname, l.lndate, l.amount, l.term, l.rate, l.feerate, l.rateovd, l.prinnml, l.prinovd, l.lnclass, 
                        l.intnml, l.intovd, l.assetmanagementfee, l.assetmanagementovd, al1.name status, al2.name paytype, al3.name termtype, l.createddate, 
                        (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                        l.regid, al4.name loantype, u.full_name salefullname
                from loan l, customer c, allcode al1, allcode al2, allcode al3, loanregistration lr, allcode al4, admin_user u
                where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id 
                        and l.status = al1.code and al1.type = 'LNSTATUS'       
                        and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                        and l.termtype = al3.code and al3.type = 'TERMTYPE' 
                        and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                        and l.status = '1' 
        )
        where (id = pv_id or pv_id is null) and (custid = pv_custId or pv_custId is null) 
            and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
            and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null)
            and (lndate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (lndate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null) 
            and (term = pv_term or pv_term is null) and (rate = pv_rate or pv_rate is null) and (rateOvd = pv_rateOvd or pv_rateOvd is null) 
            and (feerate = pv_feeRate or pv_feeRate is null) and (status like '%' || pv_status || '%' or pv_status is null) 
            and (paytype like '%' || pv_payType || '%' or pv_payType is null) and (termtype like '%' || pv_termType || '%' or pv_termType is null)
            and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null)
            and (saleid = pv_saleId or pv_saleId is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null)
            and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
    end;
    
   PROCEDURE operatorloanschedule (
    pv_refcursor       IN OUT SYS_REFCURSOR,
    pv_loanid          NUMBER,
    pv_loanscheduleid  NUMBER,
    pv_custid          NUMBER,
    pv_fullname        VARCHAR,
    pv_mobile          VARCHAR,
    pv_idnumber        VARCHAR,
    pv_branch          VARCHAR,
    pv_paytype         VARCHAR,
    pv_loanstatus      VARCHAR,
    pv_loantype        VARCHAR,
    pv_salefullname    VARCHAR,
    pv_lnfromdate      VARCHAR,
    pv_lntodate        VARCHAR,
    pv_userid          NUMBER,
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
    pv_page            NUMBER,
    pv_size            NUMBER,
    pv_custtype        VARCHAR2,
    pv_record_total    OUT NUMBER
) IS
    v_currdate  DATE;
    v_role      NUMBER(2);
    v_branch    VARCHAR(10);
    v_area      VARCHAR(10);
    v_region    VARCHAR(10);
    -- THAIDT: FINY-106 05/03/2026 Khai bao bien ho tro phan trang
    v_start_row NUMBER;
    v_end_row   NUMBER;
BEGIN
    -- Lay thong tin ngay lam viec
    SELECT dateval INTO v_currdate FROM businessdate WHERE datetype = 'CURRDATE';

    BEGIN
        SELECT role, branch INTO v_role, v_branch FROM admin_user WHERE user_id = pv_userid;
        SELECT aid, rid INTO v_area, v_region FROM branch WHERE bid = v_branch;
    EXCEPTION WHEN OTHERS THEN
        v_role := 0;
        v_branch := NULL;
        v_area := NULL;
        v_region := NULL;
    END;

    -- THAIDT: FINY-106 05/03/2026 Tinh toan dong bat dau va ket thuc
    IF pv_page IS NOT NULL AND pv_size IS NOT NULL THEN
        v_start_row := (pv_page - 1) * pv_size + 1;
        v_end_row   := pv_page * pv_size;
    ELSE
        v_start_row := 1;
        v_end_row   := 999999999;
    END IF;

    IF v_role = 2 THEN -- Nhan vien kinh doanh
        -- THAIDT: FINY-106 05/03/2026 Dem tong so ban ghi
        SELECT COUNT(*) INTO pv_record_total
        FROM loan l, customer c, loanregistration lr, admin_user u
        WHERE l.custid = c.id AND l.regid = lr.id AND lr.saleid = u.user_id
          AND l.status = '1' AND lr.saleid = pv_userid
          AND (l.id = pv_loanid OR pv_loanid IS NULL)
          AND (c.fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL)
          AND (c.mobile LIKE '%' || pv_mobile || '%' OR pv_mobile IS NULL)
          AND (c.idnumber LIKE '%' || pv_idnumber || '%' OR pv_idnumber IS NULL)
          -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
          AND (pv_custtype IS NULL OR c.custtype = pv_custtype);

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER (ORDER BY loanid) AS stt, res.*
            FROM (
                SELECT l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                        s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                        (CASE WHEN l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 THEN 'Quá hạn' ELSE 'Trong hạn' END) loanstatus, 
                        (CASE WHEN s.duedate >= TO_DATE(TO_CHAR(SYSDATE,'dd/MM/yyyy'),'dd/MM/yyyy') AND prepaymentfeerate IS NOT NULL
                            THEN ROUND(s.prinnml*prepaymentfeerate/100,4) ELSE 0 END) prepaymentfee,
                        al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname,  
                        s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid, 
                        (CASE WHEN (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 THEN TO_DATE(TO_CHAR(SYSDATE,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate ELSE 0 END) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Tra ra gia tri custtype chuan report
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                FROM loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                WHERE l.custid = c.id AND l.regid = lr.id AND lr.saleid = u.user_id AND l.id = s.loanid AND u.branch = b.bid AND c.id = cb.custid AND b.aid = ar.aid 
                        AND l.paytype = al2.code AND al2.type = 'PAYTYPE' 
                        AND TRIM(lr.loantype) = TRIM(al4.code) AND al4.type = 'LOANTYPE' 
                        AND l.status = '1' AND lr.saleid = pv_userid
                        -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                        AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            ) res
            WHERE (loanid = pv_loanid OR pv_loanid IS NULL) AND (loanscheduleid = pv_loanscheduleid OR pv_loanscheduleid IS NULL)  
                AND (custid = pv_custid OR pv_custid IS NULL) AND (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
                AND (mobile LIKE '%' || pv_mobile || '%' OR pv_mobile IS NULL) AND (idnumber LIKE '%' || pv_idnumber || '%' OR pv_idnumber IS NULL) 
                AND (duedate >= TO_DATE(pv_lnfromdate, 'yyyyMMdd') OR pv_lnfromdate IS NULL) AND (duedate <= TO_DATE(pv_lntodate, 'yyyyMMdd') OR pv_lntodate IS NULL)
                AND (branch LIKE '%' || pv_branch || '%' OR pv_branch IS NULL) AND (paytype LIKE '%' || pv_paytype || '%' OR pv_paytype IS NULL) 
                AND (loanstatus LIKE '%' || pv_loanstatus || '%' OR pv_loanstatus IS NULL) AND (TRIM(loantype) LIKE '%' || pv_loantype || '%' OR pv_loantype IS NULL) 
                AND (salefullname LIKE '%' || pv_salefullname || '%' OR pv_salefullname IS NULL)
        )
        WHERE stt BETWEEN v_start_row AND v_end_row;

    ELSIF v_role = 5 THEN -- Truong phong giao dich
        -- THAIDT: FINY-106 05/03/2026 Dem tong so ban ghi cho role 5
        SELECT COUNT(*) INTO pv_record_total
        FROM loan l, customer c, loanregistration lr, admin_user u, branch b
        WHERE l.custid = c.id AND l.regid = lr.id AND lr.saleid = u.user_id AND u.branch = b.bid
          AND l.status = '1' AND b.bid = v_branch
          AND (pv_custtype IS NULL OR c.custtype = pv_custtype);

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER (ORDER BY loanid) AS stt, res.*
            FROM (
                SELECT l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                        s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                        (CASE WHEN l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 THEN 'Quá hạn' ELSE 'Trong hạn' END) loanstatus, 
                        (CASE WHEN s.duedate >= TO_DATE(TO_CHAR(SYSDATE,'dd/MM/yyyy'),'dd/MM/yyyy') AND prepaymentfeerate IS NOT NULL
                            THEN ROUND(s.prinnml*prepaymentfeerate/100,4) ELSE 0 END) prepaymentfee,
                        al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                        s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid, 
                        (CASE WHEN (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 THEN TO_DATE(TO_CHAR(SYSDATE,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate ELSE 0 END) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Custtype cho report
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                FROM loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                WHERE l.custid = c.id AND l.regid = lr.id AND lr.saleid = u.user_id AND l.id = s.loanid AND u.branch = b.bid AND c.id = cb.custid AND b.aid = ar.aid 
                        AND l.paytype = al2.code AND al2.type = 'PAYTYPE' 
                        AND TRIM(lr.loantype) = TRIM(al4.code) AND al4.type = 'LOANTYPE' 
                        AND l.status = '1' AND b.bid = v_branch
                        -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                        AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            ) res
            WHERE (loanid = pv_loanid OR pv_loanid IS NULL) AND (loanscheduleid = pv_loanscheduleid OR pv_loanscheduleid IS NULL)  
                AND (custid = pv_custid OR pv_custid IS NULL) AND (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
                AND (mobile LIKE '%' || pv_mobile || '%' OR pv_mobile IS NULL) AND (idnumber LIKE '%' || pv_idnumber || '%' OR pv_idnumber IS NULL) 
                AND (duedate >= TO_DATE(pv_lnfromdate, 'yyyyMMdd') OR pv_lnfromdate IS NULL) AND (duedate <= TO_DATE(pv_lntodate, 'yyyyMMdd') OR pv_lntodate IS NULL)
                AND (branch LIKE '%' || pv_branch || '%' OR pv_branch IS NULL) AND (paytype LIKE '%' || pv_paytype || '%' OR pv_paytype IS NULL) 
                AND (loanstatus LIKE '%' || pv_loanstatus || '%' OR pv_loanstatus IS NULL) AND (TRIM(loantype) LIKE '%' || pv_loantype || '%' OR pv_loantype IS NULL) 
                AND (salefullname LIKE '%' || pv_salefullname || '%' OR pv_salefullname IS NULL)
        )
        WHERE stt BETWEEN v_start_row AND v_end_row;

    ELSIF v_role IN (3, 4, 6, 7, 8, 13, 14, 18) THEN -- Van hanh, Tham dinh, CGPD, ...
        -- THAIDT: FINY-106 05/03/2026 Dem tong so ban ghi cho role admin/op
        SELECT COUNT(*) INTO pv_record_total
        FROM loan l, customer c, loanregistration lr
        WHERE l.custid = c.id AND l.regid = lr.id
          AND l.status = '1'
          AND (pv_custtype IS NULL OR c.custtype = pv_custtype);

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER (ORDER BY loanid) AS stt, res.*
            FROM (
                SELECT l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                        s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                        (CASE WHEN l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 THEN 'Quá hạn' ELSE 'Trong hạn' END) loanstatus, 
                        (CASE WHEN s.duedate >= TO_DATE(TO_CHAR(SYSDATE,'dd/MM/yyyy'),'dd/MM/yyyy') AND prepaymentfeerate IS NOT NULL
                            THEN ROUND(s.prinnml*prepaymentfeerate/100,4) ELSE 0 END) prepaymentfee,
                        al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                        s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid,  
                        (CASE WHEN (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 THEN TO_DATE(TO_CHAR(SYSDATE,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate ELSE 0 END) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Custtype cho report
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                FROM loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                WHERE l.custid = c.id AND l.regid = lr.id AND lr.saleid = u.user_id AND l.id = s.loanid AND u.branch = b.bid AND c.id = cb.custid AND b.aid = ar.aid 
                        AND l.paytype = al2.code AND al2.type = 'PAYTYPE' 
                        AND TRIM(lr.loantype) = TRIM(al4.code) AND al4.type = 'LOANTYPE' 
                        AND l.status = '1'
                        -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                        AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            ) res
            WHERE (loanid = pv_loanid OR pv_loanid IS NULL) AND (loanscheduleid = pv_loanscheduleid OR pv_loanscheduleid IS NULL)  
                AND (custid = pv_custid OR pv_custid IS NULL) AND (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
                AND (mobile LIKE '%' || pv_mobile || '%' OR pv_mobile is null) AND (idnumber LIKE '%' || pv_idnumber || '%' OR pv_idnumber IS NULL) 
                AND (duedate >= TO_DATE(pv_lnfromdate, 'yyyyMMdd') OR pv_lnfromdate IS NULL) AND (duedate <= TO_DATE(pv_lntodate, 'yyyyMMdd') OR pv_lntodate IS NULL)
                AND (branch LIKE '%' || pv_branch || '%' OR pv_branch IS NULL) AND (paytype LIKE '%' || pv_paytype || '%' OR pv_paytype IS NULL) 
                AND (loanstatus LIKE '%' || pv_loanstatus || '%' OR pv_loanstatus IS NULL) AND (TRIM(loantype) LIKE '%' || pv_loantype || '%' OR pv_loantype IS NULL) 
                AND (salefullname LIKE '%' || pv_salefullname || '%' OR pv_salefullname IS NULL)
        )
        WHERE stt BETWEEN v_start_row AND v_end_row;

    ELSE
        pv_record_total := 0;
        OPEN pv_refcursor FOR
        SELECT NULL loanid, NULL loanscheduleid, NULL custid, NULL fullname, NULL idnumber, NULL mobile, NULL lnclass, NULL duedate, NULL dueno, NULL prinnml, NULL prinovd, NULL intnml, NULL intovd, NULL assetmanagementfee, 
                NULL assetmanagementovd, NULL expertisefee, NULL expertisefeeovd, NULL feeovd, NULL total, NULL balance, NULL areaname, 
                NULL prepaymentfee, NULL paytype, NULL loanstatus, NULL loantype, NULL salefullname, NULL branch, NULL documentno, NULL ovddays, NULL stt, NULL custtype
        FROM dual;
    END IF;
END operatorloanschedule;

    
    procedure operatorTransaction(pv_refcursor in out sys_refcursor, pv_fullName varchar, pv_mobile varchar, pv_idNumber varchar, pv_branch varchar, 
                                    pv_tranName varchar, pv_tranDes varchar, pv_fromDate varchar, pv_toDate varchar, pv_userId number)
    is
        v_role number(2);
        v_branch varchar(10);
        v_area varchar(10);
        v_region varchar(10);
    begin
        begin
            select role, branch into v_role, v_branch from admin_user where user_id = pv_userId;
            select aid, rid into v_area, v_region from branch where bid = v_branch;
        exception when others then
            v_role := 0;
            v_branch := null;
            v_area := null;
            v_region := null;
        end;           
        
        if v_role = 2 then --Nhan vien kinh doanh   
            open pv_refcursor for
            select id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    (case when t.ref is not null and trandes like 'Thanh toán%' then (
                        select dueno from loanschedule where id in (select loanscheduleid from loantransaction where id = t.ref)) 
                    else null end) dueno, 
                    ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt, loanschedule ls,  
                        (select custid, saleid from loanregistration where saleid = pv_userId and id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ls.id and ls.loanid = ln.id and t.trancode <> '1' and lower(t.trandes) not like '%tất toán%' and lower(t.trandes) not like '%phí phạt trước hạn%' and t.status = '1'  
                )
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt,   
                        (select custid, saleid from loanregistration where saleid = pv_userId and id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ln.id and lower(t.trandes) like '%phí phạt trước hạn%' and t.status = '1'  
                ) 
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, null documentno, null lndate, null loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a,  
                        (select custid, saleid from loanregistration where saleid = pv_userId and id in (select max(id) from loanregistration group by custid)) r
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.trancode = '1' and t.status = '1'  
                ) 
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
--                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
--                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by id desc;
        elsif v_role = 5 then --Truong phong giao dich
            open pv_refcursor for
            select id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    (case when t.ref is not null and trandes like 'Thanh toán%' then (
                        select dueno from loanschedule where id in (select loanscheduleid from loantransaction where id = t.ref)) 
                    else null end) dueno, 
                    ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt, loanschedule ls,  
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ls.id and ls.loanid = ln.id and t.trancode <> '1' and lower(t.trandes) not like '%tất toán%' and lower(t.trandes) not like '%phí phạt trước hạn%' and t.status = '1' and b.bid = v_branch 
                ) 
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt,   
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ln.id and lower(t.trandes) like '%phí phạt trước hạn%' and t.status = '1' and b.bid = v_branch  
                )
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, null documentno, null lndate, null loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a,  
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.trancode = '1' and t.status = '1' and b.bid = v_branch 
                ) 
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
--                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
--                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by id desc;
        elsif v_role in (3,4,6,7,8,11,12,13,18) then --Van hanh, Tham dinh, CGPD, TP Nhan su, THN
            open pv_refcursor for
            select id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    (case when t.ref is not null and trandes like 'Thanh toán%' then (
                        select dueno from loanschedule where id in (select loanscheduleid from loantransaction where id = t.ref)) 
                    else null end) dueno, 
                    ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt, loanschedule ls,  
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ls.id and ls.loanid = ln.id and t.trancode <> '1' and lower(t.trandes) not like '%tất toán%' and lower(t.trandes) not like '%phí phạt trước hạn%' and t.status = '1'  
                ) 
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, ln.documentno, ln.lndate, ln.loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt,   
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                        (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.ref = lt.id and lt.loanscheduleid = ln.id and lower(t.trandes) like '%phí phạt trước hạn%' and t.status = '1'  
                )
                union all
                select distinct id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype from (
                    select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                    null dueno, null documentno, null lndate, null loantype
                    from customer c, admin_user u, branch b, transaction t, allcode a,  
                        (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r
                    where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                        and t.trancode = '1' and t.status = '1'  
                ) 
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
--                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
--                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by id desc;
        end if;
    end;
    
    procedure operatorEstPayment(pv_refcursor in out sys_refcursor, pv_fullName varchar, pv_mobile varchar, pv_idNumber varchar, pv_branch varchar,  
                                    pv_userId number, pv_documentNo varchar, pv_fromDate varchar, pv_toDate varchar)
    is
        v_role number(2);
        v_branch varchar(10);
        v_area varchar(10);
        v_region varchar(10);
        v_currDate date;
    begin
        begin
            select role, branch into v_role, v_branch from admin_user where user_id = pv_userId;
            select aid, rid into v_area, v_region from branch where bid = v_branch;
        exception when others then
            v_role := 0;
            v_branch := null;
            v_area := null;
            v_region := null;
        end;
        
        select dateval into v_currDate from businessdate where datetype = 'CURRDATE';
            
        if v_role = 2 then --Nhan vien kinh doanh
            open pv_refcursor for
            select loanscheduleid, fullname, mobile, idnumber, documentno, duedate,          
                (case when duedate < v_currDate then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
                        loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, user_id
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint, 
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass 
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1)
                    and r.saleid = pv_userId 
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, --ls.estint, 
--                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
--                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
--                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee, 
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate and (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate and (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass 
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                or ((ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5')
                                                    and h.businessdate = to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1' and r.saleid = pv_userId
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
--            order by duedate, branch, sale
            ;
                
        elsif v_role = 5 then --Truong phong giao dich
            open pv_refcursor for
            select loanscheduleid, fullname, mobile, idnumber, documentno, duedate,           
                (case when duedate < v_currDate then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
                        loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, user_id
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint, 
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.bid = v_branch  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, --ls.estint, 
--                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
--                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
--                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee, 
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate and (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate and (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                or ((ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5')
                                                    and h.businessdate = to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1' and b.bid = v_branch
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
--            order by duedate, branch, sale
            ;
                
        elsif v_role = 9 then --Giam doc khu vuc
            open pv_refcursor for
            select loanscheduleid, fullname, mobile, idnumber, documentno, duedate,           
                (case when duedate < v_currDate then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
                        loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, user_id
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint, 
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass 
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.aid = v_area   
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, --ls.estint, 
--                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
--                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
--                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee, 
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate and (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate and (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass 
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                or ((ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5')
                                                    and h.businessdate = to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1' and b.aid = v_area 
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
--            order by duedate, branch, sale
            ;
                
        elsif v_role = 10 then --Giam doc vung
            open pv_refcursor for
            select loanscheduleid, fullname, mobile, idnumber, documentno, duedate,           
                (case when duedate < v_currDate then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
                        loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, user_id 
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint, 
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.rid = v_region  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, --ls.estint, 
--                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
--                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
--                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee, 
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate and (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate and (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                or ((ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5')
                                                    and h.businessdate = to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1' and b.rid = v_region
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
--            order by duedate, branch, sale
            ;
                
        elsif v_role in (3,4,6,7,8,13,14,18) then --Van hanh, Tham dinh, CGPD, TP Nhan su
            open pv_refcursor for
            select loanscheduleid, fullname, mobile, idnumber, documentno, duedate,           
                (case when duedate < v_currDate then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
                        loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, user_id 
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint, 
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1' 
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1)  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,  --ls.estint, 
--                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
--                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
--                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee, 
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate and (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate and (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate and (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then 
                        (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass  
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 1
                                                or (ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5'
                                                    and h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1'
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (branch like '%' || pv_branch || '%' or pv_branch is null) 
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
--            order by duedate, branch, sale
            ;
        else
            open pv_refcursor for
            select null loanscheduleid, null fullname, null mobile, null idnumber, null documentno, null duedate, 0 prinnml, 0 estint, 0 estprin, 0 dueno, null sale, 
                null branch, 0 estint, 0 estassetfee, 0 estexpertisefee, null loantype, null term, null lndate, null rate, null feerate, null expertisefeerate, null lnclass, null user_id from dual;
        end if;
    end;
    
   PROCEDURE outstandingloan (
    pv_refcursor IN OUT SYS_REFCURSOR,
        pv_userId NUMBER,
        pv_fullName VARCHAR,
        pv_branch VARCHAR,
        pv_fromDate VARCHAR,
        pv_toDate VARCHAR,
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
    pv_page            NUMBER,
    pv_size            NUMBER,
    pv_custtype        VARCHAR2,
    pv_record_total    OUT NUMBER
) IS
    v_role      NUMBER(2);
    v_branch    VARCHAR(10);
    v_area      VARCHAR(10);
    v_region    VARCHAR(10);
    -- THAIDT: FINY-106 05/03/2026 Khai bao bien phan trang
    v_start_row NUMBER;
    v_end_row   NUMBER;
BEGIN
    -- 1. Lay thong tin User
    BEGIN
        SELECT role, branch INTO v_role, v_branch FROM admin_user WHERE user_id = pv_userId;
        SELECT aid, rid INTO v_area, v_region FROM branch WHERE bid = v_branch;
    EXCEPTION WHEN OTHERS THEN
        v_role := 0; v_branch := NULL; v_area := NULL; v_region := NULL;
    END;

    -- 2. THAIDT: FINY-106 05/03/2026 Tinh toan phan trang
    IF pv_page IS NOT NULL AND pv_size IS NOT NULL THEN
        v_start_row := (pv_page - 1) * pv_size + 1;
        v_end_row   := pv_page * pv_size;
    ELSE
        v_start_row := 1; v_end_row := 999999999;
    END IF;

    -- CASE ROLE 2: NHAN VIEN KINH DOANH
    IF v_role = 2 THEN
        -- THAIDT: FINY-106 05/03/2026 Dem tong record 
        SELECT COUNT(*) INTO pv_record_total 
        FROM (
            SELECT u.user_id, h.businessdate, TRIM(h.lnclass) as ln_grp, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as c_type
            FROM loanhist h, loan l, loanregistration r, admin_user u, customer c
            WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND l.custid = c.id
              AND u.user_id = pv_userid
              AND (u.full_name LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL)
              AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
              AND (h.businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL)
              AND (h.businessdate <= TO_DATE(pv_todate, 'yyyyMMdd') OR pv_todate IS NULL)
            GROUP BY u.user_id, h.businessdate, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
        );

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY businessdate DESC, fullname ASC) AS stt, 
                   fullname, branch, prinnml, businessdate, user_id, custtype
            FROM (
                SELECT u.full_name fullname, b.name branch, SUM(h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id,
                       (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as custtype
                FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
                WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
                  AND u.user_id = pv_userid
                GROUP BY u.full_name, b.name, h.businessdate, u.user_id, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
            ) res
            WHERE (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
              AND (branch LIKE '%' || pv_branch || '%' OR pv_branch IS NULL)
              AND (businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL) 
              AND (businessdate <= TO_DATE(pv_todate, 'yyyyMMdd') OR pv_todate IS NULL)
              AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt BETWEEN v_start_row AND v_end_row;

    -- CASE ROLE 5: TRUONG PHONG GIAO DICH
    ELSIF v_role = 5 THEN
        SELECT COUNT(*) INTO pv_record_total 
        FROM (
            SELECT u.user_id, h.businessdate, TRIM(h.lnclass) as ln_grp, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as c_type
            FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
            WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
              AND b.bid = v_branch
              AND (u.full_name LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL)
              AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            GROUP BY u.user_id, h.businessdate, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
        );

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY businessdate DESC, fullname ASC) AS stt, 
                   fullname, branch, prinnml, businessdate, user_id,  custtype
            FROM (
                SELECT u.full_name fullname, b.name branch, SUM(h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id,
                       (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as custtype
                FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
                WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
                  AND b.bid = v_branch
                GROUP BY u.full_name, b.name, h.businessdate, u.user_id,  (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
            ) res
            WHERE (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
              AND (businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL) 
              AND (businessdate <= TO_DATE(pv_todate, 'yyyyMMdd') OR pv_todate IS NULL)
              AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt BETWEEN v_start_row AND v_end_row;

    -- CASE ROLE 9: GIAM DOC KHU VUC
    ELSIF v_role = 9 THEN
        SELECT COUNT(*) INTO pv_record_total 
        FROM (
            SELECT u.user_id, h.businessdate, TRIM(h.lnclass) as ln_grp, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as c_type
            FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
            WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
              AND b.aid = v_area
              AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            GROUP BY u.user_id, h.businessdate,  (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
        );

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY businessdate DESC, fullname ASC) AS stt, 
                   fullname, branch, prinnml, businessdate, user_id, custtype
            FROM (
                SELECT u.full_name fullname, b.name branch, SUM(h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id, 
                       (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as custtype
                FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
                WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
                  AND b.aid = v_area
                GROUP BY u.full_name, b.name, h.businessdate, u.user_id, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
            ) res
            WHERE (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
              AND (businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL) 
              AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt BETWEEN v_start_row AND v_end_row;

    -- CASE ROLE 10: GIAM DOC VUNG
    ELSIF v_role = 10 THEN
        SELECT COUNT(*) INTO pv_record_total 
        FROM (
            SELECT u.user_id, h.businessdate, TRIM(h.lnclass) as ln_grp, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as c_type
            FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
            WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
              AND b.rid = v_region
              AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            GROUP BY u.user_id, h.businessdate,  (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
        );

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY businessdate DESC, fullname ASC) AS stt, 
                   fullname, branch, prinnml, businessdate, user_id,  custtype
            FROM (
                SELECT u.full_name fullname, b.name branch, SUM(h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id,
                       (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as custtype
                FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
                WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
                  AND b.rid = v_region
                GROUP BY u.full_name, b.name, h.businessdate, u.user_id, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
            ) res
            WHERE (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
              AND (businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL) 
              AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt BETWEEN v_start_row AND v_end_row;

    -- CASE ROLE ADMIN / VAN HANH
    ELSIF v_role IN (3, 4, 6, 7, 8, 13, 14, 18) THEN
        SELECT COUNT(*) INTO pv_record_total 
        FROM (
            SELECT u.user_id, h.businessdate, TRIM(h.lnclass) as ln_grp, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as c_type
            FROM loanhist h, loan l, loanregistration r, admin_user u, customer c
            WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND l.custid = c.id
              AND (u.full_name LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL)
              AND (pv_custtype IS NULL OR c.custtype = pv_custtype)
            GROUP BY u.user_id, h.businessdate, TRIM(h.lnclass), (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
        );

        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY businessdate DESC, fullname ASC) AS stt, 
                   fullname, branch, prinnml, businessdate, user_id,  custtype
            FROM (
                SELECT u.full_name fullname, b.name branch, SUM(h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id, 
                       (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) as custtype
                FROM loanhist h, loan l, loanregistration r, admin_user u, branch b, customer c
                WHERE h.loanid = l.id AND l.regid = r.id AND r.saleid = u.user_id AND u.branch = b.bid AND l.custid = c.id
                GROUP BY u.full_name, b.name, h.businessdate, u.user_id, (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END)
            ) res
            WHERE (fullname LIKE '%' || pv_fullname || '%' OR pv_fullname IS NULL) 
              AND (businessdate >= TO_DATE(pv_fromdate, 'yyyyMMdd') OR pv_fromdate IS NULL) 
              AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt BETWEEN v_start_row AND v_end_row;

    ELSE
        pv_record_total := 0;
        OPEN pv_refcursor FOR
        SELECT NULL userid, NULL fullname, NULL branch, NULL prinnml, NULL businessdate, NULL user_id, NULL lnclass, NULL stt, NULL custtype
        FROM dual;
    END IF;
END outstandingloan;

    
PROCEDURE debtovdmanagement (
    pv_refcursor   IN OUT SYS_REFCURSOR,
    pv_documentno  VARCHAR,
    pv_fullname    VARCHAR,
    pv_mobile      VARCHAR,
    pv_idnumber    VARCHAR,
    pv_branch      VARCHAR,
    pv_sale        VARCHAR,
    pv_lnclass     VARCHAR,
    pv_fromdate    VARCHAR,
    pv_todate      VARCHAR,
    pv_userid      NUMBER,
    -- THAIDT: FINY-106 05/03/2026 Them moi tham so phan trang va custtype
    pv_page            NUMBER,
    pv_size            NUMBER,
    pv_custtype        VARCHAR2,
    pv_record_total    OUT NUMBER
) IS
    v_role   NUMBER(2);
    v_branch VARCHAR(10);
    v_area   VARCHAR(10);
    v_region VARCHAR(10);
    -- THAIDT: FINY-106 05/03/2026 Khai bao bien phan trang
    v_start_row NUMBER;
    v_end_row   NUMBER;
BEGIN
    BEGIN
        SELECT role, branch INTO v_role, v_branch FROM admin_user WHERE user_id = pv_userid;
        SELECT aid, rid INTO v_area, v_region FROM branch WHERE bid = v_branch;
    EXCEPTION WHEN OTHERS THEN
        v_role := 0;
    END;

    -- THAIDT: FINY-106 05/03/2026 Tinh toan phan trang
    IF pv_page IS NOT NULL AND pv_size IS NOT NULL THEN
        v_start_row := (pv_page - 1) * pv_size + 1;
        v_end_row   := pv_page * pv_size;
    ELSE
        v_start_row := 1; v_end_row := 999999999;
    END IF;

    IF v_role = 12 THEN
        -- THAIDT: FINY-106 05/03/2026 Them menh de COUNT de tinh tong record
        SELECT COUNT(*) INTO pv_record_total FROM (
            SELECT l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                     -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                     fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                     fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                    l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                    (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                    (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                    l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                    (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userid) debtrecoveryid, 
                    (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userid) debtrecoveryname, 
                    fn_cal_loan_ovddays(l.id) ovddays,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u, debt_recovery d 
           -- ThaiDT - FINY-82  Date 29/12/2025 - thêm (+) de thanh LEFT JOIN
            where l.custid = c.id and c.wardid(+) = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id(+) and c.residencewardid = w2.id(+) and c.residencedistrictid = d2.id(+) and l.id(+) = d.loanid 
                    and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                    and l.status = '1'  
                    --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
        ) WHERE (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                AND (pv_custtype IS NULL OR custtype = pv_custtype);

        -- THAIDT: FINY-106 05/03/2026 Them phan trang
        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY lid DESC) AS stt_row,
                   lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress,
                   amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, total, prepaymentfee,
                   productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid, custtype
            FROM (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                         -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                         fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                         fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userid) debtrecoveryid, 
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userid) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u, debt_recovery d 
               -- ThaiDT - FINY-82  Date 29/12/2025 - thêm (+) de thanh LEFT JOIN
                where l.custid = c.id and c.wardid(+) = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id(+) and c.residencewardid = w2.id(+) and c.residencedistrictid = d2.id(+) and l.id(+) = d.loanid 
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                        and l.status = '1'  
                        --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                    and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                    -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                    AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt_row BETWEEN v_start_row AND v_end_row;

    ELSIF v_role = 5 THEN
        -- THAIDT: FINY-106 05/03/2026 Them menh de COUNT de tinh tong record
        SELECT COUNT(*) INTO pv_record_total FROM (
            select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                    l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                    (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                    (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                    l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                    (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                    (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                    fn_cal_loan_ovddays(l.id) ovddays,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
            where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                    and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.bid = v_branch 
                    and l.status = '1' 
                    --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
        ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                AND (pv_custtype IS NULL OR custtype = pv_custtype);

        -- THAIDT: FINY-106 05/03/2026 Them phan trang
        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY lid DESC) AS stt_row,
                   lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress,
                   amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, total, prepaymentfee,
                   productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid, custtype
            FROM (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
                where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.bid = v_branch 
                        and l.status = '1' 
                        --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                    and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                    -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                    AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt_row BETWEEN v_start_row AND v_end_row;

    ELSIF v_role = 9 THEN
        -- THAIDT: FINY-106 05/03/2026 Them menh de COUNT de tinh tong record
        SELECT COUNT(*) INTO pv_record_total FROM (
            select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                    l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                    (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                    (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                    l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                    (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                    (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                    fn_cal_loan_ovddays(l.id) ovddays,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
            where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                    and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.aid = v_area 
                    and l.status = '1' 
                    --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
        ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                AND (pv_custtype IS NULL OR custtype = pv_custtype);

        -- THAIDT: FINY-106 05/03/2026 Them phan trang
        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY lid DESC) AS stt_row,
                   lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress,
                   amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, total, prepaymentfee,
                   productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid, custtype
            FROM (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
               where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.aid = v_area 
                        and l.status = '1' 
                        --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                    and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                    -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                    AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt_row BETWEEN v_start_row AND v_end_row;

    ELSIF v_role = 10 THEN
        -- THAIDT: FINY-106 05/03/2026 Them menh de COUNT de tinh tong record
        SELECT COUNT(*) INTO pv_record_total FROM (
            select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                    l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                    (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                    (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                    l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                    (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                    (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                    fn_cal_loan_ovddays(l.id) ovddays,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
            where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                    and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.rid = v_region 
                    and l.status = '1' 
                    --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
        ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                AND (pv_custtype IS NULL OR custtype = pv_custtype);

        -- THAIDT: FINY-106 05/03/2026 Them phan trang
        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY lid DESC) AS stt_row,
                   lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress,
                   amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, total, prepaymentfee,
                   productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid, custtype
            FROM (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid, 
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
                 where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid and b.rid = v_region 
                        and l.status = '1' 
                        --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                    and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                    -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                    AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt_row BETWEEN v_start_row AND v_end_row;

    ELSIF v_role IN (3,4,6,7,8,11,13,14,18) THEN
        -- THAIDT: FINY-106 05/03/2026 Them menh de COUNT de tinh tong record
        SELECT COUNT(*) INTO pv_record_total FROM (
            select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                    l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                    (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                    (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                    l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                    (select max(d.adminuserid) from debt_recovery d where d.loanid = l.id) debtrecoveryid, 
                    (select max(u2.full_name) from admin_user u2, debt_recovery d where u2.user_id = d.adminuserid and d.loanid = l.id) debtrecoveryname, 
                    fn_cal_loan_ovddays(l.id) ovddays,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
             where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                    and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                    and l.status = '1' 
                    --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
        ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                AND (pv_custtype IS NULL OR custtype = pv_custtype);

        -- THAIDT: FINY-106 05/03/2026 Them phan trang
        OPEN pv_refcursor FOR
        SELECT * FROM (
            SELECT ROW_NUMBER() OVER(ORDER BY lid DESC) AS stt_row,
                   lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress,
                   amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, total, prepaymentfee,
                   productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid, custtype
            FROM (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname) residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select max(d.adminuserid) from debt_recovery d  where d.loanid = l.id) debtrecoveryid, 
                        (select max(u2.full_name) from admin_user u2, debt_recovery d where u2.user_id = d.adminuserid and d.loanid = l.id) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays,
                        -- THAIDT: FINY-106 05/03/2026 Them custtype vao select
                        (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
                 where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                        and l.status = '1' 
                        --and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullname || '%' or pv_fullname is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idnumber || '%' or pv_idnumber is null) and (documentno like '%' || pv_documentno || '%' or pv_documentno is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnclass || '%' or pv_lnclass is null)
                    and (lndate >= to_date(pv_fromdate, 'yyyyMMdd') or pv_fromdate is null) and (lndate <= to_date(pv_todate, 'yyyyMMdd') or pv_todate is null)
                    -- THAIDT: FINY-106 05/03/2026 Filter theo custtype
                    AND (pv_custtype IS NULL OR custtype = pv_custtype)
        ) WHERE stt_row BETWEEN v_start_row AND v_end_row;

    ELSE
        pv_record_total := 0;
        OPEN pv_refcursor FOR
        SELECT NULL lid, NULL documentno, NULL custid, NULL fullname, NULL mobile, NULL idnumber, NULL lndate, NULL term, NULL address, NULL residenceaddress, 0 amount, 
                NULL lnclass, 0 prinnml, 0 prinovd, 0 intnml, 0 intovd, 0 feeovd, 0 total, 0 prepaymentfee, NULL productname, NULL branchname, NULL salename, NULL debtrecoveryname, NULL user_id, NULL debtrecoveryid, NULL custtype FROM DUAL;
    END IF;
END debtovdmanagement;

    
    PROCEDURE init_table_tmp_report_provision
    IS
        v_count number;
    BEGIN

        v_count := 0;
        SELECT COUNT(*)
        INTO v_count
        FROM USER_TABLES
        WHERE TABLE_NAME = UPPER('TMP_REPORT_PROVISION');

        IF v_count > 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE TMP_REPORT_PROVISION';
        END IF;

        EXECUTE IMMEDIATE '
            CREATE TABLE TMP_REPORT_PROVISION AS
            SELECT
                to_char(SYSTIMESTAMP + INTERVAL ''7'' HOUR, ''dd/MM/yyyy hh24:mi:ss'') as created_time,
                c.id as custid,
                r.name as kv,
                /*a.name as kv_detail,*/
                b.name as pgd,
                /*b.full_address as pgd_detail,*/
                upper(c.fullname) as ten_kh,
                ac.name as sp_vay,
                l.documentno as so_hd,
                l.amount as so_tien_vay,
                l.term as ky_han_vay,
                to_char(l.lndate, ''dd/MM/yyyy hh24:mi:ss'') as ngay_giai_ngan,
                to_char(add_months(l.lndate, l.term), ''dd/MM/yyyy hh24:mi:ss'') as ngay_dao_han,
                (l.prinnml + l.prinovd) as du_no,
                fn_cal_lnclass(lrt.custid) as nhom_no,
                fn_cal_ovddays(lrt.custid) as ngay_cham_tra,
                fn_cal_provision(fn_cal_lnclass(lrt.custid)) as trich_lap,
                (fn_cal_provision(fn_cal_lnclass(lrt.custid)) * (l.prinnml + l.prinovd))/100 as so_tien_trich_lap

            FROM customer c, loanregistration lrt, loan l, allcode ac, admin_user au, branch b, area a, region r
            WHERE
                    c.id = lrt.custid
                and lrt.id = l.regid
                and to_number(lrt.loantype) = to_number(ac.code) and ac.type = ''LOANTYPE''
                and lrt.saleid = au.user_id
                and au.branch = b.bid
                and b.aid = a.aid
                and a.rid = r.rid

            ORDER BY c.id
        ';

        v_count := 0;
        SELECT count(index_name) INTO v_count
        FROM user_indexes
        WHERE table_name = 'TMP_REPORT_PROVISION';

        IF v_count = 0 THEN
            EXECUTE IMMEDIATE 'CREATE INDEX idx_trp_custid ON TMP_REPORT_PROVISION (custid)';
        END IF;

        COMMIT;
    END init_table_tmp_report_provision;
    
    PROCEDURE search_table_tmp_report_provision(pio_sql IN OUT varchar2,
                                                pio_rec_total IN OUT number,
                                                p_from_date IN varchar2,
                                                p_to_date IN varchar2,
                                                p_mien IN varchar2,
                                                p_pgd IN varchar2,
                                                p_ten_kh IN varchar2,
                                                p_sp_vay IN varchar2,
                                                p_so_hd IN varchar2,
                                                p_ky_han_vay IN varchar2,
                                                p_sort_type IN varchar2,
                                                p_sort_name IN varchar2,
                                                p_page IN varchar2,
                                                p_size IN varchar2
                                                )
    IS
        v_sql varchar2(1000);
        v_sql_res varchar2(1000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(1000);
    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY custid) AS stt, trp.* FROM tmp_report_provision trp WHERE 1=1';

        IF (p_from_date IS NOT NULL OR p_from_date <> '') AND (p_to_date IS NOT NULL OR p_to_date <> '') THEN
            v_sql := v_sql || ' AND to_date(trp.ngay_giai_ngan, ''dd/MM/yyyy hh24:mi:ss'') BETWEEN to_date('''|| p_from_date ||''', ''dd/MM/yyyy'') AND to_date('''|| p_to_date ||''', ''dd/MM/yyyy'')';
        END IF;

        IF (p_mien IS NOT NULL OR p_mien <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.kv)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_mien))) || '%''';
        END IF;

        IF (p_pgd IS NOT NULL OR p_pgd <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.pgd)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_pgd))) || '%''';
        END IF;

        IF (p_ten_kh IS NOT NULL OR p_ten_kh <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.ten_kh)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_ten_kh))) || '%''';
        END IF;

        IF (p_sp_vay IS NOT NULL OR p_sp_vay <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.sp_vay)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_sp_vay))) || '%''';
        END IF;

        IF (p_so_hd IS NOT NULL OR p_so_hd <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.so_hd)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_so_hd))) || '%''';
        END IF;

        IF (p_ky_han_vay IS NOT NULL OR p_ky_han_vay <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.ky_han_vay)) = ' || trim(upper(CONVERTTOUNSIGN(p_ky_han_vay)));
        END IF;

        --------------------------------------

        IF p_page <> 0 AND p_size <> 0 THEN
            v_A := (1 + (p_page * p_size) - p_size);
            v_B := (p_page * p_size);
            v_sql_res := 'SELECT * FROM (' || v_sql || ') WHERE stt BETWEEN '|| v_A ||' AND '|| v_B;
        END IF;

        IF p_page = 0 AND p_size = 0 THEN
            v_sql_res := v_sql;
        END IF;

        IF (p_sort_type IS NOT NULL OR p_sort_type <> '') AND (p_sort_name IS NOT NULL OR p_sort_name <> '') THEN
            v_sql_res := v_sql_res || ' ORDER BY ' || trim(upper(p_sort_name)) || ' ' || trim(upper(p_sort_type));
        END IF;


        --pck_logs.insertLog('SQL_DEBUG', v_sql_res, 'PKG: PCK_REPORT.search_table_tmp_report_provision');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';
        EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

    END search_table_tmp_report_provision;
    
    PROCEDURE report_provision (
                                p_refcursor in out sys_refcursor,
                                p_record_total in out number,
                                p_from_date varchar2,
                                p_to_date varchar2,
                                p_mien varchar2,
                                p_pgd varchar2,
                                p_ten_kh varchar2,
                                p_sp_vay varchar2,
                                p_so_hd varchar2,
                                p_ky_han_vay varchar2,
                                p_sort_type varchar2,
                                p_sort_name varchar2,
                                p_page varchar2,
                                p_size varchar2,
                                p_mod varchar2,
                                p_userId varchar2
    )
    IS
        v_except  EXCEPTION;
        v_errcode varchar2(10);
        v_errmsg  varchar2(200);
        v_date    date;
        vio_sql varchar2(1000);
        vio_rec_total number;
        v_count number;

    BEGIN

        IF (
            (trim(upper(p_mod)) = 'SEARCH' OR trim(upper(p_mod)) = 'INIT')
            AND
            ((p_page IS NULL OR p_page = '') OR (p_size IS NULL OR p_size = ''))
        ) THEN
            v_errcode := '01';
            v_errmsg := 'page và size là bắt buộc';
            raise v_except;
        END IF;

        IF (
            (REGEXP_LIKE(p_page, '^[0-9]$')) AND (REGEXP_LIKE(p_size, '^[0-9]$'))
            AND
            (to_number(p_size) < 0) AND (to_number(p_size) > 100)
        ) THEN
            v_errcode := '02';
            v_errmsg := 'page và size phải là số và 0 < size <= 100';
            raise v_except;
        END IF;

        IF (p_mod IS NULL OR p_mod = '') THEN
            v_errcode := '03';
            v_errmsg := 'trường mod là bắt buộc';
            raise v_except;
        END IF;

        IF (
            (p_from_date IS NULL OR p_from_date = '') AND (p_to_date IS NOT NULL OR p_to_date <> '')
            OR
            (p_from_date IS NOT NULL OR p_from_date <> '') AND (p_to_date IS NULL OR p_to_date = '')
        ) THEN
            v_errcode := '04';
            v_errmsg := 'from_date và to_date là bắt buộc';
            raise v_except;
        END IF;

        IF (
            (p_sort_type IS NULL OR p_sort_type = '') AND (p_sort_name IS NOT NULL OR p_sort_name <> '')
            OR
            (p_sort_type IS NOT NULL OR p_sort_type <> '') AND (p_sort_name IS NULL OR p_sort_name = '')
        ) THEN
            v_errcode := '05';
            v_errmsg := 'sort_name và sort_type là bắt buộc';
            raise v_except;
        END IF;

        IF (
            (p_sort_type IS NOT NULL OR p_sort_type <> '')
            AND
            (trim(upper(p_sort_type)) NOT IN ('ASC', 'DESC'))
        ) THEN
            v_errcode := '06';
            v_errmsg := 'sort_type phải là ASC hoặc DESC';
            raise v_except;
        END IF;

        IF (
            (p_sort_name IS NOT NULL OR p_sort_name <> '')
            AND
            (trim(lower(p_sort_name)) NOT IN
            ('created_time', 'custid', 'kv', 'pgd', 'ten_kh', 'sp_vay', 'so_hd', 'so_tien_vay', 'ky_han_vay', 'ngay_giai_ngan', 'ngay_dao_han', 'du_no', 'nhom_no', 'ngay_cham_tra', 'trich_lap', 'so_tien_trich_lap'))
        ) THEN
            v_errcode := '07';
            v_errmsg := 'sort_name = '|| p_sort_name ||' là không đúng';
            raise v_except;
        END IF;

        IF (p_from_date IS NOT NULL OR p_from_date <> '') AND (NOT REGEXP_LIKE(p_from_date, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '08';
            v_errmsg := 'from_date không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;

        IF (REGEXP_LIKE(p_from_date, '^\d{2}/\d{2}/\d{4}$')) THEN
            BEGIN
                v_date := TO_DATE(p_from_date, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '09';
                v_errmsg := 'from_date không hợp lệ';
                raise v_except;
            END;
        END IF;

        IF (p_to_date IS NOT NULL OR p_to_date <> '') AND (NOT REGEXP_LIKE(p_to_date, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '10';
            v_errmsg := 'to_date không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;

        IF (REGEXP_LIKE(p_to_date, '^\d{2}/\d{2}/\d{4}$')) THEN
            BEGIN
                v_date := TO_DATE(p_to_date, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '11';
                v_errmsg := 'to_date không hợp lệ';
                raise v_except;
            END;
        END IF;

    ---------------
    IF trim(upper(p_mod)) = 'REFRESH' OR trim(upper(p_mod)) = 'INIT' THEN
        init_table_tmp_report_provision();
        search_table_tmp_report_provision(  vio_sql,
                                            vio_rec_total,
                                            p_from_date,
                                            p_to_date,
                                            p_mien,
                                            p_pgd,
                                            p_ten_kh,
                                            p_sp_vay,
                                            p_so_hd,
                                            p_ky_han_vay,
                                            p_sort_type,
                                            p_sort_name,
                                            p_page,
                                            p_size);

    ELSIF trim(upper(p_mod)) = 'SEARCH' THEN
        v_count := 0;
        SELECT COUNT(*)
        INTO v_count
        FROM USER_TABLES
        WHERE TABLE_NAME = UPPER('TMP_REPORT_PROVISION');

        IF v_count = 0 THEN
            v_errcode := '12';
            v_errmsg := 'Bảng không có dữ liệu. Nhập mod = INIT hoặc mod = REFRESH';
            raise v_except;
        ELSE
            search_table_tmp_report_provision(  vio_sql,
                                                vio_rec_total,
                                                p_from_date,
                                                p_to_date,
                                                p_mien,
                                                p_pgd,
                                                p_ten_kh,
                                                p_sp_vay,
                                                p_so_hd,
                                                p_ky_han_vay,
                                                p_sort_type,
                                                p_sort_name,
                                                p_page,
                                                p_size);
        END IF;

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN
        v_count := 0;
        SELECT COUNT(*)
        INTO v_count
        FROM USER_TABLES
        WHERE TABLE_NAME = UPPER('TMP_REPORT_PROVISION');

        IF v_count = 0 THEN
            v_errcode := '12';
            v_errmsg := 'Bảng không có dữ liệu. Nhập mod = INIT hoặc mod = REFRESH';
            raise v_except;
        ELSE
            search_table_tmp_report_provision(  vio_sql,
                                                vio_rec_total,
                                                p_from_date,
                                                p_to_date,
                                                p_mien,
                                                p_pgd,
                                                p_ten_kh,
                                                p_sp_vay,
                                                p_so_hd,
                                                p_ky_han_vay,
                                                p_sort_type,
                                                p_sort_name,
                                                0,
                                                0);
        END IF;

    ELSE
        v_errcode := '13';
        v_errmsg := 'trường mod không đúng (truyền init hoặc search)';
        raise v_except;
    END IF;
    -- Mở con trỏ động với giá trị tổng số bản ghi theo filter được tạo ra
    p_record_total := 0;
    p_record_total := vio_rec_total;
    -- Mở con trỏ động với câu truy vấn được tạo ra
    OPEN p_refcursor FOR vio_sql;

    EXCEPTION when v_except then
        p_record_total := 0;
        open p_refcursor for
        select v_errcode as v_code, v_errmsg as v_desc from dual;
    END report_provision;
    
    PROCEDURE init_table_tmp_report_provision_v2 (p_batch_date date) IS

        v_count                        number;
        v_nhom_no_prev                 varchar2(5);
        v_batch_date_prev              date;
        v_goc_con_lai_prev             number;
        v_trich_lap_prev               number;
        v_so_tien_trich_lap_prev       number;
        v_tong_trich_lap_cong_don_prev number;
        v_hoan_nhap_prev               number;
        v_tong_hoan_nhap_prev          number;
        v_thu_nhap_bat_thuong_prev     number;
        v_businessdate                 date;

    BEGIN

        v_businessdate := p_batch_date;
        DBMS_OUTPUT.PUT_LINE('v_businessdate: ' || v_businessdate);

        v_count := 0;
        SELECT count(*) into v_count
        FROM
            customer c
            JOIN loanregistration lrt ON c.id = lrt.custid
            JOIN loan l ON lrt.id = l.regid
            JOIN loanhist lh ON l.id = lh.loanid
            JOIN allcode ac ON TO_NUMBER(lrt.loantype) = TO_NUMBER(ac.code) AND ac.type = 'LOANTYPE'
            JOIN admin_user au ON lrt.saleid = au.user_id
            JOIN branch b ON au.branch = b.bid
            JOIN area a ON b.aid = a.aid
            JOIN region r ON a.rid = r.rid
        WHERE
            --UPPER(c.fullname) = 'LÊ VĂN BÌNH'
            --AND lh.loanid = 2797
            TRUNC(lh.businessdate, 'MM') = TRUNC(v_businessdate, 'MM')
            AND lh.businessdate = (
                SELECT MAX(lh2.businessdate)
                FROM loanhist lh2
                WHERE lh2.loanid = lh.loanid
                  AND TRUNC(lh2.businessdate, 'MM') = TRUNC(v_businessdate, 'MM')
            )
        ORDER BY c.id, lh.loanid, lh.businessdate;

        IF v_count = 0 THEN
            pkg_jobs.updateJob('PROVISION', 'D', 'bc trích lập dự phòng');

        ELSE
            FOR rec IN (
                SELECT
                    UPPER(c.fullname) AS ten_kh,
                    l.documentno AS so_hd,
                    b.bid,
                    b.name AS pgd,
                    c.id AS custid,
                    lh.loanid,
                    v_businessdate AS batch_date,
                    lh.businessdate,
                    TRIM(fn_cal_lnclass_by_date(c.id, v_businessdate)) AS nhom_no,
                    l.amount as goc_ban_dau,
                    (lh.prinnml + lh.prinovd) as goc_con_lai,
                    fn_cal_provision(TRIM(fn_cal_lnclass_by_date(c.id, v_businessdate))) AS trich_lap,
                    -- THAIDT: FINY-106 06/03/2026 Them custtype vao cursor
                    (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                FROM
                    customer c
                    JOIN loanregistration lrt ON c.id = lrt.custid
                    JOIN loan l ON lrt.id = l.regid
                    JOIN loanhist lh ON l.id = lh.loanid
                    JOIN allcode ac ON TO_NUMBER(lrt.loantype) = TO_NUMBER(ac.code) AND ac.type = 'LOANTYPE'
                    JOIN admin_user au ON lrt.saleid = au.user_id
                    JOIN branch b ON au.branch = b.bid
                    JOIN area a ON b.aid = a.aid
                    JOIN region r ON a.rid = r.rid
                WHERE
                    --UPPER(c.fullname) = 'LÊ VĂN BÌNH'
                    --AND lh.loanid = 2797
                    TRUNC(lh.businessdate, 'MM') = TRUNC(v_businessdate, 'MM')
                    AND lh.businessdate = (
                        SELECT MAX(lh2.businessdate)
                        FROM loanhist lh2
                        WHERE lh2.loanid = lh.loanid
                          AND TRUNC(lh2.businessdate, 'MM') = TRUNC(v_businessdate, 'MM')
                    )
                ORDER BY c.id, lh.loanid, lh.businessdate

            ) LOOP

                v_count := 0;
                SELECT COUNT(*) INTO v_count FROM (
                    SELECT batch_date
                    FROM TMP_REPORT_PROVISION_V2
                    WHERE custid = rec.custid AND loanid = rec.loanid
                    ORDER BY batch_date DESC
                    FETCH FIRST 1 ROW ONLY
                );

                -- co ban ghi trong bang TMP_REPORT_PROVISION_V2 => user da ton tai
                IF v_count > 0 THEN
                    -- lay data gan day nhat tu ban ghi do
                    SELECT batch_date,        nhom_no,        goc_con_lai,        trich_lap,         so_tien_trich_lap,        tong_trich_lap_cong_don,        hoan_nhap,        tong_hoan_nhap,        thu_nhap_bat_thuong
                    INTO   v_batch_date_prev, v_nhom_no_prev, v_goc_con_lai_prev, v_trich_lap_prev,  v_so_tien_trich_lap_prev, v_tong_trich_lap_cong_don_prev, v_hoan_nhap_prev, v_tong_hoan_nhap_prev, v_thu_nhap_bat_thuong_prev
                    FROM TMP_REPORT_PROVISION_V2
                    WHERE custid = rec.custid AND loanid = rec.loanid
                    ORDER BY batch_date DESC
                    FETCH FIRST 1 ROW ONLY;

                    INSERT INTO TMP_REPORT_PROVISION_V2 (created_time, ten_kh, so_hd, bid, pgd, custid, loanid, batch_date, nhom_no, goc_ban_dau, goc_con_lai, trich_lap, so_tien_trich_lap, hoan_nhap, thu_nhap_bat_thuong,
                    tong_trich_lap_cong_don, tong_hoan_nhap,
                    -- THAIDT: FINY-106 06/03/2026 Them custtype
                    custtype)

                    WITH data AS (
                        SELECT
                            to_char(SYSTIMESTAMP + INTERVAL '7' HOUR, 'dd/MM/yyyy hh24:mi:ss') as created_time,
                            rec.ten_kh as ten_kh,
                            rec.so_hd as so_hd,
                            rec.bid as bid,
                            rec.pgd as pgd,
                            rec.custid as custid,
                            rec.loanid as loanid,
                            rec.batch_date as batch_date,
                            rec.nhom_no as nhom_no,
                            rec.goc_ban_dau as goc_ban_dau,
                            CASE
                                -- tất toán trước hạn
                                WHEN rec.businessdate < rec.batch_date THEN 0
                                ELSE rec.goc_con_lai
                            END AS goc_con_lai,
                            CASE
                                WHEN v_trich_lap_prev = 100 THEN 100
                                ELSE rec.trich_lap
                            END AS trich_lap_new
                        FROM dual
                    )
                    SELECT
                        created_time,
                        ten_kh,
                        so_hd,
                        bid,
                        pgd,
                        custid,
                        loanid,
                        batch_date,
                        nhom_no,
                        goc_ban_dau,
                        goc_con_lai,
                        trich_lap_new as trich_lap,


                        CASE
                            -- nhóm nợ giữ nguyên hoặc nhóm nợ từ Bto về Bbé hoặc trích lập(n-1)= 100
                            WHEN (v_nhom_no_prev = nhom_no) OR (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(nhom_no, 2, 1))) OR v_trich_lap_prev = 100 THEN 0
                            ELSE ABS((goc_con_lai * (trich_lap_new / 100)) - v_tong_trich_lap_cong_don_prev)
                        END AS so_tien_trich_lap,


                        CASE
                            WHEN nhom_no = 'B4' OR trich_lap_new = 100 THEN 0
                            -- tu B3 -> B2, B1 ...
                            WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3)
                                 OR
                                -- giu nguyen nhom no nhung goc con lai giam
                                 (v_nhom_no_prev = nhom_no AND (goc_con_lai < v_goc_con_lai_prev) )
                            THEN
                                  ABS((goc_con_lai * (trich_lap_new / 100)) - v_tong_trich_lap_cong_don_prev)
                            ELSE  0
                        END AS hoan_nhap,

--                        CASE
--                            WHEN v_trich_lap_prev = 100 and rec.businessdate < rec.batch_date THEN
--                                ABS ( goc_con_lai )
--                            WHEN v_trich_lap_prev = 100 and rec.businessdate = rec.batch_date THEN
--                                ABS ( v_goc_con_lai_prev - goc_con_lai )
--                            ELSE 0
--                        END AS thu_nhap_bat_thuong,

                        CASE
                            WHEN v_trich_lap_prev = 100 THEN ABS ( v_goc_con_lai_prev - goc_con_lai )
                            ELSE 0
                        END AS thu_nhap_bat_thuong,

                        CASE
                            WHEN v_trich_lap_prev = 100 THEN v_tong_trich_lap_cong_don_prev
                            ELSE
                                ABS(
                                        v_tong_trich_lap_cong_don_prev
                                    +
                                        CASE
                                            -- nhóm nợ giữ nguyên hoặc nhóm nợ từ Bto về Bbé hoặc trích lập(n-1)= 100
                                            WHEN (v_nhom_no_prev = nhom_no) OR (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(nhom_no, 2, 1))) OR v_trich_lap_prev = 100 THEN 0
                                            ELSE ABS((goc_con_lai * (trich_lap_new / 100)) - v_tong_trich_lap_cong_don_prev)
                                        END --so_tien_trich_lap
                                    -
                                        (CASE
                                            WHEN nhom_no = 'B4' OR trich_lap_new = 100 THEN 0
                                            -- tu B3 -> B2, B1 ...
                                            WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3)
                                                 OR
                                                -- giu nguyen nhom no nhung goc con lai giam
                                                 (v_nhom_no_prev = nhom_no AND (goc_con_lai < v_goc_con_lai_prev) )
                                            THEN
                                                  ABS((goc_con_lai * (trich_lap_new / 100)) - v_tong_trich_lap_cong_don_prev)
                                            ELSE  0
                                        END) -- hoan_nhap
                                    -
                                        CASE
                                            WHEN v_trich_lap_prev = 100 THEN ABS ( v_goc_con_lai_prev - goc_con_lai )
                                            ELSE 0
                                        END -- thu_nhap_bat_thuong
                                )
                        END as tong_trich_lap_cong_don,


                        (
                            v_tong_hoan_nhap_prev
                        +
                            (CASE
                                WHEN nhom_no = 'B4' OR trich_lap_new = 100 THEN 0
                                -- tu B3 -> B2, B1 ...
                                WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3)
                                     OR
                                    -- giu nguyen nhom no nhung goc con lai giam
                                     (v_nhom_no_prev = nhom_no AND (goc_con_lai < v_goc_con_lai_prev) )
                                THEN
                                      ABS((goc_con_lai * (trich_lap_new / 100)) - v_tong_trich_lap_cong_don_prev)
                                ELSE  0
                            END) -- hoan_nhap
                        ) AS tong_hoan_nhap,
                        -- THAIDT: FINY-106 06/03/2026 Them custtype
                        rec.custtype AS custtype

                    FROM data;
                    COMMIT;

                -- khong co ban ghi trong bang TMP_REPORT_PROVISION_V2 => user moi
                ELSE
                    INSERT INTO TMP_REPORT_PROVISION_V2 (created_time, ten_kh, so_hd, bid, pgd, custid, loanid, batch_date, nhom_no, goc_ban_dau, goc_con_lai, trich_lap, so_tien_trich_lap, hoan_nhap, thu_nhap_bat_thuong,
                    tong_trich_lap_cong_don, tong_hoan_nhap,
                    -- THAIDT: FINY-106 06/03/2026 Them custtype
                    custtype)
                    SELECT
                        to_char(SYSTIMESTAMP + INTERVAL '7' HOUR, 'dd/MM/yyyy hh24:mi:ss') as created_time,
                        rec.ten_kh,
                        rec.so_hd,
                        rec.bid,
                        rec.pgd,
                        rec.custid,
                        rec.loanid,
                        rec.batch_date,
                        rec.nhom_no,
                        rec.goc_ban_dau,
                        CASE
                            -- tất toán trước hạn
                            WHEN rec.businessdate < rec.batch_date THEN 0
                            ELSE rec.goc_con_lai
                        END AS goc_con_lai,
                        rec.trich_lap,
                        ((rec.trich_lap * rec.goc_con_lai) / 100) AS so_tien_trich_lap,
                        0 AS hoan_nhap,
                        0 AS thu_nhap_bat_thuong,
                        ((rec.trich_lap * rec.goc_con_lai) / 100) AS tong_trich_lap_cong_don,
                        0 AS tong_hoan_nhap,
                        -- THAIDT: FINY-106 06/03/2026 Them custtype
                        rec.custtype AS custtype
                    FROM dual;
                    COMMIT;
                END IF;

            END LOOP;
            pkg_jobs.updateJob('PROVISION', 'D', 'bc trích lập dự phòng');
        END IF;
    END init_table_tmp_report_provision_v2;
    
    PROCEDURE search_table_tmp_report_provision_v2 (
                                pio_sql IN OUT varchar2,
                                pio_rec_total IN OUT number,
                                p_ten_kh varchar2,
                                p_so_hd varchar2,
                                p_ma_pgd varchar2,
                                p_ten_pgd varchar2,
                                p_nhom_no varchar2,
                                p_from_date varchar2,
                                p_to_date varchar2,
                                p_sort_type varchar2,
                                p_sort_name varchar2,
                                p_page varchar2,
                                p_size varchar2,
                                -- THAIDT: FINY-106 06/03/2026 Them custtype
                                p_custtype varchar2
    )
    IS

        v_sql varchar2(1000);
        v_sql_res varchar2(1000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(1000);

    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY custid) AS stt, trp.* FROM tmp_report_provision_v2 trp WHERE 1=1';

        IF (p_from_date IS NOT NULL OR p_from_date <> '') AND (p_to_date IS NOT NULL OR p_to_date <> '') THEN
            v_sql := v_sql || ' AND trp.batch_date  BETWEEN to_date('''|| p_from_date ||''', ''dd/MM/yyyy'') AND to_date('''|| p_to_date ||''', ''dd/MM/yyyy'')';
        END IF;

        IF (p_ten_kh IS NOT NULL OR p_ten_kh <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.ten_kh)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_ten_kh))) || '%''';
        END IF;

        IF (p_so_hd IS NOT NULL OR p_so_hd <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.so_hd)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_so_hd))) || '%''';
        END IF;

        IF (p_ma_pgd IS NOT NULL OR p_ma_pgd <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.bid)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_ma_pgd))) || '%''';
        END IF;

        IF (p_ten_pgd IS NOT NULL OR p_ten_pgd <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.pgd)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_ten_pgd))) || '%''';
        END IF;

        IF (p_nhom_no IS NOT NULL OR p_nhom_no <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.nhom_no)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_nhom_no))) || '%''';
        END IF;

        -- THAIDT: FINY-106 06/03/2026 Filter theo custtype
        IF p_custtype IS NOT NULL THEN
            v_sql := v_sql || ' AND trp.custtype = ''' || p_custtype || '''';
        END IF;
--        IF (p_ky_han_vay IS NOT NULL OR p_ky_han_vay <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(trp.ky_han_vay)) = ' || trim(upper(CONVERTTOUNSIGN(p_ky_han_vay)));
--        END IF;

        --------------------------------------

        IF (p_page <> 0 or p_page is not null) AND (p_size <> 0  or p_page is not null) THEN
            v_A := (1 + (p_page * p_size) - p_size);
            v_B := (p_page * p_size);
            v_sql_res := 'SELECT * FROM (' || v_sql || ') WHERE stt BETWEEN '|| v_A ||' AND '|| v_B;
        END IF;

        IF (p_page = 0 or p_page is null) AND (p_size = 0 or p_size is null) THEN
            v_sql_res := v_sql;
        END IF;

        IF (p_sort_type IS NOT NULL OR p_sort_type <> '') AND (p_sort_name IS NOT NULL OR p_sort_name <> '') THEN
            v_sql_res := v_sql_res || ' ORDER BY ' || trim(upper(p_sort_name)) || ' ' || trim(upper(p_sort_type));
        END IF;

        --pck_logs.insertLog('SQL_DEBUG', v_sql_res, 'PKG: SON_TEST.search_table_tmp_report_provision_v2');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';
        EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

    END search_table_tmp_report_provision_v2;
    
    PROCEDURE report_provision_v2 (
                                p_refcursor in out sys_refcursor,
                                p_record_total in out number,
                                p_ten_kh varchar2,
                                p_so_hd varchar2,
                                p_ma_pgd varchar2,
                                p_ten_pgd varchar2,
                                p_nhom_no varchar2,
                                p_from_date varchar2,
                                p_to_date varchar2,
                                p_sort_type varchar2,
                                p_sort_name varchar2,
                                p_page varchar2,
                                p_size varchar2,
                                p_mod varchar2,
                                p_userId varchar2,
                                    -- THAIDT: FINY-106 06/03/2026 Them custtype
                                p_custtype varchar2
    )
    IS
        v_except  EXCEPTION;
        v_errcode varchar2(10);
        v_errmsg  varchar2(200);
        v_date    date;
        vio_sql varchar2(1000);
        vio_rec_total number;
        v_count number;
        v_response RESPONSE_TYPE;

    BEGIN

        v_response := PKG_VALIDATE.validate_report_common(p_from_date, p_to_date, p_sort_type, p_sort_name, p_page, p_size, p_mod);

        IF v_response.v_errcode <> '00' THEN
            v_errcode := v_response.v_errcode;
            v_errmsg  := v_response.v_errmsg;
            raise v_except;
        END IF;

    ---------------

    IF trim(upper(p_mod)) = 'SEARCH' THEN

        search_table_tmp_report_provision_v2 (vio_sql, vio_rec_total, p_ten_kh, p_so_hd, p_ma_pgd, p_ten_pgd, p_nhom_no, p_from_date, p_to_date, p_sort_type, p_sort_name, p_page, p_size ,p_custtype);-- THAIDT: FINY-106 06/03/2026 Them custtype

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN

        search_table_tmp_report_provision_v2 (vio_sql, vio_rec_total, p_ten_kh, p_so_hd, p_ma_pgd, p_ten_pgd, p_nhom_no, p_from_date, p_to_date, p_sort_type, p_sort_name, 0, 0, p_custtype);  -- THAIDT: FINY-106 06/03/2026 Them custtype

    ELSE
        v_errcode := '12';
        v_errmsg  := 'mod không đúng';
        raise v_except;
    END IF;

    p_record_total := 0;
    p_record_total := vio_rec_total;

    OPEN p_refcursor FOR vio_sql;

    EXCEPTION when v_except then
        p_record_total := 0;
        open p_refcursor for
        select v_errcode as v_code, v_errmsg as v_desc from dual;
    END report_provision_v2;
    
PROCEDURE init_table_conversion_rate_report(pv_role number,
                                            pv_region varchar2,
                                            pv_area varchar2,
                                            pio_sql IN OUT varchar2,
                                            pio_rec_total IN OUT number,
                                            pv_fullName in varchar2,
                                            pv_branchName in varchar2,
                                            pv_areaName in varchar2,
                                            pv_regionName in varchar2,
                                            pv_fromDate in varchar2,
                                            pv_toDate in varchar2,
                                            pv_page in varchar2,
                                            pv_size in varchar2,
                                            -- THAIDT: FINY-106 05/03/2026 Them moi tham so custtype
                                            pv_custtype in varchar2
                                           ) IS
    v_count number;
    v_sql varchar2(2000);
    v_sql_res varchar2(2000);
    v_A number;
    v_B number;
    v_sql_reto varchar2(2000);

BEGIN

    v_count := 0;
    SELECT COUNT(*)
    INTO v_count
    FROM USER_TABLES
    WHERE TABLE_NAME = UPPER('TMP_CONVERSION_RATE_REPORT');

    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE TMP_CONVERSION_RATE_REPORT';
    END IF;

    if pv_role = 9 then
        EXECUTE IMMEDIATE '
        CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
        SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1,
               l2.lnclass class2, l2.debt debt2,l1.loantype, l1.branchname, l1.areaname,
               -- [ADDED] Cac truong moi
               l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code,
               -- THAIDT: FINY-106 05/03/2026 Them custtype vao temp table
               l1.custtype
        FROM
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass,
            (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,
            -- [ADDED] Lay thong tin moi trong l1
            l.documentno,
            u.full_name as sale_name,
            u.user_code as sale_code,
            (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
            (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
            -- THAIDT: FINY-106 05/03/2026 Them custtype vao subquery l1
            (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
                    WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid
                    and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE'' and b.aid = ''' || trim(pv_area) || '''
                    AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l1,
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, (h.prinnml + h.prinovd) debt, b.name branchname, a.name areaname
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a, region g
                WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid and b.aid = ''' || trim(pv_area) || '''
                    AND (h.businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l2
            WHERE l1.loanid = l2.loanid
            UNION
            SELECT c.fullname, l.lndate, l.amount, h.loanid, h.lnclass class1, (h.prinnml + h.prinovd) debt1,
                    ''B0'' class2, 0 debt2,al.name loantype, b.name branchname, a.name areaname,
                     l.documentno,
                    u.full_name as sale_name,
                    u.user_code as sale_code,
                    (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                    (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao UNION part
                    (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
            FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
            WHERE h.loanid = l.id
            AND l.custid = c.id
            AND l.regid = r.id
            AND r.saleid = u.user_id
            AND u.branch = b.bid
            AND b.aid = a.aid
            AND a.rid = g.rid
            and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE'' and b.aid = ''' || trim(pv_area) || '''
            AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
            AND l.id NOT IN (SELECT h1.loanid FROM (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY''))) h1,
                (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)) h2
                WHERE h1.loanid = h2.loanid)
            AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

        ';
    elsif pv_role = 10 then
        EXECUTE IMMEDIATE '
        CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
        SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1,
               l2.lnclass class2, l2.debt debt2,l1.loantype, l1.branchname, l1.areaname,
               -- [ADDED] Cac truong moi
               l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code,
               -- THAIDT: FINY-106 05/03/2026 Them custtype vao temp table
               l1.custtype
        FROM
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass,
            (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,
             l.documentno,
            u.full_name as sale_name,
            u.user_code as sale_code,
            (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
            (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
            -- THAIDT: FINY-106 05/03/2026 Them custtype vao subquery l1
            (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
                    WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid
                    and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE'' and b.rid = ''' || trim(pv_region) || '''
                    AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l1,
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, (h.prinnml + h.prinovd) debt, b.name branchname, a.name areaname
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a, region g
                WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid and b.rid = ''' || trim(pv_region) || '''
                    AND (h.businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l2
            WHERE l1.loanid = l2.loanid
            UNION
            SELECT c.fullname, l.lndate, l.amount, h.loanid, h.lnclass class1, (h.prinnml + h.prinovd) debt1,
                    ''B0'' class2, 0 debt2,al.name loantype, b.name branchname, a.name areaname,

                    l.documentno,
                    u.full_name as sale_name,
                    u.user_code as sale_code,
                    (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                    (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao UNION part
                    (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
            FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
            WHERE h.loanid = l.id
            AND l.custid = c.id
            AND l.regid = r.id
            AND r.saleid = u.user_id
            AND u.branch = b.bid
            AND b.aid = a.aid
            AND a.rid = g.rid
            and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE'' and b.rid = ''' || trim(pv_region) || '''
            AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
            AND l.id NOT IN (SELECT h1.loanid FROM (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY''))) h1,
                (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)) h2
                WHERE h1.loanid = h2.loanid)
            AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

        ';
    else
        EXECUTE IMMEDIATE '
        CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
        SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1,
               l2.lnclass class2, l2.debt debt2,l1.loantype, l1.branchname, l1.areaname,
               -- [ADDED] Cac truong moi
               l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code,
               -- THAIDT: FINY-106 05/03/2026 Them custtype vao temp table
               l1.custtype
        FROM
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass,
            (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,

            l.documentno,
            u.full_name as sale_name,
            u.user_code as sale_code,
            (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
            (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
            -- THAIDT: FINY-106 05/03/2026 Them custtype vao subquery l1
            (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
                    WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid
                    and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE''
                    AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l1,
        (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, (h.prinnml + h.prinovd) debt, b.name branchname, a.name areaname
                FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a, region g
                WHERE h.loanid = l.id
                    AND l.custid = c.id
                    AND l.regid = r.id
                    AND r.saleid = u.user_id
                    AND u.branch = b.bid
                    AND b.aid = a.aid
                    AND a.rid = g.rid
                    AND (h.businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)
                    AND h.loanid IN (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'')))
                    AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
                    AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

            ) l2
            WHERE l1.loanid = l2.loanid
            UNION
            SELECT c.fullname, l.lndate, l.amount, h.loanid, h.lnclass class1, (h.prinnml + h.prinovd) debt1,
                    ''B0'' class2, 0 debt2,al.name loantype, b.name branchname, a.name areaname,

                    l.documentno,
                    u.full_name as sale_name,
                    u.user_code as sale_code,
                    (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                    (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code,
                    -- THAIDT: FINY-106 05/03/2026 Them custtype vao UNION part
                    (CASE WHEN c.custtype = ''2'' THEN ''2'' ELSE ''1'' END) as custtype
            FROM loanhist h, loan l, customer c, loanregistration r, admin_user u, branch b, area a,allcode al, region g
            WHERE h.loanid = l.id
            AND l.custid = c.id
            AND l.regid = r.id
            AND r.saleid = u.user_id
            AND u.branch = b.bid
            AND b.aid = a.aid
            AND a.rid = g.rid
            and trim(r.loantype) = trim(al.code) and al.type = ''LOANTYPE''
            AND (h.businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY'') OR ''' || pv_fromDate || ''' IS NULL)
            AND l.id NOT IN (SELECT h1.loanid FROM (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_fromDate || ''', ''DD/MM/YYYY''))) h1,
                (SELECT loanid FROM loanhist WHERE (businessdate = TO_DATE(''' || pv_toDate || ''', ''DD/MM/YYYY'') OR ''' || pv_toDate || ''' IS NULL)) h2
                WHERE h1.loanid = h2.loanid)
            AND (upper(CONVERTTOUNSIGN(c.fullname)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_fullName || ''')) || ''%'' OR ''' || pv_fullName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(b.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_branchName || ''')) || ''%'' OR ''' || pv_branchName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(a.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_areaName || ''')) || ''%'' OR ''' || pv_areaName || ''' IS NULL)
            AND (upper(CONVERTTOUNSIGN(g.name)) LIKE ''%'' || upper(CONVERTTOUNSIGN(''' || pv_regionName || ''')) || ''%'' OR ''' || pv_regionName || ''' IS NULL)

        ';
    end if;

    v_count := 0;
    SELECT count(index_name) INTO v_count
    FROM user_indexes
    WHERE table_name = 'TMP_CONVERSION_RATE_REPORT';

    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX idx_trp_loanid ON TMP_CONVERSION_RATE_REPORT (loanid)';
    END IF;
    COMMIT;

    v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY loanid) AS stt, trp.* FROM tmp_conversion_rate_report trp WHERE 1=1';

    -- THAIDT: FINY-106 05/03/2026 Them filter custtype vao cau query phan trang
    IF pv_custtype IS NOT NULL AND pv_custtype <> '' THEN
        v_sql := v_sql || ' AND custtype = ''' || pv_custtype || '''';
    END IF;

    IF pv_page <> 0 AND pv_size <> 0 THEN
    v_A := (1 + (pv_page * pv_size) - pv_size);
    v_B := (pv_page * pv_size);
    v_sql_res := 'SELECT * FROM (' || v_sql || ') WHERE stt BETWEEN '|| v_A ||' AND '|| v_B;
    END IF;

    IF pv_page = 0 AND pv_size = 0 THEN
        v_sql_res := v_sql;
    END IF;

    IF (pv_branchName IS NOT NULL OR pv_branchName <> '') AND (pv_regionName IS NOT NULL OR pv_regionName <> '') THEN
        v_sql_res := v_sql_res;
    END IF;

    pio_sql := v_sql_res;

    v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';
    EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

END init_table_conversion_rate_report;


PROCEDURE conversion_rate_report(pv_refcursor in out sys_refcursor,
                                p_record_total in out number,
                                pv_userId number,
                                pv_fullName varchar2,
                                pv_branchName varchar2,
                                pv_areaName varchar2,
                                pv_regionName varchar2,
                                pv_fromDate varchar2,
                                pv_toDate varchar2,
                                pv_page varchar2,
                                pv_size varchar2,
                                pv_mod varchar2,
                                -- THAIDT: FINY-106 05/03/2026 Them moi tham so custtype
                                pv_custtype varchar2
                                )
IS
    v_role number(2);
    v_branch varchar(10);
    v_area varchar(10);
    v_region varchar(10);
    v_except  EXCEPTION;
    v_errcode varchar2(10);
    v_errmsg  varchar2(1000);
    vio_sql varchar2(2000);
    v_date date;
    vio_rec_total number;

BEGIN

    begin
        select role, branch into v_role, v_branch from admin_user where user_id = pv_userId;
        select aid, rid into v_area, v_region from branch where bid = v_branch;
    exception when others then
        v_role := 0;
        v_branch := null;
        v_area := null;
        v_region := null;
    end;
    if v_role in (3,4,6,8,9,10,13,14,18) then
         -- bắt buộc phải có p_page và p_size
        IF (
            (pv_page IS NULL OR pv_page = '') or (pv_size IS NULL OR pv_size = '')
        ) THEN
            v_errcode := '01';
            v_errmsg := 'page and size là bắt buộc';
            raise v_except;
        END IF;

         IF (
            (REGEXP_LIKE(pv_page, '^[0-9]$')) AND (REGEXP_LIKE(pv_size, '^[0-9]$'))
            AND
            (to_number(pv_page) < 0) AND (to_number(pv_size) > 100)
        ) THEN
            v_errcode := '02';
            v_errmsg := 'page và size phải là số và 0 < size <= 100';
            raise v_except;
        END IF;

        -- bắt buộc phải có p_mod (tăng perfoment)
        IF (pv_mod IS NULL OR pv_mod = '') THEN
            v_errcode := '03';
            v_errmsg := 'trường mod là bắt buộc';
            raise v_except;
        END IF;

        -- nếu có date thì phải có cả pv_fromDate and pv_toDate
        IF (
            (pv_fromDate IS NULL OR pv_fromDate = '') AND (pv_toDate IS NOT NULL OR pv_toDate <> '')
            OR
            (pv_fromDate IS NOT NULL OR pv_fromDate <> '') AND (pv_toDate IS NULL OR pv_toDate = '')
        ) THEN
            v_errcode := '06';
            v_errmsg := 'from_date và to_date bắt buộc';
            raise v_except;
        END IF;

         IF (pv_fromDate IS NOT NULL OR pv_fromDate <> '') AND (NOT REGEXP_LIKE(pv_fromDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '07';
            v_errmsg := 'from_date không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;

        IF (REGEXP_LIKE(pv_fromDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            BEGIN
                v_date := TO_DATE(pv_fromDate, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '08';
                v_errmsg := 'from_date không hợp lệ';
                raise v_except;
            END;
        END IF;

        IF (pv_toDate IS NOT NULL OR pv_toDate <> '') AND (NOT REGEXP_LIKE(pv_toDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '09';
            v_errmsg := 'to_date không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;

        IF (REGEXP_LIKE(pv_toDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            BEGIN
                v_date := TO_DATE(pv_toDate, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '10';
                v_errmsg := 'to_date không hợp lệ';
                raise v_except;
            END;
        END IF;

        if trim(upper(pv_mod)) = 'SEARCH' then --Van hanh, Tham dinh, CGPD
            init_table_conversion_rate_report (v_role,
                                            v_region,
                                            v_area,
                                            vio_sql ,
                                            vio_rec_total ,
                                            pv_fullName,
                                            pv_branchName ,
                                            pv_areaName ,
                                            pv_regionName ,
                                            pv_fromDate ,
                                            pv_toDate  ,
                                            pv_page ,
                                            pv_size,
                                            -- THAIDT: FINY-106 05/03/2026 Truyen custtype xuong ham init
                                            pv_custtype
                                            );

        ELSIF trim(upper(pv_mod)) = 'EXPORT' THEN
            init_table_conversion_rate_report (v_role,
                                            v_region,
                                            v_area,
                                            vio_sql ,
                                            vio_rec_total ,
                                            pv_fullName,
                                            pv_branchName ,
                                            pv_areaName ,
                                            pv_regionName ,
                                            pv_fromDate ,
                                            pv_toDate  ,
                                            0 ,
                                            0,
                                            -- THAIDT: FINY-106 05/03/2026 Truyen custtype xuong ham init (export)
                                            pv_custtype
                                            );

    else
        v_errcode := '11';
        v_errmsg := 'mod không hợp lệ';
        raise v_except;
        end if;

    else
        v_errcode := '12';
        v_errmsg := 'tài khoản không có quyền truy cập';
        raise v_except;
    end if;

    p_record_total := vio_rec_total;
    OPEN pv_refcursor FOR vio_sql;

EXCEPTION when v_except then
    open pv_refcursor for
    select v_errcode as v_code, v_errmsg as v_desc from dual;

END conversion_rate_report;

    -- báo cáo thực thu
    PROCEDURE init_table_tmp_avenue_report(p_lastDayMonPre varchar2, p_fromDate varchar2, p_toDate varchar2)
    IS
    BEGIN
        INSERT INTO TMP_AVENUE_REPORT (id, custid, fullname, branch, documentno, productname, rate, feerate, expertisefeerate, lndate, term, duedate, dueno, trandate, lnclass, prinpaid, intpaid,
                assetmanagementpaid, expertisefeepaid, punishfeepaid, idnumber, address, addressdetail, ward, district, province, invoice,
                -- THAIDT: FINY-106 06/03/2026 Them custtype vao cau insert
                custtype)
        SELECT
            i.id, r.custid, c.fullname, b.name branch, ln.documentno, al.name productname, ln.rate, ln.feerate, ln.expertisefeerate, ln.lndate, ln.term, l.duedate, l.dueno, i.trandate,
            --(SELECT TRIM(lh.lnclass) FROM loanhist lh WHERE lh.loanid = ln.id AND lh.businessdate = to_date(p_lastDayMonPre, 'dd/MM/yyyy')) lnclass,
            --fn_cal_lnclass_by_date(ln.custid, to_date(p_lastDayMonPre, 'dd/MM/yyyy')) lnclass,
            fn_cal_lnclass_by_date(
                ln.custid,
                (case
                    when to_char(trunc(l.duedate, 'MM') - 1, 'dd/MM') IN ('30/04', '01/05') then -- Ngày cuối tháng trước IN ('30/04', '01/05')
                         to_date('29/04/' || to_char(l.duedate, 'yyyy'), 'dd/MM/yyyy')
                    else
                         trunc(l.duedate, 'MM') - 1
                end)
            ) as lnclass,
            (SELECT SUM(tranvalue) FROM transaction tr, loantransaction ltr WHERE tr.ref = ltr.id AND ltr.loanscheduleid = i.id AND tr.trandate = i.trandate AND tr.trandes LIKE '%gốc%') prinpaid,
            (SELECT SUM(tranvalue) FROM transaction tr, loantransaction ltr WHERE tr.ref = ltr.id AND ltr.loanscheduleid = i.id AND tr.trandate = i.trandate AND tr.trandes LIKE '%lãi%') intpaid,
            (SELECT SUM(tranvalue) FROM transaction tr, loantransaction ltr WHERE tr.ref = ltr.id AND ltr.loanscheduleid = i.id AND tr.trandate = i.trandate AND tr.trandes LIKE '%tài sản%') assetmanagementpaid,
            (SELECT SUM(tranvalue) FROM transaction tr, loantransaction ltr WHERE tr.ref = ltr.id AND ltr.loanscheduleid = i.id AND tr.trandate = i.trandate AND tr.trandes LIKE '%phí thẩm định%') expertisefeepaid,
            (SELECT SUM(tranvalue) FROM transaction tr, loantransaction ltr WHERE tr.ref = ltr.id AND ltr.loanscheduleid = i.id AND tr.trandate = i.trandate AND tr.trandes LIKE '%phí phạt quá hạn%') punishfeepaid,
            c.idnumber,
            (COALESCE(c.residenceaddress, '') || ', ' || COALESCE(w.wname, '') || ', ' || COALESCE(d.dname, '') || ', ' || COALESCE(p.pname, '')) AS address,
            COALESCE(c.residenceaddress, '') AS addressdetail,
            COALESCE(w.wname, '') as ward,
            COALESCE(d.dname, '') as district,
            COALESCE(p.pname, '') as province,
            (case
                when
                    (fn_cal_lnclass_by_date(
                        ln.custid,
                        (case
                            when to_char(trunc(l.duedate, 'MM') - 1, 'dd/MM') IN ('30/04', '01/05') then -- Ngày cuối tháng trước IN ('30/04', '01/05')
                                 to_date('29/04/' || to_char(l.duedate, 'yyyy'), 'dd/MM/yyyy')
                            else
                                 trunc(l.duedate, 'MM') - 1
                        end)
                    ) IN ('B0', 'B1')) -- nhóm nợ thuộc B0 hoặc B1
                    and
                    (fn_cal_loan_paid(ln.id, l.duedate).code = 0) -- chưa tất toán
                then '1' -- đã xuất hóa đơn
                when
                    (fn_cal_lnclass_by_date(
                        ln.custid,
                        (case
                            when to_char(trunc(l.duedate, 'MM') - 1, 'dd/MM') IN ('30/04', '01/05') then -- Ngày cuối tháng trước IN ('30/04', '01/05')
                                 to_date('29/04/' || to_char(l.duedate, 'yyyy'), 'dd/MM/yyyy')
                            else
                                 trunc(l.duedate, 'MM') - 1
                        end)
                    ) IN ('B0', 'B1')) -- nhóm nợ thuộc B0 hoặc B1
                    and
                    (fn_cal_loan_paid(ln.id, l.duedate).code = 1) -- đã tất toán
                    and
                    (TRUNC(l.duedate, 'MM') = TRUNC(i.trandate, 'MM')) -- cùng tháng/năm
                then '1' -- đã xuất hóa đơn
                else '0' -- chưa xuất hóa đơn
            end) as invoice,
            -- THAIDT: FINY-106 06/03/2026 Them custtype vao cau select
            (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
        FROM customer c, admin_user u, branch b, loan ln, loanregistration r, loanschedule l, allcode al,
            (   SELECT DISTINCT s.id, t.trandate
                FROM loanschedule s, loantransaction lt, transaction t
                WHERE s.id = lt.loanscheduleid
                    AND lt.id = t.ref
                    AND (t.trandes LIKE '%gốc%' OR t.trandes LIKE '%lãi%' or t.trandes like '%tài sản%' or t.trandes like '%thẩm định%' or t.trandes like '%phí phạt quá hạn%')
                    AND t.trandate >= to_date(p_fromDate, 'dd/MM/yyyy')
                    AND t.trandate <= to_date(p_toDate, 'dd/MM/yyyy') ) i,
            ward w,
            district d,
            province p
        WHERE c.id = r.custid AND r.saleid = u.user_id AND u.branch = b.bid AND r.id = ln.regid AND ln.id = l.loanid
            AND l.id = i.id AND TRIM(r.loantype) = TRIM(al.code) AND al.type = 'LOANTYPE'
            AND c.residencewardid = w.id
            AND c.residencedistrictid = d.id
            AND c.residenceprovinceid = p.id
        ;
        COMMIT;
        pkg_jobs.updateJob('AVENUE', 'D', 'bc thực thu');
    END init_table_tmp_avenue_report;


    PROCEDURE search_table_avenue_report (
                        pio_sql IN OUT varchar2,
                        pio_rec_total IN OUT number,
                        p_fromDate IN varchar2,
                        p_toDate IN varchar2,
                        p_customerName IN varchar2,
                        p_documentNo IN varchar2,
                        p_productName IN varchar2,
                        p_term IN varchar2,
                        p_lnClass varchar2,
                        p_sortType IN varchar2,
                        p_sortName IN varchar2,
                        p_page IN varchar2,
                        p_size IN varchar2,
                        p_invoice IN varchar2,
                        p_idnumber IN varchar2,
                            -- THAIDT: FINY-106 06/03/2026 Them custtype
                        p_custtype IN varchar2
    )

    IS
        v_sql varchar2(3000);
        v_sql_res varchar2(4000);
        v_sql_reto varchar2(4000);
        v_A number;
        v_B number;

    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY custid) AS stt, tar.* FROM tmp_avenue_report tar WHERE 1=1';

        IF (p_fromDate IS NOT NULL OR p_fromDate <> '') AND (p_toDate IS NOT NULL OR p_toDate <> '') THEN
            v_sql := v_sql || ' AND tar.trandate BETWEEN to_date('''|| p_fromDate ||''', ''dd/MM/yyyy'') AND to_date('''|| p_toDate ||''', ''dd/MM/yyyy'')';
        END IF;

        IF (p_customerName IS NOT NULL OR p_customerName <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(tar.fullname)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_customerName))) || '%''';
        END IF;

        IF (p_documentNo IS NOT NULL OR p_documentNo <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(tar.documentno)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_documentNo))) || '%''';
        END IF;

        IF (p_productName IS NOT NULL OR p_productName <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(tar.productname)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_productName))) || '%''';
        END IF;

        IF (p_term IS NOT NULL OR p_term <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(tar.term)) = ' || trim(upper(CONVERTTOUNSIGN(p_term)));
        END IF;

        IF (p_lnClass IS NOT NULL OR p_lnClass <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(tar.lnclass)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_lnClass))) || '%''';
        END IF;

        IF (p_invoice IS NOT NULL OR p_invoice <> '') THEN
            v_sql := v_sql || ' AND tar.invoice = ' || p_invoice; --invoice = 1-> đã xuất hóa đơn, 0 -> chưa xuất hóa đơn
        END IF;

        IF (p_idnumber IS NOT NULL OR p_idnumber <> '') THEN
            v_sql := v_sql || ' AND tar.idnumber like ''%' || p_idnumber || '%''';
        END IF;
        -- THAIDT: FINY-106 06/03/2026 Filter theo custtype
        IF p_custtype IS NOT NULL THEN
            v_sql := v_sql || ' AND tar.custtype = ''' || p_custtype || '''';
        END IF;
        --------------------------------------

        IF p_page <> 0 AND p_size <> 0 THEN
            v_A := (1 + (p_page * p_size) - p_size);
            v_B := (p_page * p_size);
            v_sql_res := 'SELECT * FROM (' || v_sql || ') WHERE stt BETWEEN '|| v_A ||' AND '|| v_B;
        END IF;

        IF p_page = 0 AND p_size = 0 THEN
            v_sql_res := v_sql;
        END IF;

        IF (p_sortType IS NOT NULL OR p_sortType <> '') AND (p_sortName IS NOT NULL OR p_sortName <> '') THEN
            v_sql_res := v_sql_res || ' ORDER BY ' || trim(upper(p_sortName)) || ' ' || trim(upper(p_sortType));
        END IF;

        --pck_logs.insertLog('SQL_DEBUG', v_sql_res, 'PKG: PCK_REPORT.search_table_avenue_report');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';

        EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

        EXCEPTION
            when others then
            error_mgr.log_error(v_sql_res);
    END search_table_avenue_report;

    PROCEDURE avenuereport(
                        p_refcursor in out sys_refcursor,
                        p_record_total in out number,
                        p_fromDate varchar2,
                        p_toDate varchar2,
                        p_customerName varchar2,
                        p_documentNo varchar2,
                        p_productName varchar2,
                        p_term varchar2,
                        p_lnClass varchar2,
                        p_invoice varchar2,
                        p_idnumber varchar2,
                        p_sortType varchar2,
                        p_sortName varchar2,
                        p_page varchar2,
                        p_size varchar2,
                        p_mod varchar2,
                        p_userId varchar2,
                        -- THAIDT: FINY-106 06/03/2026 Them custtype
                        p_custtype varchar2
    )
    IS

        v_except      EXCEPTION;
        v_errcode     varchar2(10);
        v_errmsg      varchar2(1000);
        v_role        number(2);
        v_date        date;
        pio_sql       varchar2(4000);
        pio_rec_total number;
        v_response RESPONSE_TYPE;

    BEGIN
        begin
            select role into v_role from admin_user where user_id = p_userId;
            exception when others then
                v_role := 0;
        end;

        IF v_role in (4,6,13,14,18) then

            v_response := PKG_VALIDATE.validate_report_common(p_fromDate, p_toDate, p_sortType, p_sortName, p_page, p_size, p_mod);

            IF p_invoice <> '0' AND p_invoice <> '1' THEN
                v_errcode := '11';
                v_errmsg  := 'invoice phải là 0 hoặc 1';
                raise v_except;
            END IF;

            IF v_response.v_errcode <> '00' THEN
                v_errcode := v_response.v_errcode;
                v_errmsg  := v_response.v_errmsg;
                raise v_except;
            END IF;

            -------------------------------------------------

            if trim(upper(p_mod)) = 'SEARCH' then -- vận hành
                search_table_avenue_report(pio_sql, pio_rec_total, p_fromDate, p_toDate, p_customerName, p_documentNo, p_productName, p_term, p_lnClass, p_sortType, p_sortName, p_page, p_size, p_invoice, p_idnumber, p_custtype);    -- THAIDT: FINY-106 06/03/2026 Them custtype

            elsif trim(upper(p_mod)) = 'EXPORT' then
                search_table_avenue_report(pio_sql, pio_rec_total, p_fromDate, p_toDate, p_customerName, p_documentNo, p_productName, p_term, p_lnClass, p_sortType, p_sortName, 0, 0, p_invoice, p_idnumber, p_custtype);    -- THAIDT: FINY-106 06/03/2026 Them custtype

            else
                v_errcode := '11';
                v_errmsg := 'Mod không hợp lệ';
                raise v_except;
            end if;

        ELSE
            v_errcode := '12';
            v_errmsg := 'Tài khoản không có quyền truy cập';
            raise v_except;
        END IF;

        p_record_total := pio_rec_total;
        open p_refcursor for pio_sql;

        EXCEPTION WHEN v_except THEN
            open p_refcursor for
            select v_errcode as v_code, v_errmsg as v_desc from dual;
    END avenuereport;

    ----------------------------------------------------------------------------
 PROCEDURE init_table_tmp_transaction_report
IS
BEGIN
     -- THAIDT: FINY-106 05/03/2026 them custtype vao cau insert
    INSERT INTO VITATEST.tmp_transaction_report (id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid, address, custtype)
    SELECT * FROM (
        -- THAIDT: FINY-106 05/03/2026 them custtype danh sach cot
        select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid, address, custtype from (
            select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes,
            (case when t.ref is not null and trandes like 'Thanh toán%' then (
                select dueno from loanschedule where id in (select loanscheduleid from loantransaction where id = t.ref))
            else null end) dueno,
            ln.documentno, ln.lndate, ln.loantype, u.branch, r.saleid,
            (COALESCE(c.residenceaddress, '') || ', ' || COALESCE(w.wname, '') || ', ' || COALESCE(d.dname, '') || ', ' || COALESCE(p.pname, '')) AS address,
             -- THAIDT: FINY-106 05/03/2026 them custtype danh sach cot
            (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt, loanschedule ls,
                (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r,
                (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln,
                ward w,
                district d,
                province p
            where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                and t.ref = lt.id and lt.loanscheduleid = ls.id and ls.loanid = ln.id and t.trancode <> '1' and lower(t.trandes) not like '%tất toán%' and lower(t.trandes) not like '%phí phạt trước hạn%' and t.status = '1'
                and c.residencewardid = w.id
                and c.residencedistrictid = d.id
                and c.residenceprovinceid = p.id
        )
        union all
        -- THAIDT: FINY-106 05/03/2026 them custtype danh sach cot
        select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid, address, custtype from (
            select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes,
            null dueno, ln.documentno, ln.lndate, ln.loantype, u.branch, r.saleid,
            (COALESCE(c.residenceaddress, '') || ', ' || COALESCE(w.wname, '') || ', ' || COALESCE(d.dname, '') || ', ' || COALESCE(p.pname, '')) AS address,
             -- THAIDT: FINY-106 05/03/2026 them custtype vao cau select 
            (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt,
                (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r,
                (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln,
                ward w,
                district d,
                province p
            where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                and t.ref = lt.id and lt.loanscheduleid = ln.id and lower(t.trandes) like '%phí phạt trước hạn%' and t.status = '1'
                and c.residencewardid = w.id
                and c.residencedistrictid = d.id
                and c.residenceprovinceid = p.id
        )
        union all
         -- THAIDT: FINY-106 05/03/2026 them custtype danh sach cot
        select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid, address, custtype from (
            select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes,
            null dueno, null documentno, null lndate, null loantype, u.branch, r.saleid,
            (COALESCE(c.residenceaddress, '') || ', ' || COALESCE(w.wname, '') || ', ' || COALESCE(d.dname, '') || ', ' || COALESCE(p.pname, '')) AS address,
            -- THAIDT: FINY-106 05/03/2026 them custtype vao cau select 
            (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
            from customer c, admin_user u, branch b, transaction t, allcode a,
                (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r,
                ward w,
                district d,
                province p
            where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                and t.trancode = '1' and t.status = '1'
                and c.residencewardid = w.id
                and c.residencedistrictid = d.id
                and c.residenceprovinceid = p.id
        )
    ) a
    WHERE NOT EXISTS (select * from VITATEST.tmp_transaction_report b where a.id = b.id);
    COMMIT;
    pkg_jobs.updateJob('TRANSACTION', 'D', 'bc giao dịch');
    EXCEPTION
        WHEN OTHERS THEN
        error_mgr.log_error('init_table_tmp_transaction_report');
END init_table_tmp_transaction_report;

    PROCEDURE search_table_tmp_transaction_report (
        pio_sql         IN OUT  VARCHAR2,
        pio_rec_total   IN OUT  NUMBER,
        p_fullname      VARCHAR2,
        p_mobile        VARCHAR2,
        p_idnumber      VARCHAR2,
        p_documentno    VARCHAR2,
        p_branch        VARCHAR2,
        p_loantype      VARCHAR2,
        p_tranname      VARCHAR2,
        p_trandes       VARCHAR2,
        p_tranfromdate  VARCHAR2,
        p_trantodate    VARCHAR2,
        p_lnfromdate    VARCHAR2,
        p_lntodate      VARCHAR2,
        p_sorttype      VARCHAR2,
        p_sortname      VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_userid        VARCHAR2,
        p_custtype      VARCHAR2 -- THAIDT: FINY-106 05/03/2026 Them moi tham so  custtype
    ) IS

        v_sql       VARCHAR2(1000);
        v_sql_res   VARCHAR2(1000);
        v_a         NUMBER;
        v_b         NUMBER;
        v_sql_reto  VARCHAR2(1000);
        v_role      NUMBER(2);
        v_branch    VARCHAR(10);
        v_str       VARCHAR2(1000);
    BEGIN
        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY id) AS stt, ttr.* FROM VITATEST.tmp_transaction_report ttr WHERE 1=1';
        SELECT
            role,
            branch
        INTO
            v_role,
            v_branch
        FROM
            admin_user
        WHERE
            user_id = p_userid;

        IF ( v_role = 2 ) THEN --Nhan vien kinh doanh (sale)
            v_sql := v_sql
                     || ' AND ttr.SALEID = '
                     || p_userid;
        ELSIF ( v_role = 5 ) THEN --Truong phong giao dich
            v_sql := v_sql
                     || ' AND ttr.BRANCH = '
                     || v_branch;
        ELSIF v_role IN (
            3,
            4,
            6,
            7,
            8,
            11,
            12,
            13,
            18
        ) THEN --Van hanh, Tham dinh, CGPD, TP Nhan su, THN
            v_sql := v_sql;
        END IF;

        --------------------------------------

        IF ( p_fullname IS NOT NULL OR p_fullname <> '' ) THEN
            v_sql := v_sql
                     || ' AND upper(CONVERTTOUNSIGN(ttr.FULLNAME)) like ''%'
                     || trim(upper(converttounsign(p_fullname)))
                     || '%''';
        END IF;

        IF ( p_mobile IS NOT NULL OR p_mobile <> '' ) THEN
            v_sql := v_sql
                     || ' AND upper(CONVERTTOUNSIGN(ttr.MOBILE)) like ''%'
                     || trim(upper(converttounsign(p_mobile)))
                     || '%''';
        END IF;

        IF ( p_idnumber IS NOT NULL OR p_idnumber <> '' ) THEN
            v_sql := v_sql
                     || ' AND upper(CONVERTTOUNSIGN(ttr.IDNUMBER)) like ''%'
                     || trim(upper(converttounsign(p_idnumber)))
                     || '%''';
        END IF;

        IF ( p_documentno IS NOT NULL OR p_documentno <> '' ) THEN
            v_sql := v_sql
                     || ' AND upper(CONVERTTOUNSIGN(ttr.DOCUMENTNO)) like ''%'
                     || trim(upper(converttounsign(p_documentno)))
                     || '%''';
        END IF;

--        IF (p_branch IS NOT NULL OR p_branch <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.BNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_branch))) || '%''';
--        END IF;

        IF ( p_branch IS NOT NULL OR p_branch <> '' ) THEN
            v_str := ''''
                     || replace(trim(p_branch), ',', ''',''')
                     || '''';

            v_sql := v_sql
                     || ' AND ttr.BNAME IN ('
                     || v_str
                     || ')';
        END IF;

--        IF (p_loanType IS NOT NULL OR p_loanType <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.LOANTYPE)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_loanType))) || '%''';
--        END IF;

        IF ( p_loantype IS NOT NULL OR p_loantype <> '' ) THEN
            v_str := ''''
                     || replace(trim(p_loantype), ',', ''',''')
                     || '''';

            v_sql := v_sql
                     || ' AND ttr.LOANTYPE IN ('
                     || v_str
                     || ')';
        END IF;

--        IF (p_tranName IS NOT NULL OR p_tranName <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.TRANNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_tranName))) || '%''';
--        END IF;

        IF ( p_tranname IS NOT NULL OR p_tranname <> '' ) THEN
            v_str := ''''
                     || replace(trim(p_tranname), ',', ''',''')
                     || '''';

            v_sql := v_sql
                     || ' AND ttr.TRANNAME IN ('
                     || v_str
                     || ')';
        END IF;

        IF ( p_trandes IS NOT NULL OR p_trandes <> '' ) THEN
            v_sql := v_sql
                     || ' AND upper(CONVERTTOUNSIGN(ttr.TRANDES)) like ''%'
                     || trim(upper(converttounsign(p_trandes)))
                     || '%''';
        END IF;

        IF
            ( p_tranfromdate IS NOT NULL OR p_tranfromdate <> '' ) AND ( p_trantodate IS NOT NULL OR p_trantodate <> '' )
        THEN
            v_sql := v_sql
                     || ' AND ttr.TRANDATE  BETWEEN to_date('''
                     || p_tranfromdate
                     || ''', ''dd/MM/yyyy'') AND to_date('''
                     || p_trantodate
                     || ''', ''dd/MM/yyyy'')';
        END IF;

        IF
            ( p_lnfromdate IS NOT NULL OR p_lnfromdate <> '' ) AND ( p_lntodate IS NOT NULL OR p_lntodate <> '' )
        THEN
            v_sql := v_sql
                     || ' AND ttr.LNDATE  BETWEEN to_date('''
                     || p_lnfromdate
                     || ''', ''dd/MM/yyyy'') AND to_date('''
                     || p_lntodate
                     || ''', ''dd/MM/yyyy'')';
        END IF;
        
        -- THAIDT: FINY-106 05/03/2026 Them dieu kien filter theo custype
        IF ( p_custtype IS NOT NULL ) THEN
            v_sql := v_sql || ' AND ttr.custtype = ''' || p_custtype || '''';
        END IF;

        --------------------------------------

        IF
            ( p_page <> 0 OR p_page IS NOT NULL ) AND ( p_size <> 0 OR p_page IS NOT NULL )
        THEN
            v_a := ( 1 + ( p_page * p_size ) - p_size );
            v_b := ( p_page * p_size );
            v_sql_res := 'SELECT * FROM ('
                         || v_sql
                         || ') WHERE stt BETWEEN '
                         || v_a
                         || ' AND '
                         || v_b;

        END IF;

        IF
            ( p_page = 0 OR p_page IS NULL ) AND ( p_size = 0 OR p_size IS NULL )
        THEN
            v_sql_res := v_sql;
        END IF;

        IF
            ( p_sorttype IS NOT NULL OR p_sorttype <> '' ) AND ( p_sortname IS NOT NULL OR p_sortname <> '' )
        THEN
            v_sql_res := v_sql_res
                         || ' ORDER BY '
                         || trim(upper(p_sortname))
                         || ' '
                         || trim(upper(p_sorttype));
        END IF;

        --pck_logs.insertLog('SQL_DEBUG', v_sql, 'PKG: SON_TEST.search_table_tmp_transaction_report');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM ('
                      || v_sql
                      || ')';
        EXECUTE IMMEDIATE v_sql_reto
        INTO pio_rec_total;
    END search_table_tmp_transaction_report;

    PROCEDURE transaction_report (
        p_refcursor     IN OUT  SYS_REFCURSOR,
        p_record_total  IN OUT  NUMBER,
        p_fullname      VARCHAR2,
        p_mobile        VARCHAR2,
        p_idnumber      VARCHAR2,
        p_documentno    VARCHAR2,
        p_branch        VARCHAR2,
        p_loantype      VARCHAR2,
        p_tranname      VARCHAR2,
        p_trandes       VARCHAR2,
        p_tranfromdate  VARCHAR2,
        p_trantodate    VARCHAR2,
        p_lnfromdate    VARCHAR2,
        p_lntodate      VARCHAR2,
        p_sorttype      VARCHAR2,
        p_sortname      VARCHAR2,
        p_page          VARCHAR2,
        p_size          VARCHAR2,
        p_mod           VARCHAR2,
        p_userid        VARCHAR2,
        p_custtype      VARCHAR2 -- -- THAIDT: FINY-106 05/03/2026 Them moi tham so  custtype
    ) IS

        v_except EXCEPTION;
        v_errcode      VARCHAR2(10);
        v_errmsg       VARCHAR2(200);
        v_date         DATE;
        vio_sql        VARCHAR2(1000);
        vio_rec_total  NUMBER;
        v_count        NUMBER;
        v_response     response_type;
    BEGIN
        v_response := pkg_validate.validate_report_common(p_tranfromdate, p_trantodate, p_sorttype, p_sortname, p_page,
                                    p_size, p_mod);

        IF v_response.v_errcode <> '00' THEN
            v_errcode := v_response.v_errcode;
            v_errmsg := v_response.v_errmsg;
            RAISE v_except;
        END IF;

        IF (
            ( p_lnfromdate IS NULL OR p_lnfromdate = '' ) AND ( p_lntodate IS NOT NULL OR p_lntodate <> '' )
        OR
            ( p_lnfromdate IS NOT NULL OR p_lnfromdate <> '' ) AND ( p_lntodate IS NULL OR p_lntodate = '' )
        ) THEN
            v_errcode := '01';
            v_errmsg := 'lnFromDate và lnToDate là bắt buộc';
            RAISE v_except;
        END IF;

        IF
            ( p_lnfromdate IS NOT NULL OR p_lnfromdate <> '' ) AND ( NOT regexp_like(p_lnfromdate, '^\d{2}/\d{2}/\d{4}$') )
        THEN
            v_errcode := '02';
            v_errmsg := 'lnFromDate không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            RAISE v_except;
        END IF;

        IF ( regexp_like(p_lnfromdate, '^\d{2}/\d{2}/\d{4}$') ) THEN
            BEGIN
                v_date := to_date(p_lnfromdate, 'dd/MM/yyyy');
            EXCEPTION
                WHEN OTHERS THEN
                    v_errcode := '03';
                    v_errmsg := 'lnFromDate không hợp lệ';
                    RAISE v_except;
            END;
        END IF;

        IF
            ( p_lntodate IS NOT NULL OR p_lntodate <> '' ) AND ( NOT regexp_like(p_lntodate, '^\d{2}/\d{2}/\d{4}$') )
        THEN
            v_errcode := '04';
            v_errmsg := 'lnToDate không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            RAISE v_except;
        END IF;

        IF ( regexp_like(p_lntodate, '^\d{2}/\d{2}/\d{4}$') ) THEN
            BEGIN
                v_date := to_date(p_lntodate, 'dd/MM/yyyy');
            EXCEPTION
                WHEN OTHERS THEN
                    v_errcode := '05';
                    v_errmsg := 'lnToDate không hợp lệ';
                    RAISE v_except;
            END;
        END IF;

        IF ( p_userid IS NULL OR p_userid = '' ) THEN
            v_errcode := '06';
            v_errmsg := 'userId là bắt buộc';
            RAISE v_except;
        END IF;

    ---------------

        IF trim(upper(p_mod)) = 'SEARCH' THEN
            search_table_tmp_transaction_report(vio_sql, vio_rec_total, p_fullname, p_mobile, p_idnumber,
                                                p_documentno, p_branch, p_loantype, p_tranname, p_trandes,
                                                p_tranfromdate, p_trantodate, p_lnfromdate, p_lntodate, p_sorttype,
                                                p_sortname, p_page, p_size, p_userid, p_custtype); -- Truyen them p_custtype
        ELSIF trim(upper(p_mod)) = 'EXPORT' THEN
            search_table_tmp_transaction_report(vio_sql, vio_rec_total, p_fullname, p_mobile, p_idnumber,
                                                p_documentno, p_branch, p_loantype, p_tranname, p_trandes,
                                                p_tranfromdate, p_trantodate, p_lnfromdate, p_lntodate, p_sorttype,
                                                p_sortname, 0, 0, p_userid, p_custtype); -- THAIDT: FINY-106 05/03/2026 Them moi tham so  custtype
        ELSE
            v_errcode := '11';
            v_errmsg := 'mod không đúng';
            RAISE v_except;
        END IF;

        p_record_total := 0;
        p_record_total := vio_rec_total;
        OPEN p_refcursor FOR vio_sql;

    EXCEPTION
        WHEN v_except THEN
            p_record_total := 0;
            OPEN p_refcursor FOR SELECT
                                     v_errcode  AS v_code,
                                     v_errmsg   AS v_desc
                                 FROM
                                     dual;

    END transaction_report;

    PROCEDURE init_table_tmp_estpayment_report
    IS

        v_currDate       varchar2(20);
        v_except         EXCEPTION;

    BEGIN

        EXECUTE IMMEDIATE 'TRUNCATE TABLE TMP_ESTPAYMENT_REPORT';
        COMMIT;

        select to_char(dateval, 'dd/MM/yyyy') into v_currDate from businessdate where datetype = 'CURRDATE';
        -- THAIDT: FINY-106 05/03/2026 them custtype cau insert
        INSERT INTO TMP_ESTPAYMENT_REPORT (
        loanscheduleid, fullname, mobile, idnumber, documentno, duedate, prinnml, estint, estprin, dueno, sale, branch, estintfee,
        estassetfee, estexpertisefee, loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province, total, custtype
        )
           -- THAIDT: FINY-106 05/03/2026 them custtype cau select
        SELECT
            loanscheduleid, fullname, mobile, idnumber, documentno, duedate, prinnml, estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee,
            loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province, (prinnml + estint) as total, custtype
        FROM (
            select
                loanscheduleid, fullname, mobile, idnumber, documentno, duedate,
                (case when duedate < to_date(v_currDate, 'dd/MM/yyyy') then prinovd + prinpaid else prinnml end) prinnml,
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, loantype, term, lndate,
                lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province, custtype
            from (
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint,
                    round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                    round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                    round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id as saleid,
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass,
                    c.id custid,
                    b.bid branchid,
                    b.aid areaid,
                    b.rid regionid,
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                    fn_build_address(c.residenceaddress,  w.wname,  d.dname,  p.pname) AS address,
                    COALESCE(c.residenceaddress, '') AS addressdetail,
                    COALESCE(w.wname, '') as ward,
                    COALESCE(d.dname, '') as district,
                    COALESCE(p.pname, '') as province,
                 -- THAIDT: FINY-106 05/03/2026 them custtype cau insert
                   (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al,
                    ward w, district d, province p
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(trunc(to_date(v_currDate, 'dd/MM/yyyy'), 'MM'), 1)
                    and c.residencewardid = w.id and c.residencedistrictid = d.id(+) and c.residenceprovinceid = p.id
                    and ls.dueno <= l.term
                    
                union all

                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch, ls.estint,
                        round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) estintfee,
                        round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) estassetfee,
                        round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) estexpertisefee,
            --                (case when ls.duedate <= to_date(v_currDate, 'dd/MM/yyyy') or (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > ls.estint then
            --                    (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
            --                    else ls.estint end) estint,
            --                (case when ls.duedate <= to_date(v_currDate, 'dd/MM/yyyy') or (ls.intnml+ls.intovd+ls.intpaid) > round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) then
            --                    (ls.intnml+ls.intovd+ls.intpaid)
            --                    else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
            --                (case when ls.duedate <= to_date(v_currDate, 'dd/MM/yyyy') or (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid) > round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) then
            --                    (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
            --                    else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
            --                (case when ls.duedate <= to_date(v_currDate, 'dd/MM/yyyy') or (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid) > round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) then
            --                    (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
            --                    else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id as saleid,
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2)
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') -1)
                    end) lnclass,
                    c.id custid,
                    b.bid branchid,
                    b.aid areaid,
                    b.rid regionid,
                      fn_build_address(c.residenceaddress,  w.wname,  d.dname,  p.pname) AS address,
                    COALESCE(c.residenceaddress, '') AS addressdetail,
                    COALESCE(w.wname, '') as ward,
                    COALESCE(d.dname, '') as district,
                    COALESCE(p.pname, '') as province,
                     -- THAIDT: FINY-106 05/03/2026 them custtype cau insert
                   (CASE WHEN c.custtype = '2' THEN '2' ELSE '1' END) AS custtype
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al,
                    ward w, district d, province p
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 1
                                                or (ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5'
                                                    and h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr') - 2
                                                    )
                                            )
                    and h.prinnml + h.prinovd > 0 and l.status = '1'
                    and c.residencewardid = w.id and c.residencedistrictid = d.id(+) and c.residenceprovinceid = p.id
                    and ls.dueno <= l.term
            )
        ) a;
        COMMIT;
        pkg_jobs.updateJob('ESTPAYMENT', 'D', 'bc dự thu');

        EXCEPTION
            WHEN v_except THEN
                pck_logs.insertLog('SQL_DEBUG', 'Lỗi control',                     'PCK_REPORT.init_table_tmp_estpayment_report');
            WHEN OTHERS THEN
                pck_logs.insertLog('SQL_DEBUG', 'Lỗi không xác định: ' || SQLERRM, 'PCK_REPORT.init_table_tmp_estpayment_report');

    END init_table_tmp_estpayment_report;


    PROCEDURE search_table_tmp_estpayment_report (
                                    pio_sql IN OUT varchar2,
                                    pio_rec_total IN OUT number,
                                    p_fullName varchar2,
                                    p_mobile varchar2,
                                    p_idNumber varchar2,
                                    p_documentno varchar2,
                                    p_branch varchar2,
                                    p_fromDate varchar2,
                                    p_toDate varchar2,
                                    p_sortType varchar2,
                                    p_sortName varchar2,
                                    p_page varchar2,
                                    p_size varchar2,
                                    p_userId varchar2,
                                    p_debtGroup varchar2,
                                    p_custtype  varchar2     -- THAIDT: FINY-106 05/03/2026 them custtype de filter
    ) IS

        v_sql varchar2(1000);
        v_sql_res varchar2(1000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(1000);
        v_role number;
        v_branch varchar(10);
        v_area varchar(10);
        v_region varchar(10);
        v_str varchar2(1000);
        v_debtGroup_str varchar2(1000);  --ThaiDT FINY-92 Date 08/01/2026

    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY LOANSCHEDULEID) AS stt, ter.* FROM VITATEST.tmp_estpayment_report ter WHERE 1=1';

        select role, branch into v_role, v_branch from admin_user where user_id = p_userId;
        select aid, rid into v_area, v_region from branch where bid = v_branch;

        -- phan quyen theo select
        IF (v_role = 2) THEN --Nhan vien kinh doanh (sale)
            v_sql := v_sql || ' AND ter.SALEID = ' || p_userId;

        ELSIF (v_role = 5) THEN --Truong phong giao dich
            v_sql := v_sql || ' AND ter.BRANCHID = ' || v_branch;

        ELSIF (v_role = 9) THEN --Giám đốc khu vực
            v_sql := v_sql || ' AND ter.AREAID = ' || v_area;

        ELSIF (v_role = 10) THEN --Giám đốc vùng
            v_sql := v_sql || ' AND ter.REGIONID = ' || v_region;

        ELSIF v_role in (1, 3, 4, 6, 7, 8, 11, 12, 13, 18, 20) THEN --Admin, Van hanh, Tham dinh, CGPD, CSKH, TP Nhan su, THN, CSKHNV
            v_sql := v_sql;

        END IF;

        --------------------------------------

        IF (p_fullName IS NOT NULL OR p_fullName <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ter.FULLNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_fullName))) || '%''';
        END IF;

        IF (p_mobile IS NOT NULL OR p_mobile <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ter.MOBILE)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_mobile))) || '%''';
        END IF;

        IF (p_idNumber IS NOT NULL OR p_idNumber <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ter.IDNUMBER)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_idNumber))) || '%''';
        END IF;

        IF (p_documentno IS NOT NULL OR p_documentno <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ter.DOCUMENTNO)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_documentno))) || '%''';
        END IF;

        IF (p_branch IS NOT NULL OR p_branch <> '') THEN
            v_str := '''' || REPLACE(TRIM(p_branch), ',', ''',''') || '''';
            v_sql := v_sql || ' AND ter.BRANCH IN (' || v_str || ')';
        END IF;

        IF (p_fromDate IS NOT NULL OR p_fromDate <> '') AND (p_toDate IS NOT NULL OR p_toDate <> '') THEN
            v_sql := v_sql || ' AND ter.DUEDATE  BETWEEN to_date('''|| p_fromDate ||''', ''dd/MM/yyyy'') AND to_date('''|| p_toDate ||''', ''dd/MM/yyyy'')';
        END IF;

        -- NEW: Filter by debtGroup (lnclass) - ThaiDT FINY-90 Date 08/01/2026
        IF (p_debtGroup IS NOT NULL AND LENGTH(TRIM(p_debtGroup)) > 0) THEN
            v_debtGroup_str := '''' || REPLACE(TRIM(p_debtGroup), ',', ''',''') || '''';
            v_sql := v_sql || ' AND TRIM(ter.LNCLASS) IN (' || v_debtGroup_str || ')';
        END IF;
        --------------------------------------

        --    -- THAIDT: FINY-106 05/03/2026 them Filter by custtype
        IF (p_custtype IS NOT NULL AND LENGTH(TRIM(p_custtype)) > 0) THEN
            v_sql := v_sql || ' AND ter.CUSTTYPE = ''' || TRIM(p_custtype) || '''';
        END IF;
        
        IF (p_page <> 0 or p_page is not null) AND (p_size <> 0  or p_page is not null) THEN
            v_A := (1 + (p_page * p_size) - p_size);
            v_B := (p_page * p_size);
            v_sql_res := 'SELECT * FROM (' || v_sql || ') WHERE stt BETWEEN '|| v_A ||' AND '|| v_B;
        END IF;

        IF (p_page = 0 or p_page is null) AND (p_size = 0 or p_size is null) THEN
            v_sql_res := v_sql;
        END IF;

        IF (p_sortType IS NOT NULL OR p_sortType <> '') AND (p_sortName IS NOT NULL OR p_sortName <> '') THEN
            v_sql_res := v_sql_res || ' ORDER BY ' || trim(upper(p_sortName)) || ' ' || trim(upper(p_sortType));
        END IF;

        pck_logs.insertLog('SQL_DEBUG', v_sql, 'PKG: SON_TEST.search_table_tmp_estpayment_report');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';
        EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

    END search_table_tmp_estpayment_report;

    PROCEDURE estpayment_report (
                                p_refcursor in out sys_refcursor,
                                p_record_total in out number,
                                p_fullName varchar2,
                                p_mobile varchar2,
                                p_idNumber varchar2,
                                p_documentno varchar2,
                                p_branch varchar2,
                                p_fromDate varchar2,
                                p_toDate varchar2,
                                p_sortType varchar2,
                                p_sortName varchar2,
                                p_page varchar2,
                                p_size varchar2,
                                p_mod varchar2,
                                p_userId varchar2,
                                p_debtGroup varchar2,
                                p_custtype  varchar2  -- THAIDT: FINY-106 05/03/2026 them custtype de filter
    )IS

        v_except  EXCEPTION;
        v_errcode varchar2(10);
        v_errmsg  varchar2(200);
        vio_sql varchar2(1000);
        vio_rec_total number;
        v_response RESPONSE_TYPE;

    BEGIN

        v_response := PKG_VALIDATE.validate_report_common(p_fromDate, p_toDate, p_sortType, p_sortName, p_page, p_size, p_mod);

        IF v_response.v_errcode <> '00' THEN
            v_errcode := v_response.v_errcode;
            v_errmsg  := v_response.v_errmsg;
            raise v_except;
        END IF;

        IF (p_userId IS NULL OR p_userId = '') THEN
            v_errcode := '11';
            v_errmsg  := 'userId là bắt buộc';
            raise v_except;
        END IF;

    ---------------

    IF trim(upper(p_mod)) = 'SEARCH' THEN
    -- THAIDT: FINY-106 05/03/2026 them custtype de filter
        search_table_tmp_estpayment_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_fromDate, p_toDate, p_sortType, p_sortName, p_page, p_size, p_userId, p_debtGroup, p_custtype);

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN
    -- THAIDT: FINY-106 05/03/2026 them custtype de filter
        search_table_tmp_estpayment_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_fromDate, p_toDate, p_sortType, p_sortName, 0, 0, p_userId, p_debtGroup, p_custtype);
    ELSE
        v_errcode := '12';
        v_errmsg  := 'mod không đúng';
        raise v_except;
    END IF;

    p_record_total := 0;
    p_record_total := vio_rec_total;

    OPEN p_refcursor FOR vio_sql;

    EXCEPTION when v_except then
        p_record_total := 0;
        open p_refcursor for
        select v_errcode as v_code, v_errmsg as v_desc from dual;
    END estpayment_report;
end;

-- báo cáo giao dịch
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM user_tab_columns 
    WHERE table_name = 'TMP_TRANSACTION_REPORT' AND column_name = 'CUSTTYPE';
    
    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE tmp_transaction_report ADD (custtype VARCHAR2(2) DEFAULT ''1'')';
    END IF;
END;
/

-- báo cáo dự thu
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM user_tab_columns 
    WHERE table_name = 'TMP_ESTPAYMENT_REPORT' AND column_name = 'CUSTTYPE';
    
    IF v_count = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE TMP_ESTPAYMENT_REPORT ADD (custtype VARCHAR2(2) DEFAULT ''1'')';
    END IF;
END;
/

ALTER TABLE tmp_report_provision_v2 ADD (custtype VARCHAR2(2));
/
ALTER TABLE tmp_avenue_report ADD (custtype VARCHAR2(2));
