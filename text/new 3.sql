
 CREATE OR REPLACE FUNCTION fn_build_address (
    p_address   IN VARCHAR2,
    p_ward      IN VARCHAR2,
    p_district  IN VARCHAR2,
    p_province  IN VARCHAR2
) RETURN VARCHAR2 DETERMINISTIC IS
    v_result VARCHAR2(1000);
BEGIN
    v_result := NULL;

    IF p_address IS NOT NULL THEN
        v_result := p_address;
    END IF;

    IF p_ward IS NOT NULL THEN
        v_result := v_result
                    || CASE WHEN v_result IS NOT NULL THEN ', ' END
                    || p_ward;
    END IF;

    IF p_district IS NOT NULL THEN
        v_result := v_result
                    || CASE WHEN v_result IS NOT NULL THEN ', ' END
                    || p_district;
    END IF;

    IF p_province IS NOT NULL THEN
        v_result := v_result
                    || CASE WHEN v_result IS NOT NULL THEN ', ' END
                    || p_province;
    END IF;

    RETURN v_result;
END;
/



create or replace package body          pck_report
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
    
    procedure operatorLoanSchedule(pv_refcursor in out sys_refcursor, pv_loanId number, pv_loanScheduleId number, pv_custId number, pv_fullName varchar, pv_mobile varchar, pv_idNumber varchar,  
                            pv_branch varchar, pv_payType varchar, pv_loanStatus varchar, pv_loanType varchar, pv_saleFullName varchar, pv_lnFromDate varchar, pv_lnToDate varchar, pv_userId number)
    is
        v_currDate date;
        v_role number(2);
        v_branch varchar(10);
        v_area varchar(10);
        v_region varchar(10);
    begin
        --Lay thong tin ngay lam viec
        select dateval into v_currDate from businessdate where datetype = 'CURRDATE';
        
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
            select loanid, loanscheduleid, custid, fullname, idnumber, mobile, lnclass, duedate, dueno, prinnml, prinovd, intnml, intovd, assetmanagementfee, 
                    assetmanagementovd, expertisefee, expertisefeeovd, feeovd, balance, areaname, 
                    (prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + expertisefee + expertisefeeovd + feeovd) total, 
                    prepaymentfee, paytype, loanstatus, loantype, salefullname, branch, documentno, ovddays, lndate, amount, term, prinpaid, intpaid, 
                    assetmanagementpaid, expertisefeepaid, feeovdpaid  
            from (
                    select l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                            s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                            (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                            (case when s.duedate >= to_date(to_char(sysdate,'dd/MM/yyyy'),'dd/MM/yyyy') 
                                        and prepaymentfeerate is not null
                                then round(s.prinnml*prepaymentfeerate/100,4) else 0 end) prepaymentfee,
                            al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname,  
                            s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid, 
                            (case when (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 then to_date(to_char(sysdate,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate else 0 end) ovddays  
                    from loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                    where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id and l.id = s.loanid and u.branch = b.bid and c.id = cb.custid and b.aid = ar.aid 
                            and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                            and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                            and l.status = '1' and lr.saleid = pv_userId  
            )
            where (loanid = pv_loanid or pv_loanid is null) and (loanscheduleid = pv_loanScheduleId or pv_loanScheduleId is null)  
                and (custid = pv_custId or pv_custId is null) and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
                and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) 
                and (duedate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (duedate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null)
                and (branch like '%' || pv_branch || '%' or pv_branch is null) and (paytype like '%' || pv_payType || '%' or pv_payType is null) 
                and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null) 
                and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
        elsif v_role = 5 then --Truong phong giao dich
            open pv_refcursor for
            select loanid, loanscheduleid, custid, fullname, idnumber, mobile, lnclass, duedate, dueno, prinnml, prinovd, intnml, intovd, assetmanagementfee, 
                    assetmanagementovd, expertisefee, expertisefeeovd, feeovd, balance, areaname, 
                    (prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + expertisefee + expertisefeeovd + feeovd) total, 
                    prepaymentfee, paytype, loanstatus, loantype, salefullname, branch, documentno, ovddays, lndate, amount, term, prinpaid, intpaid, 
                    assetmanagementpaid, expertisefeepaid, feeovdpaid  
            from (
                    select l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                            s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                            (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                            (case when s.duedate >= to_date(to_char(sysdate,'dd/MM/yyyy'),'dd/MM/yyyy') 
                                        and prepaymentfeerate is not null
                                then round(s.prinnml*prepaymentfeerate/100,4) else 0 end) prepaymentfee,
                            al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                            s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid, 
                            (case when (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 then to_date(to_char(sysdate,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate else 0 end) ovddays  
                    from loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                    where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id and l.id = s.loanid and u.branch = b.bid and c.id = cb.custid and b.aid = ar.aid 
                            and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                            and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                            and l.status = '1' and b.bid = v_branch 
            )
            where (loanid = pv_loanid or pv_loanid is null) and (loanscheduleid = pv_loanScheduleId or pv_loanScheduleId is null)  
                and (custid = pv_custId or pv_custId is null) and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
                and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) 
                and (duedate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (duedate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null)
                and (branch like '%' || pv_branch || '%' or pv_branch is null) and (paytype like '%' || pv_payType || '%' or pv_payType is null) 
                and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null) 
                and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
        elsif v_role = 9 then --Giam doc khu vuc
            open pv_refcursor for
            select loanid, loanscheduleid, custid, fullname, idnumber, mobile, lnclass, duedate, dueno, prinnml, prinovd, intnml, intovd, assetmanagementfee, 
                    assetmanagementovd, expertisefee, expertisefeeovd, feeovd, balance, areaname, 
                    (prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + expertisefee + expertisefeeovd + feeovd) total, 
                    prepaymentfee, paytype, loanstatus, loantype, salefullname, branch, documentno, ovddays, lndate, amount, term, prinpaid, intpaid, 
                    assetmanagementpaid, expertisefeepaid, feeovdpaid  
            from (
                    select l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                            s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                            (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                            (case when s.duedate >= to_date(to_char(sysdate,'dd/MM/yyyy'),'dd/MM/yyyy') 
                                        and prepaymentfeerate is not null
                                then round(s.prinnml*prepaymentfeerate/100,4) else 0 end) prepaymentfee,
                            al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                            s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid, 
                            (case when (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 then to_date(to_char(sysdate,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate else 0 end) ovddays  
                    from loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                    where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id and l.id = s.loanid and u.branch = b.bid and c.id = cb.custid and b.aid = ar.aid 
                            and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                            and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                            and l.status = '1' and b.aid = v_area 
            )
            where (loanid = pv_loanid or pv_loanid is null) and (loanscheduleid = pv_loanScheduleId or pv_loanScheduleId is null)  
                and (custid = pv_custId or pv_custId is null) and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
                and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) 
                and (duedate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (duedate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null)
                and (branch like '%' || pv_branch || '%' or pv_branch is null) and (paytype like '%' || pv_payType || '%' or pv_payType is null) 
                and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null) 
                and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
        elsif v_role = 10 then --Giam doc vung
            open pv_refcursor for
            select loanid, loanscheduleid, custid, fullname, idnumber, mobile, lnclass, duedate, dueno, prinnml, prinovd, intnml, intovd, assetmanagementfee, 
                    assetmanagementovd, expertisefee, expertisefeeovd, feeovd, balance, areaname, 
                    (prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + expertisefee + expertisefeeovd + feeovd) total, 
                    prepaymentfee, paytype, loanstatus, loantype, salefullname, branch, documentno, ovddays, lndate, amount, term, prinpaid, intpaid, 
                    assetmanagementpaid, expertisefeepaid, feeovdpaid  
            from (
                    select l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                            s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                            (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                            (case when s.duedate >= to_date(to_char(sysdate,'dd/MM/yyyy'),'dd/MM/yyyy') 
                                        and prepaymentfeerate is not null
                                then round(s.prinnml*prepaymentfeerate/100,4) else 0 end) prepaymentfee,
                            al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                            s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid,  
                            (case when (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 then to_date(to_char(sysdate,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate else 0 end) ovddays  
                    from loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                    where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id and l.id = s.loanid and u.branch = b.bid and c.id = cb.custid and b.aid = ar.aid 
                            and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                            and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                            and l.status = '1' and b.rid = v_region  
            )
            where (loanid = pv_loanid or pv_loanid is null) and (loanscheduleid = pv_loanScheduleId or pv_loanScheduleId is null)  
                and (custid = pv_custId or pv_custId is null) and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
                and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) 
                and (duedate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (duedate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null)
                and (branch like '%' || pv_branch || '%' or pv_branch is null) and (paytype like '%' || pv_payType || '%' or pv_payType is null) 
                and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null) 
                and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
        elsif v_role in (3,4,6,7,8,13,18) then --Van hanh, Tham dinh, CGPD, TP Nhan su    
            open pv_refcursor for
            select loanid, loanscheduleid, custid, fullname, idnumber, mobile, lnclass, duedate, dueno, prinnml, prinovd, intnml, intovd, assetmanagementfee, 
                    assetmanagementovd, expertisefee, expertisefeeovd, feeovd, balance, areaname, 
                    (prinnml + prinovd + intnml + intovd + assetmanagementfee + assetmanagementovd + expertisefee + expertisefeeovd + feeovd) total, 
                    prepaymentfee, paytype, loanstatus, loantype, salefullname, branch, documentno, ovddays, lndate, amount, term, prinpaid, intpaid, 
                    assetmanagementpaid, expertisefeepaid, feeovdpaid  
            from (
                    select l.id loanid, s.id loanscheduleid, l.custid, c.fullname, c.idnumber, c.mobile, s.duedate, s.dueno, s.prinnml, s.prinovd, l.lnclass, 
                            s.intnml, s.intovd, s.assetmanagementfee, s.assetmanagementovd, s.expertisefee, s.expertisefeeovd, al2.name paytype, s.feeovd, 
                            (case when l.prinovd + l.intovd + l.assetmanagementovd + l.feeovd > 0 then 'Quá hạn' else 'Trong hạn' end) loanstatus, 
                            (case when s.duedate >= to_date(to_char(sysdate,'dd/MM/yyyy'),'dd/MM/yyyy') 
                                        and prepaymentfeerate is not null
                                then round(s.prinnml*prepaymentfeerate/100,4) else 0 end) prepaymentfee,
                            al4.name loantype, u.full_name salefullname, b.name branch, l.documentno, l.lndate, l.amount, l.term, cb.balance, ar.name areaname, 
                            s.prinpaid, s.intpaid, s.assetmanagementpaid, s.expertisefeepaid, s.feeovdpaid,  
                            (case when (s.prinovd + s.intovd + s.assetmanagementovd + s.expertisefeeovd + s.feeovd) > 0 then to_date(to_char(sysdate,'dd/MM/rrrr'),'dd/MM/yyyy') - s.duedate else 0 end) ovddays  
                    from loan l, loanschedule s, customer c, allcode al2, loanregistration lr, allcode al4, admin_user u, branch b, customer_balance cb, area ar 
                    where l.custid = c.id and l.regid = lr.id and lr.saleid = u.user_id and l.id = s.loanid and u.branch = b.bid and c.id = cb.custid and b.aid = ar.aid 
                            and l.paytype = al2.code and al2.type = 'PAYTYPE' 
                            and trim(lr.loantype) = trim(al4.code) and al4.type = 'LOANTYPE' 
                            and l.status = '1' 
            )
            where (loanid = pv_loanid or pv_loanid is null) and (loanscheduleid = pv_loanScheduleId or pv_loanScheduleId is null)  
                and (custid = pv_custId or pv_custId is null) and (fullname like '%' || pv_fullName || '%' or pv_fullName is null) 
                and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) 
                and (duedate >= to_date(pv_lnFromDate, 'yyyyMMdd') or pv_lnFromDate is null) and (duedate <= to_date(pv_lnToDate, 'yyyyMMdd') or pv_lnToDate is null)
                and (branch like '%' || pv_branch || '%' or pv_branch is null) and (paytype like '%' || pv_payType || '%' or pv_payType is null) 
                and (loanstatus like '%' || pv_loanStatus || '%' or pv_loanStatus is null) and (trim(loantype) like '%' || pv_loanType || '%' or pv_loanType is null) 
                and (salefullname like '%' || pv_saleFullName || '%' or pv_saleFullName is null);
        else
            open pv_refcursor for
            select null loanid, null loanscheduleid, null custid, null fullname, null idnumber, null mobile, null lnclass, null duedate, null dueno, null prinnml, null prinovd, null intnml, null intovd, null assetmanagementfee, 
                    null assetmanagementovd, null expertisefee, null expertisefeeovd, null feeovd, null total, null balance, null areaname, 
                    null prepaymentfee, null paytype, null loanstatus, null loantype, null salefullname, null branch, null documentno, null ovddays
            from dual;
        end if;
    end;
    
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (bname like '%' || pv_branch || '%' or pv_branch is null)
                and (tranname like '%' || pv_tranName || '%' or pv_tranName is null) and (trandes like '%' || pv_tranDes || '%' or pv_tranDes is null)   
                and (trandate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (trandate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
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
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass 
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1)
                    and r.saleid = pv_userId 
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,
                    (case when ls.duedate <= v_currDate then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate then (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate then (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate then (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id,  
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by duedate, branch, sale;
                
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
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid 
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.bid = v_branch  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,
                    (case when ls.duedate <= v_currDate then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate then (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate then (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate then (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id,  
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by duedate, branch, sale;
                
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
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass 
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.aid = v_area   
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,
                    (case when ls.duedate <= v_currDate then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate then (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate then (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate then (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by duedate, branch, sale;
                
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
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1'
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1) 
                    and b.rid = v_region  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,
                    (case when ls.duedate <= v_currDate then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate then (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate then (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate then (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
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
            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by duedate, branch, sale;
                
        elsif v_role in (3,4,6,7,8,13,18) then --Van hanh, Tham dinh, CGPD, TP Nhan su
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
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass  
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1' 
                    and ls.duedate >= add_months(to_date('01-' || ltrim(TO_CHAR(v_currDate - 1,'mm-yyyy'),'0'), 'dd/MM/rrrr'), 1)  
                union all
                select ls.id loanscheduleid, c.fullname, c.mobile, c.idnumber, l.documentno, ls.duedate, ls.prinnml, ls.prinovd, ls.prinpaid, ls.estprin, ls.dueno, u.full_name sale, b.name branch,
                    (case when ls.duedate <= v_currDate then
                        (ls.intnml+ls.intovd+ls.intpaid+ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid+ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else ls.estint end) estint,
                    (case when ls.duedate <= v_currDate then (ls.intnml+ls.intovd+ls.intpaid) 
                        else round(ls.estint*(l.rate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estintfee,
                    (case when ls.duedate <= v_currDate then (ls.assetmanagementfee+ls.assetmanagementovd+ls.assetmanagementpaid)
                        else round(ls.estint*(l.feerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estassetfee,
                    (case when ls.duedate <= v_currDate then (ls.expertisefee+ls.expertisefeeovd+ls.expertisefeepaid)
                        else round(ls.estint*(l.expertisefeerate/(l.rate+l.feerate+l.expertisefeerate)),4) end) estexpertisefee,  
                    al.name loantype, l.term, l.lndate, l.rate, l.feerate, l.expertisefeerate, u.user_id, 
                    (case when ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5' then
                        fn_cal_lnclass_by_date(l.custid, to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                        else fn_cal_lnclass_by_date(l.custid, to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr'))
                    end) lnclass  
                from customer c, loan l, loanhist h, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al 
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE'
                    and l.id = h.loanid and (h.businessdate = to_date('01-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                or ((ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '1' or ltrim(TO_CHAR(ls.duedate,'mm'),'0') = '5')
                                                    and h.businessdate = to_date('02-' || ltrim(TO_CHAR(ls.duedate,'mm-yyyy'),'0'), 'dd/MM/rrrr')
                                                    )
                                            ) 
                    and h.prinnml + h.prinovd > 0 and l.status = '1'
            ) 
--            where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
--                and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
--                and (branch like '%' || pv_branch || '%' or pv_branch is null) 
--                and (duedate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (duedate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null)
            order by duedate, branch, sale;
        else
            open pv_refcursor for
            select null loanscheduleid, null fullname, null mobile, null idnumber, null documentno, null duedate, 0 prinnml, 0 estint, 0 estprin, 0 dueno, null sale, 
                null branch, 0 estint, 0 estassetfee, 0 estexpertisefee, null loantype, null term, null lndate, null user_id from dual;
        end if;
    end;
    
    procedure outstandingLoan(pv_refcursor in out sys_refcursor, pv_userId number, pv_fullName varchar, pv_branch varchar, pv_fromDate varchar, pv_toDate varchar)
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
            select ROW_NUMBER() OVER(PARTITION BY 100 ORDER BY businessdate ) AS userid, fullname, branch, prinnml, businessdate, user_id from (
                select  fullname, branch, sum(prinnml) prinnml, businessdate, user_id from (
                    select u.full_name fullname, b.name branch, (h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id
                    from loanhist h, loan l, loanregistration r, admin_user u, branch b
                    where h.loanid = l.id and l.regid = r.id and r.saleid = u.user_id and u.branch = b.bid and u.user_id = pv_userId 
                )
                group by fullname, branch, businessdate, user_id
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (branch like '%' || pv_branch || '%' or pv_branch is null)
                    and (businessdate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (businessdate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        elsif v_role = 5 then --Truong phong giao dich
            open pv_refcursor for
            select ROW_NUMBER() OVER(PARTITION BY 100 ORDER BY businessdate ) AS userid, fullname, branch, prinnml, businessdate, user_id from (
                select fullname, branch, sum(prinnml) prinnml, businessdate, user_id from (
                    select u.full_name fullname, b.name branch, (h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id
                    from loanhist h, loan l, loanregistration r, admin_user u, branch b
                    where h.loanid = l.id and l.regid = r.id and r.saleid = u.user_id and u.branch = b.bid and b.bid = v_branch 
                )
                group by fullname, branch, businessdate, user_id
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (branch like '%' || pv_branch || '%' or pv_branch is null)
                    and (businessdate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (businessdate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        elsif v_role = 9 then --Giam doc khu vuc
            open pv_refcursor for
            select ROW_NUMBER() OVER(PARTITION BY 100 ORDER BY businessdate ) AS userid, fullname, branch, prinnml, businessdate, user_id from (
                select fullname, branch, sum(prinnml) prinnml, businessdate, user_id from (
                    select u.full_name fullname, b.name branch, (h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id
                    from loanhist h, loan l, loanregistration r, admin_user u, branch b
                    where h.loanid = l.id and l.regid = r.id and r.saleid = u.user_id and u.branch = b.bid and b.aid = v_area  
                )
                group by fullname, branch, businessdate, user_id
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (branch like '%' || pv_branch || '%' or pv_branch is null)
                    and (businessdate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (businessdate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        elsif v_role = 10 then --Giam doc vung
            open pv_refcursor for
            select ROW_NUMBER() OVER(PARTITION BY 100 ORDER BY businessdate ) AS userid, fullname, branch, prinnml, businessdate, user_id from (
                select fullname, branch, sum(prinnml) prinnml, businessdate, user_id from (
                    select u.full_name fullname, b.name branch, (h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id
                    from loanhist h, loan l, loanregistration r, admin_user u, branch b
                    where h.loanid = l.id and l.regid = r.id and r.saleid = u.user_id and u.branch = b.bid and b.rid = v_region  
                )
                group by fullname, branch, businessdate, user_id
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (branch like '%' || pv_branch || '%' or pv_branch is null)
                    and (businessdate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (businessdate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        elsif v_role in (3,4,6,7,8,13,18) then --Van hanh, Tham dinh, CGPD, TP Nhan su
            open pv_refcursor for
            select ROW_NUMBER() OVER(PARTITION BY 100 ORDER BY businessdate ) AS userid, fullname, branch, prinnml, businessdate, user_id from (
                select fullname, branch, sum(prinnml) prinnml, businessdate, user_id from (
                    select u.full_name fullname, b.name branch, (h.prinnml + h.prinovd) prinnml, h.businessdate, u.user_id 
                    from loanhist h, loan l, loanregistration r, admin_user u, branch b
                    where h.loanid = l.id and l.regid = r.id and r.saleid = u.user_id and u.branch = b.bid 
                )
                group by fullname, branch, businessdate, user_id
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (branch like '%' || pv_branch || '%' or pv_branch is null)
                    and (businessdate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (businessdate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        end if;
    end;
    
    procedure debtOvdManagement(pv_refcursor in out sys_refcursor, pv_documentNo varchar, pv_fullName varchar, pv_mobile varchar, pv_idNumber varchar, 
                                pv_branch varchar, pv_sale varchar, pv_lnClass varchar, pv_fromDate varchar, pv_toDate varchar, pv_userId number)
    is
        v_role number(2);
    begin
        begin
            select role into v_role from admin_user where user_id = pv_userId;
        exception when others then
            v_role := 0;
        end;
        
        
        if v_role = 12 then
            open pv_refcursor for
            select lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress, amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, 
                    total, prepaymentfee, productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid from (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname)    residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id,  
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userId) debtrecoveryid,
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id and d.adminuserid = pv_userId) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u, debt_recovery d 
                -- ThaiDT - FINY-82  Date 29/12/2025 - thêm (+) de thanh LEFT JOIN
                where l.custid = c.id and c.wardid(+) = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id(+) and c.residencewardid = w2.id(+) and c.residencedistrictid = d2.id(+) and l.id(+) = d.loanid 
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                        and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnClass || '%' or pv_lnClass is null)
                    and (lndate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (lndate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        elsif v_role in (3,4,6,7,8,11,13,18) then
            open pv_refcursor for
            select lid, documentno, custid, fullname, mobile, idnumber, lndate, term, address, residenceaddress, amount, lnclass, prinnml, prinovd, intnml, intovd, feeovd, 
                    total, prepaymentfee, productname, branchname, salename, debtrecoveryname, ovddays, user_id, debtrecoveryid from (
                select l.id lid, l.documentno, c.id custid, c.fullname, c.mobile, c.idnumber, l.lndate, l.term, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.address, w1.wname, d1.dname, p1.pname) address, 
                        -- ThaiDT - FINY-82 Update address : Date 29/12/2025
                        fn_build_address(c.residenceaddress, w2.wname, d2.dname, p2.pname)    residenceaddress,
                        l.amount, l.lnclass, l.prinnml, l.prinovd, (l.intnml + l.assetmanagementfee + l.expertisefee) intnml, 
                        (l.intovd + l.assetmanagementovd + l.expertisefeeovd) intovd, l.feeovd, 
                        (l.prinnml + l.prinovd + l.intnml + l.intovd + l.assetmanagementfee + l.assetmanagementovd + l.expertisefee + l.expertisefeeovd + l.feeovd) total, 
                        l.prinnml*l.prepaymentfeerate/100 prepaymentfee, al.name productname, b.name branchname, u.full_name salename, u.user_id, 
                        (select d.adminuserid from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryid,
                        (select full_name from admin_user u, debt_recovery d where u.user_id = d.adminuserid and loanid = l.id) debtrecoveryname, 
                        fn_cal_loan_ovddays(l.id) ovddays
                from loan l, customer c, ward w1, district d1, province p1, ward w2, district d2, province p2, loanregistration lr, allcode al, branch b, admin_user u
                 -- ThaiDT - FINY-82  Date 29/12/2025 - thêm (+) de thanh LEFT JOIN
                where l.custid = c.id and c.wardid = w1.id and c.districtid = d1.id(+) and c.provinceid = p1.id and c.residencewardid = w2.id and c.residencedistrictid = d2.id(+)
                        and c.residenceprovinceid = p2.id and l.regid = lr.id and trim(lr.loantype) = trim(al.code) and al.type = 'LOANTYPE' and lr.saleid = u.user_id and u.branch = b.bid 
                        and l.prinovd + l.intovd + l.assetmanagementovd + l.expertisefeeovd + l.feeovd > 0
            ) where (fullname like '%' || pv_fullName || '%' or pv_fullName is null) and (mobile like '%' || pv_mobile || '%' or pv_mobile is null) 
                    and (idnumber like '%' || pv_idNumber || '%' or pv_idNumber is null) and (documentno like '%' || pv_documentNo || '%' or pv_documentNo is null)
                    and (branchname like '%' || pv_branch || '%' or pv_branch is null) and (salename like '%' || pv_sale || '%' or pv_sale is null) 
                    and (lnclass like '%' || pv_lnClass || '%' or pv_lnClass is null)
                    and (lndate >= to_date(pv_fromDate, 'yyyyMMdd') or pv_fromDate is null) and (lndate <= to_date(pv_toDate, 'yyyyMMdd') or pv_toDate is null);
        else
            open pv_refcursor for
            select null lid, null documentno, null custid, null fullname, null mobile, null idnumber, null lndate, null term, null address, null residenceaddress, 0 amount, 
                    null lnclass, 0 prinnml, 0 prinovd, 0 intnml, 0 intovd, 0 feeovd, 0 total, 0 prepaymentfee, null productname, null branchname, null salename, null user_id, null debtrecoveryid, null debtrecoveryname from dual;
        end if;
    end;
    
    
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
    v_so_tien_trich_lap_prev       number;
    v_tong_trich_lap_cong_don_prev number;
    v_hoan_nhap_prev               number;
    v_tong_hoan_nhap_prev          number;
    v_thu_nhap_bat_thuong_prev     number;

    BEGIN
        FOR rec IN (
            SELECT 
                upper(c.fullname) as ten_kh,
                l.documentno as so_hd,
                b.bid,
                b.name as pgd,
                c.id AS custid,
                lh.loanid,  
                lh.BUSINESSDATE AS batch_date,
                TRIM(lh.LNCLASS) AS nhom_no,
                l.amount as goc_ban_dau,
                (lh.prinnml + lh.prinovd) as goc_con_lai,
                fn_cal_provision(TRIM(lh.LNCLASS)) AS trich_lap
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
                lh.BUSINESSDATE = LAST_DAY(lh.BUSINESSDATE)
                and trunc(lh.BUSINESSDATE) = trunc(p_batch_date)
            ORDER BY c.id, lh.loanid, lh.BUSINESSDATE
        
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
                SELECT batch_date,      nhom_no,        goc_con_lai,        so_tien_trich_lap,        tong_trich_lap_cong_don,        hoan_nhap,        tong_hoan_nhap,        thu_nhap_bat_thuong
                INTO v_batch_date_prev, v_nhom_no_prev, v_goc_con_lai_prev, v_so_tien_trich_lap_prev, v_tong_trich_lap_cong_don_prev, v_hoan_nhap_prev, v_tong_hoan_nhap_prev, v_thu_nhap_bat_thuong_prev
                FROM TMP_REPORT_PROVISION_V2
                WHERE custid = rec.custid AND loanid = rec.loanid
                ORDER BY batch_date DESC
                FETCH FIRST 1 ROW ONLY;
                
                INSERT INTO TMP_REPORT_PROVISION_V2 (created_time, ten_kh, so_hd, bid, pgd, custid, loanid, batch_date, nhom_no, goc_ban_dau, goc_con_lai, trich_lap, so_tien_trich_lap, hoan_nhap, thu_nhap_bat_thuong, 
                tong_trich_lap_cong_don, tong_hoan_nhap)
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
                    rec.goc_con_lai,
                    rec.trich_lap,
                    
                    
                    CASE
                        -- nhóm nợ giữ nguyên hoặc nhóm nợ từ Bto về Bbé
                        WHEN (v_nhom_no_prev = rec.nhom_no) OR (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(rec.nhom_no, 2, 1))) THEN 0
                        ELSE ABS(((fn_cal_provision(rec.nhom_no) * rec.goc_con_lai) / 100) - v_tong_trich_lap_cong_don_prev)
                    END AS so_tien_trich_lap,
                    
                    
                    CASE 
                        WHEN rec.nhom_no = 'B4' THEN 0
                                -- tu B3 -> B2, B1 ...
                        WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(rec.nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3) 
                             OR 
                                -- giu nguyen nhom no nhung goc con lai giam
                             (v_nhom_no_prev = rec.nhom_no AND (rec.goc_con_lai < v_goc_con_lai_prev) )
                        THEN 
                              v_tong_trich_lap_cong_don_prev - (rec.goc_con_lai * (rec.trich_lap/100) )
                        ELSE  0
                    END AS hoan_nhap,
                    
                    
                    CASE 
                        WHEN v_nhom_no_prev = 'B4' THEN v_goc_con_lai_prev - rec.goc_con_lai
                        ELSE 0
                    END AS thu_nhap_bat_thuong,
                    
                    
                    ABS(
                        v_tong_trich_lap_cong_don_prev 
                    + 
                        CASE
                            -- nhóm nợ giữ nguyên hoặc nhóm nợ từ Bto về Bbé
                            WHEN (v_nhom_no_prev = rec.nhom_no) OR (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(rec.nhom_no, 2, 1))) THEN 0
                            ELSE ABS(((fn_cal_provision(rec.nhom_no) * rec.goc_con_lai) / 100) - v_tong_trich_lap_cong_don_prev)
                        END --so_tien_trich_lap
                    -
                        (CASE 
                            WHEN rec.nhom_no = 'B4' THEN 0
                                    -- tu B3 -> B2, B1 ...
                            WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(rec.nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3) 
                                 OR 
                                    -- giu nguyen nhom no nhung goc con lai giam
                                 (v_nhom_no_prev = rec.nhom_no AND (rec.goc_con_lai < v_goc_con_lai_prev) )
                            THEN 
                                  v_tong_trich_lap_cong_don_prev - (rec.goc_con_lai * (rec.trich_lap/100) )
                            ELSE  0
                        END) -- hoan_nhap
                    -
                        (CASE 
                            WHEN v_nhom_no_prev = 'B4' THEN v_goc_con_lai_prev - rec.goc_con_lai
                            ELSE 0
                        END) -- thu_nhap_bat_thuong
                    ) AS tong_trich_lap_cong_don,
                    
                    
                    (
                        v_tong_hoan_nhap_prev 
                    +
                        CASE 
                            WHEN rec.nhom_no = 'B4' THEN 0
                                -- tu B3 -> B2, B1 ...
                            WHEN (TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) > TO_NUMBER(SUBSTR(rec.nhom_no, 2, 1)) AND TO_NUMBER(SUBSTR(v_nhom_no_prev, 2, 1)) <= 3) 
                                 OR 
                                    -- giu nguyen nhom no nhung goc con lai giam
                                 (v_nhom_no_prev = rec.nhom_no AND (rec.goc_con_lai < v_goc_con_lai_prev) )
                            THEN 
                                  v_tong_trich_lap_cong_don_prev - (rec.goc_con_lai * (rec.trich_lap/100) )
                            ELSE  0
                        END -- hoan_nhap
                    ) AS tong_hoan_nhap
                    
                    
                FROM dual;
                COMMIT;
                
            -- khong co ban ghi trong bang TMP_REPORT_PROVISION_V2 => user moi
            ELSE 
                INSERT INTO TMP_REPORT_PROVISION_V2 (created_time, ten_kh, so_hd, bid, pgd, custid, loanid, batch_date, nhom_no, goc_ban_dau, goc_con_lai, trich_lap, so_tien_trich_lap, hoan_nhap, thu_nhap_bat_thuong, 
                tong_trich_lap_cong_don, tong_hoan_nhap)
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
                    rec.goc_con_lai,
                    rec.trich_lap,
                    ((rec.trich_lap * rec.goc_con_lai) / 100) AS so_tien_trich_lap,
                    0 AS hoan_nhap,
                    0 AS thu_nhap_bat_thuong,
                    ((rec.trich_lap * rec.goc_con_lai) / 100) AS tong_trich_lap_cong_don,
                    0 AS tong_hoan_nhap
                FROM dual;
                COMMIT;
            END IF;
        
        END LOOP;
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
                                p_size varchar2
    )
    IS
    
        v_sql varchar2(1000);
        v_sql_res varchar2(1000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(1000);
        
    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY custid) AS stt, trp.* FROM VITA.tmp_report_provision_v2 trp WHERE 1=1';

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

--        IF (
--            (p_sort_name IS NOT NULL OR p_sort_name <> '')
--            AND
--            (trim(lower(p_sort_name)) NOT IN 
--            ('created_time', 'custid', 'kv', 'pgd', 'ten_kh', 'sp_vay', 'so_hd', 'so_tien_vay', 'ky_han_vay', 'ngay_giai_ngan', 'ngay_dao_han', 'du_no', 'nhom_no', 'ngay_cham_tra', 'trich_lap', 'so_tien_trich_lap'))
--        ) THEN
--            v_errcode := '07';
--            v_errmsg := 'sort_name = '|| p_sort_name ||' là không đúng';
--            raise v_except;
--        END IF;

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

    IF trim(upper(p_mod)) = 'SEARCH' THEN

        search_table_tmp_report_provision_v2 (vio_sql, vio_rec_total, p_ten_kh, p_so_hd, p_ma_pgd, p_ten_pgd, p_nhom_no, p_from_date, p_to_date, p_sort_type, p_sort_name, p_page, p_size);

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN

        search_table_tmp_report_provision_v2 (vio_sql, vio_rec_total, p_ten_kh, p_so_hd, p_ma_pgd, p_ten_pgd, p_nhom_no, p_from_date, p_to_date, p_sort_type, p_sort_name, 0, 0);

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
                                                pv_size in varchar2                                                 
                                               ) IS 
        v_count number;
        v_sql CLOB;
        v_sql_res varchar2(4000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(4000);
        
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
            v_sql := '
            CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
            SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1, 
                   l2.lnclass class2, l2.debt debt2, l1.loantype, l1.branchname, l1.areaname,
                   -- [ADDED] Cac truong moi
                   l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code
            FROM 
            (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, 
                (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,
                -- [ADDED] Lay thong tin moi trong l1
                l.documentno, 
                u.full_name as sale_name, 
                u.user_code as sale_code,
                (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
                        (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
            EXECUTE IMMEDIATE v_sql;

        elsif pv_role = 10 then
            v_sql := '
            CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
            SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1, 
                   l2.lnclass class2, l2.debt debt2,l1.loantype, l1.branchname, l1.areaname,
                   -- [ADDED] Cac truong moi
                   l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code
            FROM 
            (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, 
                (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,
              
                l.documentno, 
                u.full_name as sale_name, 
                u.user_code as sale_code,
                (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
                        (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
            EXECUTE IMMEDIATE v_sql;

        else
            v_sql := '
            CREATE TABLE TMP_CONVERSION_RATE_REPORT AS
            SELECT l1.fullname, l1.lndate, l1.amount, l1.loanid, l1.lnclass class1, l1.debt debt1, 
                   l2.lnclass class2, l2.debt debt2,l1.loantype, l1.branchname, l1.areaname,
                   -- [ADDED] Cac truong moi
                   l1.documentno, l1.sale_name, l1.sale_code, l1.recovery_name, l1.recovery_code
            FROM 
            (SELECT c.fullname, l.lndate, l.amount, h.loanid, h.businessdate, h.lnclass, 
                (h.prinnml + h.prinovd) debt,al.name loantype, b.name branchname, a.name areaname,
               
                l.documentno, 
                u.full_name as sale_name, 
                u.user_code as sale_code,
                (SELECT full_name FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_name,
                (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
                        (SELECT user_code FROM admin_user ad, debt_recovery dr WHERE dr.loanid = l.id and dr.adminuserid = ad.user_id and rownum = 1) as recovery_code
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
            EXECUTE IMMEDIATE v_sql;
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
                                    pv_mod varchar2
                                    ) 
        IS       
        v_role number(2);
        v_branch varchar(10);
        v_area varchar(10);
        v_region varchar(10);
        v_except  EXCEPTION;
        v_errcode varchar2(10);
        v_errmsg  varchar2(1000);
        vio_sql varchar2(1000);
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
            if v_role in (3,4,6,8,9,10,13,18) then
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
            IF ((pv_fromDate IS NULL OR pv_fromDate = '') AND (pv_toDate IS NOT NULL OR pv_toDate <> '')
                OR
                (pv_fromDate IS NOT NULL OR pv_fromDate <> '') AND (pv_toDate IS NULL OR pv_toDate = '')) THEN
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
                                                pv_size
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
                                                0
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
                        p_idnumber varchar2
    ) 

    IS 
        v_sql varchar2(3000);
        v_sql_res varchar2(4000);
        v_sql_reto varchar2(4000);
        v_A number;
        v_B number;
        
    BEGIN
    
        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY custid) AS stt, tar.* FROM VITATEST.tmp_avenue_report tar WHERE 1=1';
        
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
            v_sql := v_sql || ' AND tar.idnumber like ''%'  || p_idnumber || '%'''; 
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

    PROCEDURE avenuereport(p_refcursor in out sys_refcursor,
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
                            p_userId varchar2)
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
    
        IF v_role in (4,6,13) then
            
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
                search_table_avenue_report(pio_sql, pio_rec_total, p_fromDate, p_toDate, p_customerName, p_documentNo, p_productName, p_term, p_lnClass, p_sortType, p_sortName, p_page, p_size, p_invoice, p_idnumber);
                                                
            elsif trim(upper(p_mod)) = 'EXPORT' then
                search_table_avenue_report(pio_sql, pio_rec_total, p_fromDate, p_toDate, p_customerName, p_documentNo, p_productName, p_term, p_lnClass, p_sortType, p_sortName, 0, 0, p_invoice, p_idnumber);
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


    PROCEDURE init_table_tmp_transaction_report
    IS 
    BEGIN 
        INSERT INTO VITA.tmp_transaction_report (id, fullname, mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid)
        SELECT * FROM (
            select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid from (
                select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                (case when t.ref is not null and trandes like 'Thanh toán%' then (
                    select dueno from loanschedule where id in (select loanscheduleid from loantransaction where id = t.ref)) 
                else null end) dueno, 
                ln.documentno, ln.lndate, ln.loantype, u.branch, r.saleid
                from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt, loanschedule ls,  
                    (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                    (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                    and t.ref = lt.id and lt.loanscheduleid = ls.id and ls.loanid = ln.id and t.trancode <> '1' and lower(t.trandes) not like '%tất toán%' and lower(t.trandes) not like '%phí phạt trước hạn%' and t.status = '1'  
            )
            union all
            select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid from (
                select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                null dueno, ln.documentno, ln.lndate, ln.loantype, u.branch, r.saleid
                from customer c, admin_user u, branch b, transaction t, allcode a, loantransaction lt,   
                    (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r, 
                    (select l.id, l.documentno, l.lndate, al.name loantype from loan l, loanregistration lr, allcode al where l.regid = lr.id and trim(lr.loantype )= trim(al.code) and al.type = 'LOANTYPE') ln
                where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                    and t.ref = lt.id and lt.loanscheduleid = ln.id and lower(t.trandes) like '%phí phạt trước hạn%' and t.status = '1'  
            )
            union all
            select distinct id, upper(fullname), mobile, idnumber, bname, trandate, tranname, tranvalue, trandes, dueno, documentno, lndate, loantype, branch, saleid from (
                select t.id, c.fullname, c.mobile, c.idnumber, b.name bname, t.trandate, a.name tranname, t.tranvalue, t.trandes, 
                null dueno, null documentno, null lndate, null loantype, u.branch, r.saleid
                from customer c, admin_user u, branch b, transaction t, allcode a,  
                    (select custid, saleid from loanregistration where id in (select max(id) from loanregistration group by custid)) r
                where c.id = t.custid and t.custid = r.custid and r.saleid = u.user_id and u.branch = b.bid and t.trancode like '%' || a.code || '%' and a.type = 'TRANCODE'
                    and t.trancode = '1' and t.status = '1'  
            )
        ) a --where trandate = '08-APR-2025' 
        WHERE NOT EXISTS (select * from VITA.tmp_transaction_report b where a.id = b.id);
        COMMIT;
    END init_table_tmp_transaction_report;
    
                                
    PROCEDURE search_table_tmp_transaction_report (
                                pio_sql IN OUT varchar2,
                                pio_rec_total IN OUT number,
                                p_fullName varchar2, 
                                p_mobile varchar2, 
                                p_idNumber varchar2,
                                p_documentno varchar2,
                                p_branch varchar2,
                                p_loanType varchar2,
                                p_tranName varchar2,
                                p_tranDes varchar2,
                                p_tranFromDate varchar2,
                                p_tranToDate varchar2,
                                p_lnFromDate varchar2,
                                p_lnToDate varchar2,
                                p_sortType varchar2,
                                p_sortName varchar2,
                                p_page varchar2,
                                p_size varchar2,
                                p_userId varchar2
    )
    IS
    
        v_sql varchar2(1000);
        v_sql_res varchar2(1000);
        v_A number;
        v_B number;
        v_sql_reto varchar2(1000);
        v_role number(2);
        v_branch varchar(10);
        v_str varchar2(1000);
        
    BEGIN

        v_sql := 'SELECT ROW_NUMBER() OVER (ORDER BY id) AS stt, ttr.* FROM VITA.tmp_transaction_report ttr WHERE 1=1';
        
        select role, branch into v_role, v_branch from admin_user where user_id = p_userId;
        
        IF (v_role = 2) THEN --Nhan vien kinh doanh (sale)
            v_sql := v_sql || ' AND ttr.SALEID = ' || p_userId;
            
        ELSIF (v_role = 5) THEN --Truong phong giao dich
            v_sql := v_sql || ' AND ttr.BRANCH = ' || v_branch;
            
        ELSIF v_role in (3, 4, 6, 7, 8, 11, 12, 13, 18) THEN --Van hanh, Tham dinh, CGPD, TP Nhan su, THN
            v_sql := v_sql;
            
        END IF;
        
        --------------------------------------
        
        IF (p_fullName IS NOT NULL OR p_fullName <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.FULLNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_fullName))) || '%''';
        END IF;

        IF (p_mobile IS NOT NULL OR p_mobile <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.MOBILE)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_mobile))) || '%''';
        END IF;

        IF (p_idNumber IS NOT NULL OR p_idNumber <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.IDNUMBER)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_idNumber))) || '%''';
        END IF;

        IF (p_documentno IS NOT NULL OR p_documentno <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.DOCUMENTNO)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_documentno))) || '%''';
        END IF;

--        IF (p_branch IS NOT NULL OR p_branch <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.BNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_branch))) || '%''';
--        END IF;
        
        IF (p_branch IS NOT NULL OR p_branch <> '') THEN
            v_str := '''' || REPLACE(TRIM(p_branch), ',', ''',''') || '''';
            v_sql := v_sql || ' AND ttr.BNAME IN (' || v_str || ')';
        END IF;

--        IF (p_loanType IS NOT NULL OR p_loanType <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.LOANTYPE)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_loanType))) || '%''';
--        END IF;
        
        IF (p_loanType IS NOT NULL OR p_loanType <> '') THEN
            v_str := '''' || REPLACE(TRIM(p_loanType), ',', ''',''') || '''';
            v_sql := v_sql || ' AND ttr.LOANTYPE IN (' || v_str || ')';
        END IF;

--        IF (p_tranName IS NOT NULL OR p_tranName <> '') THEN
--            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.TRANNAME)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_tranName))) || '%''';
--        END IF;
        
        IF (p_tranName IS NOT NULL OR p_tranName <> '') THEN
            v_str := '''' || REPLACE(TRIM(p_tranName), ',', ''',''') || '''';
            v_sql := v_sql || ' AND ttr.TRANNAME IN (' || v_str || ')';
        END IF;

        IF (p_tranDes IS NOT NULL OR p_tranDes <> '') THEN
            v_sql := v_sql || ' AND upper(CONVERTTOUNSIGN(ttr.TRANDES)) like ''%' || trim(upper(CONVERTTOUNSIGN(p_tranDes))) || '%''';
        END IF;

        IF (p_tranFromDate IS NOT NULL OR p_tranFromDate <> '') AND (p_tranToDate IS NOT NULL OR p_tranToDate <> '') THEN
            v_sql := v_sql || ' AND ttr.TRANDATE  BETWEEN to_date('''|| p_tranFromDate ||''', ''dd/MM/yyyy'') AND to_date('''|| p_tranToDate ||''', ''dd/MM/yyyy'')';
        END IF;
        
        IF (p_lnFromDate IS NOT NULL OR p_lnFromDate <> '') AND (p_lnToDate IS NOT NULL OR p_lnToDate <> '') THEN
            v_sql := v_sql || ' AND ttr.LNDATE  BETWEEN to_date('''|| p_lnFromDate ||''', ''dd/MM/yyyy'') AND to_date('''|| p_lnToDate ||''', ''dd/MM/yyyy'')';
        END IF;
        
        --------------------------------------

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

        --pck_logs.insertLog('SQL_DEBUG', v_sql, 'PKG: SON_TEST.search_table_tmp_transaction_report');

        pio_sql := v_sql_res;
        v_sql_reto := 'SELECT count(*) FROM (' || v_sql || ')';
        EXECUTE IMMEDIATE v_sql_reto INTO pio_rec_total;

    END search_table_tmp_transaction_report;
    
    PROCEDURE transaction_report (
                                p_refcursor in out sys_refcursor, 
                                p_record_total in out number,
                                p_fullName varchar2, 
                                p_mobile varchar2, 
                                p_idNumber varchar2,
                                p_documentno varchar2,
                                p_branch varchar2,
                                p_loanType varchar2,
                                p_tranName varchar2,
                                p_tranDes varchar2,
                                p_tranFromDate varchar2,
                                p_tranToDate varchar2,
                                p_lnFromDate varchar2,
                                p_lnToDate varchar2,
                                p_sortType varchar2,
                                p_sortName varchar2,
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
        v_response RESPONSE_TYPE;
        
    BEGIN

        v_response := PKG_VALIDATE.validate_report_common(p_tranFromDate, p_tranToDate, p_sortType, p_sortName, p_page, p_size, p_mod);
        
        IF v_response.v_errcode <> '00' THEN
            v_errcode := v_response.v_errcode;
            v_errmsg  := v_response.v_errmsg;
            raise v_except;
        END IF;

        IF (
            (p_lnFromDate IS NULL OR p_lnFromDate = '') AND (p_lnToDate IS NOT NULL OR p_lnToDate <> '')
            OR
            (p_lnFromDate IS NOT NULL OR p_lnFromDate <> '') AND (p_lnToDate IS NULL OR p_lnToDate = '')
        ) THEN
            v_errcode := '01';
            v_errmsg  := 'lnFromDate và lnToDate là bắt buộc';
            raise v_except;
        END IF;

        IF (p_lnFromDate IS NOT NULL OR p_lnFromDate <> '') AND (NOT REGEXP_LIKE(p_lnFromDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '02';
            v_errmsg  := 'lnFromDate không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;
        
        IF (REGEXP_LIKE(p_lnFromDate, '^\d{2}/\d{2}/\d{4}$') ) THEN
            BEGIN
                v_date := TO_DATE(p_lnFromDate, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '03';
                v_errmsg  := 'lnFromDate không hợp lệ';
                raise v_except;
            END;
        END IF;
        
        IF (p_lnToDate IS NOT NULL OR p_lnToDate <> '') AND (NOT REGEXP_LIKE(p_lnToDate, '^\d{2}/\d{2}/\d{4}$')) THEN
            v_errcode := '04';
            v_errmsg  := 'lnToDate không đúng định dạng. dạng chuẩn là (dd/MM/yyyy)';
            raise v_except;
        END IF;

        IF (REGEXP_LIKE(p_lnToDate, '^\d{2}/\d{2}/\d{4}$') ) THEN
            BEGIN
                v_date := TO_DATE(p_lnToDate, 'dd/MM/yyyy');
            EXCEPTION
            WHEN OTHERS THEN
                v_errcode := '05';
                v_errmsg  := 'lnToDate không hợp lệ';
                raise v_except;
            END;
        END IF;

        IF (p_userId IS NULL OR p_userId = '') THEN
            v_errcode := '06';
            v_errmsg  := 'userId là bắt buộc';
            raise v_except;
        END IF;
    
    ---------------
    
    IF trim(upper(p_mod)) = 'SEARCH' THEN

        search_table_tmp_transaction_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_loanType, p_tranName, p_tranDes, p_tranFromDate, p_tranToDate, p_lnFromDate, p_lnToDate, p_sortType, p_sortName, p_page, p_size, p_userId);

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN

        search_table_tmp_transaction_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_loanType, p_tranName, p_tranDes, p_tranFromDate, p_tranToDate, p_lnFromDate, p_lnToDate, p_sortType, p_sortName, 0, 0, p_userId);

    ELSE
        v_errcode := '11';
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
    END transaction_report;
    
    PROCEDURE init_table_tmp_estpayment_report 
    IS 

        v_currDate       varchar2(20);
        v_except         EXCEPTION;

    BEGIN 

        EXECUTE IMMEDIATE 'TRUNCATE TABLE TMP_ESTPAYMENT_REPORT';
        COMMIT; 

        select to_char(dateval, 'dd/MM/yyyy') into v_currDate from businessdate where datetype = 'CURRDATE';

        INSERT INTO TMP_ESTPAYMENT_REPORT (
            loanscheduleid, fullname, mobile, idnumber, documentno, duedate, prinnml, estint, estprin, dueno, sale, branch, estintfee, 
            estassetfee, estexpertisefee, loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province, total
        )
        SELECT 
            loanscheduleid, fullname, mobile, idnumber, documentno, duedate, prinnml, estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, 
            loantype, term, lndate, lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province, (prinnml + estint) as total
        FROM (
            select 
                loanscheduleid, fullname, mobile, idnumber, documentno, duedate,           
                (case when duedate < to_date(v_currDate, 'dd/MM/yyyy') then prinovd + prinpaid else prinnml end) prinnml, 
                estint, estprin, dueno, sale, branch, estintfee, estassetfee, estexpertisefee, loantype, term, lndate, 
                lnclass, rate, feerate, expertisefeerate, custid, branchid, saleid, areaid, regionid, address, addressdetail, ward, district, province
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
                    COALESCE(p.pname, '') as province
                from customer c, loan l, loanregistration r, loanschedule ls, admin_user u, branch b, allcode al,
                    ward w, district d, province p
                where c.id = l.custid and l.regid = r.id and l.id = ls.loanid and r.saleid = u.user_id and u.branch = b.bid
                    and trim(r.loantype) = trim(al.code) and al.type = 'LOANTYPE' and l.prinnml > 0 and l.status = '1' 
                    and ls.duedate >= add_months(trunc(to_date(v_currDate, 'dd/MM/yyyy'), 'MM'), 1)
                     -- ThaiDT - FINY-82: Date 29/12/2025 - Add (+) de thanh LEFT JOIN
                    and c.wardid = w.id and c.districtid = d.id(+) and c.provinceid = p.id

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
                    -- ThaiDT - FINY-82 Update address : Date 29/12/2025 
                    fn_build_address(c.residenceaddress,  w.wname,  d.dname,  p.pname) AS address,
                    COALESCE(c.residenceaddress, '') AS addressdetail,
                    COALESCE(w.wname, '') as ward,
                    COALESCE(d.dname, '') as district,
                    COALESCE(p.pname, '') as province
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
                     -- ThaiDT - FINY-82: Date 29/12/2025 - Add (+) de thanh LEFT JOIN
                    and c.wardid = w.id and c.districtid = d.id(+) and c.provinceid = p.id
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
                                    p_userId varchar2
        
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
        
        ELSIF v_role in (1, 3, 4, 6, 7, 8, 11, 12, 13, 18) THEN --Admin, Van hanh, Tham dinh, CGPD, TP Nhan su, THN
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
        
        --------------------------------------

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
                                p_userId varchar2) 
    IS
    
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

        search_table_tmp_estpayment_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_fromDate, p_toDate, p_sortType, p_sortName, p_page, p_size, p_userId);

    ELSIF trim(upper(p_mod)) = 'EXPORT' THEN

        search_table_tmp_estpayment_report (vio_sql, vio_rec_total, p_fullName, p_mobile, p_idNumber, p_documentno, p_branch, p_fromDate, p_toDate, p_sortType, p_sortName, 0, 0, p_userId);
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

/

create or replace PACKAGE BODY PCK_ADMIN IS
    PROCEDURE create_user(        
            pv_cursor   IN OUT SYS_REFCURSOR,
            pv_username IN VARCHAR2,
            pv_password IN VARCHAR2,
            pv_fullname IN VARCHAR2,
            pv_phone    IN VARCHAR2,
            pv_role     IN VARCHAR2,
            pv_branch   IN VARCHAR2,
            pv_user_code in varchar2)
    IS
        v_userid   number(5);
        v_username varchar2(20);
        v_password  VARCHAR2(36);
        v_fullname varchar2(100);
        v_phone    varchar2(10);
        v_role     varchar2(10);
        v_branch   varchar2(10);
        v_user_code varchar2(10);

        v_exception exception;
        v_error varchar2(10);
        v_error_message  varchar2(200);
        v_count     number(10);
    begin
        -- check trùng user
            select count(*) into v_count from admin_user where user_name = pv_username;
            if v_count >0 THEN
                v_error:= '01';
                v_error_message:= 'Trùng Tên đăng nhập ';
                RAISE v_exception;
            END IF;
        
        -- check trùng user_CODE     
            select count(*) into v_count from admin_user where user_code = pv_user_code;
            if v_count >0 THEN
                v_error:= '01';
                v_error_message:= 'Mã nhân viên đã tồn tại';
                RAISE v_exception;
            END IF;
        -- check trùng sdt
            select count(*) into v_count from admin_user where phone = pv_phone;
            if v_count >0 THEN
                v_error:= '01';
                v_error_message:= 'Trùng số điện thoại ';
                RAISE v_exception;
            END IF;
        -- tìm branch
        select count(*) into v_count from branch where bid = pv_branch;
        if v_count = 0 THEN
            v_error:= '01';
            v_error_message:= 'Mã phòng giao dịch không đúng';
            RAISE v_exception;
        END IF;
            

        insert into admin_user
        (user_id,
         user_name,
         password,
         full_name,
         id_code,
         id_place,
         birth_date,
         sex,
         phone,
         email,
         login_fail,
         register_date,
         who_created,
         role,
         branch,
         status,
         gid,
         user_code)
        values (seq_adminuser.nextval,
                pv_username,
                pv_password,
                pv_fullname,
                null,
                null,
                null,
                null,
                pv_phone,
                null,
                0,
                null,
                'ADMIN',
                pv_role,
                pv_branch,
                1,
                null,
                pv_user_code)
            RETURNING user_id INTO v_userid;

        open pv_cursor for
            select admin_user.* , admin_user.branch branchname,
             admin_user.branch branchaddress from admin_user where user_id = v_userid;
             
        EXCEPTION 
            WHEN v_exception THEN
                OPEN pv_cursor FOR SELECT v_error AS pv_status, v_error_message AS pv_des FROM DUAL;
            
            WHEN OTHERS THEN
                    v_error := SQLCODE;
                    v_error_message := SQLERRM;
                OPEN pv_cursor FOR SELECT '01' AS pv_status, v_error_message AS pv_des FROM DUAL;

    end;


    PROCEDURE update_user(pv_cursor   in out SYS_REFCURSOR,
                        pv_userid   in varchar2,
                        pv_username in varchar2,
                        pv_fullname in varchar2,
                        pv_idcode   in varchar2,
                        pv_idplace  in varchar2,
                        pv_dob      in date,
                        pv_sex      in varchar2,
                        pv_phone    in varchar2,
                        pv_email    in varchar2,
                        pv_role     in varchar2,
                        pv_branch   in varchar2,
                        pv_gid      IN VARCHAR2,
                        pv_user_code in varchar2)
    AS
        v_username      VARCHAR2(1000);
        v_user_code     VARCHAR2(1000);
        v_branch        VARCHAR2(1000);
        v_phone         VARCHAR2(1000);
        v_error varchar2(1000);
        v_error_message  varchar2(1000);
        v_count     number(10);
  begin
  
        select MIN(au.user_name), MIN(au.user_code), MIN(au.branch), MIn(au.phone)
        INTO v_username,v_user_code,v_branch, v_phone
        from admin_user au where au.user_id = pv_userid ;
        dbms_output.put_line('check user_name');

        IF v_username <> pv_username THEN
              -- check trùng user
            select count(*) into v_count from admin_user where user_name = pv_username;
            if v_count >0 THEN
                return_exception(pv_cursor,'01','Tên đăng nhập đã tồn tại');
                return;
            END IF;
        END IF;
        dbms_output.put_line('check phone');

        IF v_phone <> pv_phone THEN
              -- check trùng user
            select count(*) into v_count from admin_user where phone = pv_phone;
            if v_count >0 THEN
            return_exception(pv_cursor,'01','Số điện thoại đã tồn tại');
            return;
            END IF;
        END IF;
        dbms_output.put_line('check user_code');
        IF v_user_code <> pv_user_code THEN
    
            -- check trùng user
            select count(*) into v_count from admin_user where user_code = pv_user_code;
            if v_count >0 THEN
            return_exception(pv_cursor,'01','Mã nhân viên đã tồn tại');
            return;
            END IF;
        END IF;
        
        dbms_output.put_line('check bid');
        IF v_branch <> pv_branch THEN
            -- tìm branch
            select count(*) into v_count from branch where bid = pv_branch;
            if v_count = 0 THEN
                return_exception(pv_cursor,'01','Mã phòng giao dịch không đúng');
                return;
            END IF;
        END IF;
    dbms_output.put_line('check done');

    update admin_user
       set user_name  = pv_username,
           full_name  = pv_fullname,
           id_code    = pv_idcode,
           id_place   = pv_idplace,
           birth_date = pv_dob,
           sex        = pv_sex,
           phone      = pv_phone,
           email      = pv_email,
           role       = pv_role,
           branch     = pv_branch,
           gid        = pv_gid,
           user_code  = pv_user_code
     where user_id = pv_userid;
    dbms_output.put_line('update admin_user done');
      
    update api_token set username = pv_username where username=v_username;
    dbms_output.put_line('update api_token done');
    open pv_cursor for
      select '00' pv_status, 'Cập nhập thông tin thành công' pv_des from dual;
  
  exception
    when others then
      return_exception(pv_cursor, SQLCODE, SQLERRM);
  end;
    
  
    PROCEDURE get_all_admin_user(
        pv_cursor IN OUT SYS_REFCURSOR,
        pv_record_total IN OUT NUMBER,
        pv_page   IN NUMBER,
        pv_size   IN NUMBER) 
    AS
        offset_value NUMBER(10);
        v_query VARCHAR2(1000);
        v_limit          VARCHAR2(4000);
    BEGIN
        offset_value := ( pv_page - 1 ) * pv_size;
         v_query :='Select au.USER_ID, au.USER_NAME,  au.PASSWORD,  au.FULL_NAME,
                 au.ID_CODE,
                 au.EMAIL,
                 au.LOGIN_FAIL,
                 au.REGISTER_DATE,
                 au.WHO_CREATED,
                 ac.name as role,
                 au.BRANCH,
                 au.STATUS,
                 au.GID,
                 b.name as branchname,
                 b.full_address as branchaddress,
                 ar.name area,
                 r.name region
                 From admin_user au, allcode ac, area ar, region r, branch b
                 where au.role = ac.code
                 and au.status = 1
                 and ac.type = ''ROLE''
                 and au.branch = b.bid
                 and ar.aid= b.aid
                 and r.rid = ar.rid
                 ORDER BY au.user_id desc
                 OFFSET '|| offset_value ||' ROWS FETCH NEXT '|| pv_size|| 'ROWS ONLY'; 
        OPEN pv_cursor FOR v_query;

        SELECT COUNT(*) INTO pv_record_total
             FROM admin_user au, allcode ac
             where au.role = ac.code
             and au.status = 1
             and ac.type = 'ROLE';
                 
    END;  

    PROCEDURE get_admin_user_by_id(pv_cursor in out sys_refcursor,
                                 pv_userid in INT) is
  begin
    open pv_cursor for
      select a.*, b.name branchname, b.full_address branchaddress from admin_user a, branch b
       where a.branch = b.bid
       and user_id = pv_userid
       order by a.user_id desc;
  end;

    PROCEDURE get_info_user_by_id(pv_cursor in out sys_refcursor,
                                 pv_userid in INT) is
  begin
    open pv_cursor for
      select a.*, ac.name role_name, b.name branchname, b.full_address branchaddress from admin_user a, branch b, allcode ac
       where a.branch = b.bid
       and ac.id= a.role
       and ac.type='ROLE'
       and user_id = pv_userid;
  end;
  
    PROCEDURE get_all_admin_user_by_role (
        pv_cursor  IN OUT SYS_REFCURSOR,
        pv_role IN NUMBER,
        pv_page IN NUMBER,
        pv_size IN NUMBER
    ) AS
        v_query VARCHAR2(1000);
        offset_value NUMBER(10);
    BEGIN
        offset_value := (pv_page - 1) * pv_size;
        -- Xây dựng câu SQL động để lọc theo danh sách roleId
        v_query := 'SELECT a.*, b.name AS branchname, b.full_address AS branchaddress
                    FROM admin_user a
                    JOIN branch b ON a.branch = b.bid
                    WHERE a.status = 1 AND a.role = '|| pv_role || '
                    ORDER BY a.user_id desc
                    OFFSET ' ||offset_value|| ' ROWS FETCH NEXT ' || pv_size ||' ROWS ONLY';

        -- Mở REF CURSOR với câu query động
        OPEN pv_cursor FOR v_query;

    END;
    
    
    PROCEDURE find_admin_user_by_username(
        pv_cursor IN OUT SYS_REFCURSOR,
        pv_usersearch IN VARCHAR2,
        pv_page IN NUMBER,
        pv_size IN NUMBER)
    AS
        v_query VARCHAR2(1000);
        offset_value NUMBER(10);
    BEGIN
        offset_value := (pv_page - 1) * pv_size;
        v_query := 'SELECT a.*, b.name AS branchname, b.full_address AS branchaddress
                    FROM admin_user a
                    JOIN branch b ON a.branch = b.bid
                    WHERE a.status = 1 
                    AND a.user_name like ''%' || pv_usersearch || '%''
                    ORDER BY a.user_name DESC
                    OFFSET ' ||offset_value|| ' ROWS FETCH NEXT ' || pv_size ||' ROWS ONLY';
        -- Mở REF CURSOR với câu query động
        OPEN pv_cursor FOR v_query;
    END;
    
    
    PROCEDURE create_api_token (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_username     IN VARCHAR2,
        pv_password     IN VARCHAR2,
        pv_partner      IN VARCHAR2,
        pv_time_expired IN NUMBER
    ) IS
        v_user_id      VARCHAR2(100);
        v_error         VARCHAR(200);
        v_error_message VARCHAR2(200);
        v_exception     EXCEPTION;
    BEGIN
        select au.user_id INTO v_user_id from admin_user au
            where au.user_name = pv_username and au.status = '1';
            
        IF v_user_id IS NULL THEN
            v_error := '01';
            v_error_message:= 'User không tồn tại';
            RAISE v_exception;
        END IF;
        
        INSERT INTO api_token a (a.id,
            a.username,
            a.password,
            a.partner,
            a.time_expired) 
        VALUES (v_user_id,
                   pv_username,
                   pv_password,
                   pv_partner,
                   pv_time_expired);

        OPEN pv_cursor FOR SELECT '00' pv_status,'Success' pv_des FROM dual;

    END;
    
    PROCEDURE get_all_region (
        pv_cursor       IN OUT SYS_REFCURSOR) IS
    BEGIN
        OPEN pv_cursor FOR SELECT * FROM region r WHERE r.status = 1;
    END;
    
    PROCEDURE search_area (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_record_total IN OUT NUMBER,
        pv_aid          IN VARCHAR2,
        pv_name         IN VARCHAR2,
        pv_status       IN VARCHAR2,    
        pv_page         IN NUMBER,
        pv_size         IN NUMBER)
    AS
        v_query          VARCHAR2(4000):='SELECT a.*, r.name region_name FROM area a,region r  WHERE a.rid=r.rid ';
        v_sql_count      VARCHAR2(4000):= 'SELECT count(*) FROM area a,region r WHERE a.rid=r.rid  ';
        v_where          VARCHAR2(4000);
        v_offset         NUMBER;
        v_limit          VARCHAR2(4000);
    BEGIN
      
           
        IF pv_aid IS NOT NULL THEN
--            v_where:= v_where || ' AND UPPER(a.aid) =  '''|| UPPER(pv_aid) || '''';
            v_where := v_where || ' AND UPPER(a.aid) LIKE ''%' || UPPER(TRIM(pv_aid)) || '%''';

        END IF;
    
        IF pv_name IS NOT NULL THEN
            v_where:= v_where || ' AND UPPER(a.name) IN (''' || REPLACE(UPPER(TRIM(pv_name)), ',', ''',''') || ''')';
--            v_where := v_where || ' AND UPPER(a.name) LIKE ''%' || UPPER(TRIM(pv_name)) || '%''';
        END IF;
        
        IF pv_status IS NOT NULL THEN
            v_where:= v_where || ' AND a.status =  '''|| pv_status || '''';
        END IF;
        
        IF (pv_page IS NOT NULL AND pv_size IS NOT NULL) THEN 
            v_offset := (pv_page - 1) * pv_size;
            v_limit := 'OFFSET '|| v_offset ||' ROWS FETCH NEXT '|| pv_size|| ' ROWS ONLY';
        END IF;
        dbms_output.put_line(v_where);
        v_query := v_query || v_where ||
                        ' ORDER BY a.name DESC ' || v_limit;
        dbms_output.put_line(v_query);
        v_sql_count:= v_sql_count || v_where;
        dbms_output.put_line(v_sql_count);
        OPEN pv_cursor FOR v_query;
        EXECUTE IMMEDIATE v_sql_count INTO pv_record_total;
        
    END;
    
    
    PROCEDURE search_branch (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_record_total IN OUT NUMBER,
        pv_aid          IN VARCHAR2, 
        pv_bid          IN VARCHAR2,
        pv_name         IN VARCHAR2,
        pv_status       IN VARCHAR2,
        pv_page         IN NUMBER,
        pv_size         IN NUMBER)
    AS
        -- ThaiDT FINY-82: Update query support optional district (change INNER JOIN to LEFT JOIN for district) 29/12/2025
        v_query          VARCHAR2(4000):='SELECT b.*,  a.name area_name, r.name region_name, b.full_address detail_address, wa.id ward_id, d.id district_id, p.id province_id FROM branch b, area a, region r, branch_map_ward bw,district d, province p, ward wa
                        where b.aid = a.aid 
                        AND a.rid=r.rid 
                        AND b.name IS NOT NULL
                        AND b.bid=bw.branch_id
                        AND bw.ward_id = wa.id
                        AND wa.did = d.id(+)
                        AND d.pid =p.id ';
        v_sql_count      VARCHAR2(4000):= 'SELECT count(*) FROM branch b, area a, region r, branch_map_ward bw,district d, province p, ward wa
                        where b.aid = a.aid 
                        AND a.rid=r.rid 
                        AND b.name IS NOT NULL
                        AND b.bid=bw.branch_id
                        AND bw.ward_id = wa.id
                        AND wa.did = d.id(+)
                        AND d.pid =p.id ';
        v_where          VARCHAR2(4000);
        v_offset         NUMBER;
        v_limit          VARCHAR2(4000);
    BEGIN
    
        IF pv_bid IS NOT NULL THEN
--            v_where:= v_where || ' AND UPPER(b.bid) =  '''|| UPPER(pv_bid) || '''';
            v_where := v_where || ' AND UPPER(b.bid) LIKE ''%' || UPPER(TRIM(pv_bid)) || '%''';

        END IF;
        IF pv_aid IS NOT NULL THEN
            v_where:= v_where || ' AND UPPER(b.aid) =  '''|| UPPER(pv_aid) || '''';
        END IF;
    
        IF pv_name IS NOT NULL THEN
            v_where:= v_where || ' AND UPPER(b.name) IN (''' || REPLACE(UPPER(TRIM(pv_name)), ',', ''',''') || ''')';
--            v_where := v_where || ' AND UPPER(b.name) LIKE ''%' || UPPER(TRIM(pv_name)) || '%''';

        END IF;
        
        IF pv_status IS NOT NULL THEN
            v_where:= v_where || ' AND b.status =  '''|| pv_status || '''';
        END IF;
        
        IF (pv_page IS NOT NULL AND pv_size IS NOT NULL) THEN 
            v_offset := (pv_page - 1) * pv_size;
            v_limit := 'OFFSET '|| v_offset ||' ROWS FETCH NEXT '|| pv_size|| ' ROWS ONLY';
        END IF;
        dbms_output.put_line(v_where);
        v_query := v_query || v_where ||
                        ' ORDER BY b.name DESC ' || v_limit;
        dbms_output.put_line(v_query);
        v_sql_count:= v_sql_count || v_where;
        dbms_output.put_line(v_sql_count);
        OPEN pv_cursor FOR v_query;
        EXECUTE IMMEDIATE v_sql_count INTO pv_record_total;
    END; 
    
    
    PROCEDURE create_area (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_aid          IN VARCHAR2,
        pv_name         IN VARCHAR2,
        pv_rid          IN VARCHAR2,
        pv_des          IN VARCHAR2) 
    AS
        v_counterror NUMBER;
    BEGIN

        SELECT COUNT(*) INTO v_counterror FROM region WHERE UPPER(rid) = UPPER(trim(pv_rid));
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy rid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Vùng không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_counterror FROM area WHERE UPPER(name) = UPPER(TRIM(pv_name)) and UPPER(rid) =  UPPER(trim(pv_rid));
        IF v_counterror > 0 THEN
        -- trả lỗi nếu trung aid
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Tên khu vực đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
                
        SELECT COUNT(*) INTO v_counterror FROM area WHERE UPPER(aid) = pv_aid;
        IF v_counterror > 0 THEN
        -- trả lỗi nếu trung aid
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Mã khu vực đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        -- Tạo ID mới
--        SELECT 'A' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(aid, 2))), 0) + 1, 3, '0') 
--        INTO v_aid  FROM area;
        
        INSERT INTO area a (
            a.aid,
            a.name,
            a.rid,
            a.description,
            a.status) 
        VALUES (pv_aid,
                trim(pv_name),
                UPPER(trim(pv_rid)),
                pv_des,
                1);

        OPEN pv_cursor FOR SELECT '00' pv_status,'Tạo mới khu vực thành công' pv_des FROM dual;
    END;
    
    
    PROCEDURE create_branch (
        pv_cursor               IN OUT SYS_REFCURSOR,
        pv_bid                  IN VARCHAR2,
        pv_name                 IN VARCHAR2,
        pv_aid                  IN VARCHAR2,
        pv_rid                  IN VARCHAR2,
        pv_detail_address       IN VARCHAR2,
        pv_ward_id              IN NUMBER,
        pv_district_id          IN NUMBER,
        pv_province_id          IN NUMBER)
    AS
        v_counterror            NUMBER;
        v_full_address          VARCHAR2(2000);
    BEGIN

        SELECT COUNT(*) INTO v_counterror FROM region WHERE rid = pv_rid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy rid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Vùng không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_counterror FROM area WHERE aid = pv_aid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy aid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Vùng không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        -- tìm branch đã tồn tại
        SELECT COUNT(*) INTO v_counterror FROM branch WHERE aid = pv_aid and rid = pv_rid and name = pv_name;
        IF v_counterror > 0 THEN
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Tên phòng giao dịch đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        
        -- tìm mã branch đã tồn tại
        SELECT COUNT(*) INTO v_counterror FROM branch WHERE bid= pv_bid;
        IF v_counterror > 0 THEN
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Mã phòng giao dịch đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
      -- ThaiDT FINY-82: Update address support optional district (ward -> district -> province OR ward -> province)  29/12/2025
        --  map id địa chỉ
        IF pv_district_id IS NOT NULL THEN
            -- Model có huyện: xã -> huyện -> tỉnh
            select count(*) INTO v_counterror from ward w, district d, province p
                where w.id = pv_ward_id
                and d.id = pv_district_id
                and p.id = pv_province_id
                and w.did= d.id
                and d.pid= p.id;
            IF v_counterror = 0 THEN
                OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Xã/Phường không thuộc Quận/Huyện hoặc Tỉnh/Thành phố đã chọn' AS pv_des FROM dual;
                RETURN;
            END IF;
            -- join địa chỉ
            select w.wlevel ||' '|| w.wname || ', '|| d.dlevel ||' '|| d.dname || ', '|| p.pname into v_full_address from ward w, district d, province p
                where w.id = pv_ward_id
                and d.id = pv_district_id
                and p.id = pv_province_id
                and w.did=d.id
                and d.pid=p.id;
        ELSE
            -- ThaiDT FINY-82: Model không có huyện: xã -> tỉnh  29/12/2025
            select count(*) INTO v_counterror from ward w, province p
                where w.id = pv_ward_id
                and p.id = pv_province_id
                and w.pid= p.id
                and w.did IS NULL;
            IF v_counterror = 0 THEN
                OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Xã/Phường không thuộc Tỉnh/Thành phố đã chọn' AS pv_des FROM dual;
                RETURN;
            END IF;
            -- ThaiDT FINY-82: join địa chỉ không có huyện  29/12/2025
            select w.wlevel ||' '|| w.wname || ', '|| p.pname into v_full_address from ward w, province p
                where w.id = pv_ward_id
                and p.id = pv_province_id
                and w.pid=p.id
                and w.did IS NULL;
        END IF;
        
        v_full_address := pv_detail_address || ', ' || v_full_address;
        -- Tạo ID mới
--        SELECT 'B' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(bid, 2))), 0) + 1, 3, '0') 
--        INTO v_bid  FROM branch WHERE REGEXP_LIKE(bid, '^B[0-9]+$')  -- Chỉ lấy giá trị hợp lệ
--            AND bid NOT IN ('HO', 'LH01');  -- Loại bỏ các bid có giá trị HO và LH;
     
        INSERT INTO branch a (
            a.bid,
            a.name,
            a.aid,
            a.rid,
            a.status,
            a.full_address) 
        VALUES (pv_bid, pv_name, pv_aid, pv_rid, 1, v_full_address);
        -- insert brank_map_ward
        INSERT INTO branch_map_ward b (b.branch_id, b.ward_id, b.is_delete) 
        VALUES (pv_bid, pv_ward_id, 0);
        OPEN pv_cursor FOR SELECT '00' pv_status,'Tạo mới phòng giao dịch thành công' pv_des FROM dual;
    END;
        

    PROCEDURE update_area (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_aid          IN VARCHAR2,
        pv_name         IN VARCHAR2,
        pv_rid          IN VARCHAR2,
        pv_des          IN VARCHAR2)
    AS
        v_counterror NUMBER;
    BEGIN

        SELECT COUNT(*) INTO v_counterror FROM region WHERE rid = pv_rid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy rid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Vùng không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_counterror FROM area WHERE aid = pv_aid AND status = 1;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy aid trong area, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Khu vực không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        
        SELECT COUNT(*) INTO v_counterror FROM area WHERE name = pv_name and rid = pv_rid and aid <> pv_aid;
        IF v_counterror > 0 THEN
        -- trả lỗi nếu trung aid
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Tên khu vực đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
    
        
        UPDATE area a SET
            a.name = pv_name,
            a.rid = pv_rid,
            a.description = pv_des 
        WHERE  
            a.aid = pv_aid 
            AND a.status =1;

        OPEN pv_cursor FOR SELECT '00' pv_status,'Success' pv_des FROM dual;
    END;
                

    PROCEDURE update_branch (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_bid          IN VARCHAR2,
        pv_name         IN VARCHAR2,
        pv_aid          IN VARCHAR2,
        pv_rid          IN VARCHAR2,
        pv_detail_address       IN NVARCHAR2,
        
        pv_ward_id              IN NUMBER,
        pv_district_id          IN NUMBER,
        pv_province_id          IN NUMBER)
    AS
        v_counterror NUMBER;
        v_full_address      VARCHAR2(2000);
    BEGIN
    dbms_output.put_line('begin');
        SELECT COUNT(*) INTO v_counterror FROM branch WHERE bid = pv_bid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy pv_bid trong branch, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Phòng giao dịch không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        dbms_output.put_line('bid = pv_bid done');

        SELECT COUNT(*) INTO v_counterror FROM region WHERE rid = pv_rid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy rid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Vùng không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        dbms_output.put_line('rid = pv_rid done');

        SELECT COUNT(*) INTO v_counterror FROM area WHERE aid = pv_aid;
        IF v_counterror = 0 THEN
        -- Nếu không tìm thấy aid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Khu vực không tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;
        dbms_output.put_line('aid = pv_aid done');
        SELECT COUNT(*) INTO v_counterror FROM branch b WHERE b.bid <> pv_bid AND b.name = pv_name;
        IF v_counterror > 0 THEN
        -- Nếu không tìm thấy rid trong region, trả về lỗi
            OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Tên phòng giao dịch đã tồn tại' AS pv_des FROM dual;
            RETURN;
        END IF;   
        dbms_output.put_line('a b.bid <> pv_bid done');
        
        SELECT b.full_address INTO v_full_address FROM branch b WHERE b.bid = pv_bid;


        IF v_full_address IS NULL OR  pv_detail_address <> v_full_address  THEN
            
            -- tìm bản ghi branch map
            select COUNT(*) INTO v_counterror from branch_map_ward where branch_id = pv_bid and is_delete = 0;
            IF v_counterror = 0  THEN
                OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Xã/Phường không thuộc Quận/Huyện hoặc Tỉnh/Thành phố đã chọn' AS pv_des FROM dual;
                RETURN;
            END IF;
            dbms_output.put_line('branch_id = pv_bid done');
            -- ThaiDT FINY-82: Update address support optional district (ward -> district -> province OR ward -> province) 29/12/2025
            IF pv_district_id IS NOT NULL THEN
                -- Model có huyện: xã -> huyện -> tỉnh
                select COUNT(*) INTO v_counterror from ward w, district d, province p
                    where w.id = pv_ward_id
                    and d.id = pv_district_id
                    and p.id = pv_province_id
                    and w.did= d.id
                    and d.pid= p.id;
                IF v_counterror = 0  THEN
                    OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Xã/Phường không thuộc Quận/Huyện hoặc Tỉnh/Thành phố đã chọn' AS pv_des FROM dual;
                    RETURN;
                END IF;
                dbms_output.put_line('w.id = pv_ward_id done');
                -- join địa chỉ
                select w.wlevel ||' '|| w.wname || ', '|| d.dlevel ||' '|| d.dname || ', '|| p.pname into v_full_address from ward w, district d, province p
                    where w.id = pv_ward_id
                    and d.id = pv_district_id
                    and p.id = pv_province_id
                    and w.did= d.id
                    and d.pid= p.id;
            ELSE
                -- ThaiDT FINY-82: Model không có huyện: xã -> tỉnh  29/12/2025
                select COUNT(*) INTO v_counterror from ward w, province p
                    where w.id = pv_ward_id
                    and p.id = pv_province_id
                    and w.pid= p.id
                    and w.did IS NULL;
                IF v_counterror = 0  THEN
                    OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Xã/Phường không thuộc Tỉnh/Thành phố đã chọn' AS pv_des FROM dual;
                    RETURN;
                END IF;
                dbms_output.put_line('w.id = pv_ward_id done');
                -- ThaiDT FINY-82: join địa chỉ không có huyện  29/12/2025
                select w.wlevel ||' '|| w.wname || ', '|| p.pname into v_full_address from ward w, province p
                    where w.id = pv_ward_id
                    and p.id = pv_province_id
                    and w.pid= p.id
                    and w.did IS NULL;
            END IF;
            v_full_address := pv_detail_address || ', ' || v_full_address;
        dbms_output.put_line('v_full_address: ' || v_full_address);
        END IF;
        UPDATE branch a SET
            a.name = pv_name,
            a.aid = pv_aid,
            a.rid = pv_rid,
            a.full_address = v_full_address 
        WHERE  
            a.bid = pv_bid 
            AND a.status =1;
        dbms_output.put_line('UPDATE:  branch' );
        UPDATE branch_map_ward SET ward_id = pv_ward_id where branch_id = pv_bid;
        dbms_output.put_line('UPDATE:  branch_map_ward' );
        OPEN pv_cursor FOR SELECT '00' pv_status,'Cập nhập phòng giao dịch thành công' pv_des FROM dual;
    END;
   

    PROCEDURE account_admin_user (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_status       IN VARCHAR2,
        pv_username     IN VARCHAR2)
    AS
        v_id            NUMBER;
        v_token         VARCHAR2(32);
        v_status        NUMBER;
        v_error         VARCHAR2(225);
        v_error_message VARCHAR2(225);
        v_exception     EXCEPTION;
        v_mess_result   VARCHAR2(100);

    BEGIN
        IF pv_status='UNLOCK' THEN
            v_status:= 0;
            v_mess_result :='Mở khóa tài khoản thành công';
        ELSIF pv_status= 'LOCK' THEN
            v_status:=1; 
            v_mess_result :='Khóa tài khoản thành công';
        ELSE 
            v_error:= '01';
            v_error_message:=  'Giá trị đầu vào không hợp lệ';
            RAISE v_exception;
        END IF;
        
        SELECT MIN(a.user_id), MIN(a.password) 
        INTO v_id, v_token
        FROM admin_user a WHERE a.user_name =  pv_username AND a.status = v_status;
        
        IF v_id IS null THEN
            v_error:= '01';
            v_error_message:=  'User không tồn tại';
            RAISE v_exception;
        END IF;
        
        IF pv_status='UNLOCK' THEN
            SELECT LOWER (STANDARD_HASH(v_token, 'MD5')) INTO v_token FROM DUAL;
            v_status:= 1;
        ELSIF pv_status= 'LOCK' THEN
            v_token:= null;
            v_status:=0;
        ELSE 
            v_error:= '01';
            v_error_message:=  'Giá trị đầu vào không hợp lệ';
            RAISE v_exception;
        END IF;
        
        UPDATE admin_user a set a.status= v_status WHERE a.user_id = v_id;
        UPDATE api_token a set a.password = v_token WHERE a.username = pv_username;
        
        OPEN pv_cursor FOR
             SELECT '00' pv_status, v_mess_result pv_des FROM DUAL;
        EXCEPTION 
            WHEN v_exception THEN
                OPEN pv_cursor FOR SELECT v_error AS pv_status, v_error_message AS pv_des FROM DUAL;
        
            WHEN OTHERS THEN
                    v_error := SQLCODE;
                    v_error_message := SQLERRM;
                OPEN pv_cursor FOR SELECT '01' AS pv_status, 'Error Code: ' || v_error || ' - ' || v_error_message AS pv_des FROM DUAL;
        END;
  
    PROCEDURE report_admin_user (
        pv_cursor       IN OUT SYS_REFCURSOR)
    AS
        v_query         VARCHAR2(2000);
    BEGIN
        v_query :='Select 
                        au.USER_NAME,
                        au.user_code,
                        au.FULL_NAME, 
                        au.PHONE,
                        ac.name as role,
                        CASE 
                            WHEN au.STATUS = 1 THEN ''ONLINE'' 
                            ELSE ''OFF''
                        END AS status,
                        b.name as branch,
                        ar.name as area,
                        re.name as region
                    FROM admin_user au, allcode ac, area ar, region re,branch b
                    WHERE au.role = ac.code
                        and ac.type = ''ROLE''
                        and au.branch = b.bid
                        and b.aid = ar.aid
                        and b.rid=re.rid
                    ORDER BY au.user_name asc'; 
                 
        OPEN pv_cursor FOR v_query;
        
    END;
    
    
    PROCEDURE search_admin_user(
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_record_total IN OUT NUMBER,
        pv_full_name    IN VARCHAR2,
        pv_phone        IN VARCHAR2,
        pv_user_code    IN VARCHAR2,
        pv_branch       IN VARCHAR2,
        pv_status       IN VARCHAR2,
        pv_page         IN NUMBER,
        pv_size         IN NUMBER)
    AS
        v_sql_select     VARCHAR2(4000);
        v_sql_count      VARCHAR2(4000);
        v_where          VARCHAR2(4000) := ' WHERE au.user_id IS NOT NULL ';
        v_offset         NUMBER;
        v_limit          VARCHAR2(4000);
    BEGIN
        -- Xây dựng WHERE động và bind tương ứng
        IF pv_phone IS NOT NULL THEN
            v_where := v_where || ' AND UPPER(au.phone) LIKE ''%' || UPPER(TRIM(pv_phone)) || '%''';
        END IF;
    
        IF pv_full_name IS NOT NULL THEN
            v_where := v_where || ' AND UPPER(au.full_name) LIKE ''%' || UPPER(TRIM(pv_full_name)) || '%''';
        END IF;
    
        IF pv_user_code IS NOT NULL THEN
            v_where := v_where || ' AND UPPER(au.user_code) LIKE ''%' || UPPER(TRIM(pv_user_code)) || '%''';
        END IF;
    
        IF pv_branch IS NOT NULL THEN
            v_where:= v_where || ' AND UPPER(au.branch) IN (''' || REPLACE(UPPER(TRIM(pv_branch)), ',', ''',''') || ''')';
        END IF;
        
        IF pv_status IS NOT NULL THEN
            v_where:= v_where || ' AND au.status =  '''|| pv_status || '''';
        END IF;
        -- page size
        IF (pv_page IS NOT NULL AND pv_size IS NOT NULL) THEN
        
        v_offset := (pv_page - 1) * pv_size;
        v_limit := 'OFFSET '|| v_offset ||' ROWS FETCH NEXT '|| pv_size|| ' ROWS ONLY';
        END IF;
        -- SELECT và COUNT
        v_sql_select := 'Select au.USER_ID, au.USER_NAME,  au.PASSWORD,  au.FULL_NAME, au.phone,
                         au.ID_CODE,
                         au.EMAIL,
                         au.LOGIN_FAIL,
                         au.REGISTER_DATE,
                         au.WHO_CREATED,
                         CASE 
                            WHEN ac.name IS NULL THEN '''' 
                            ELSE ac.name 
                         END AS role,
                         au.BRANCH,
                         CASE 
                            WHEN au.STATUS = 1 THEN ''Đang hoạt động'' 
                            ELSE ''Không hoạt động''
                         END AS status,
                         au.GID,
                         b.name as branchname,
                         b.full_address as branchaddress,
                         ar.name area,
                         r.name region,
                         au.user_code
                        FROM admin_user au
                        LEFT JOIN allcode ac ON au.role = ac.code AND ac.type = ''ROLE''
                        LEFT JOIN branch b ON au.branch = b.bid
                        LEFT JOIN area ar ON b.aid = ar.aid
                        LEFT JOIN region r ON ar.rid = r.rid ' || v_where ||
                        ' ORDER BY au.user_id DESC ' || v_limit; 
        dbms_output.put_line(v_sql_select);
        v_sql_count := 'select count(*) from (Select au.USER_ID, au.USER_NAME,  au.PASSWORD,  au.FULL_NAME,
                 au.ID_CODE,
                 au.EMAIL,
                 au.LOGIN_FAIL,
                 au.REGISTER_DATE,
                 au.WHO_CREATED,
                 ac.name as role,
                 au.BRANCH,
                 au.STATUS,
                 au.GID,
                 b.name as branchname,
                 b.full_address as branchaddress,
                 ar.name area,
                 r.name region
                 FROM admin_user au
                LEFT JOIN allcode ac ON au.role = ac.code AND ac.type = ''ROLE''
                LEFT JOIN branch b ON au.branch = b.bid
                LEFT JOIN area ar ON b.aid = ar.aid
                LEFT JOIN region r ON ar.rid = r.rid  ' || v_where ||' )';

        -- Mở cursor kết quả
        OPEN pv_cursor FOR v_sql_select;
        -- Đếm tổng bản ghic
        EXECUTE IMMEDIATE v_sql_count INTO pv_record_total;
    END;
    
    
    PROCEDURE reset_password(
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_user_id      IN VARCHAR2,
        pv_password     IN VARCHAR2)
    AS
        v_user_id       VARCHAR2(36);
        v_user_name     VARCHAR2(36);
        v_token_id      VARCHAR2(36);
        v_token         VARCHAR2(36);
        v_status        Number;
        
        v_error         VARCHAR(200);
        v_error_message VARCHAR2(200);
        v_exception     EXCEPTION;
    BEGIN
        
        IF REGEXP_LIKE(pv_user_id, '^\d+$') THEN
            SELECT MIN(user_id), MIN(user_name)
            INTO v_user_id, v_user_name
            FROM admin_user
            WHERE user_id = TO_NUMBER(pv_user_id);
        ELSE
            SELECT MIN(user_id), MIN(user_name), Min(status)
            INTO v_user_id, v_user_name,v_status
            FROM admin_user
            WHERE user_name = pv_user_id;
        END IF;
                
        IF v_user_id IS NULL THEN
            return_exception(pv_cursor,'01','Không tìm thấy user');
            return;
        END IF;
        
        if v_status <> 1 THEN
            return_exception(pv_cursor,'01','User đang bị khóa, liên hệ quản trị viên để hỗ trợ');
            return;
        END IF;
        SELECT MIN(at.id) INTO v_token_id from api_token at where at.username = v_user_name and at.password IS NOT NULL;
        IF v_user_id IS NULL THEN
            return_exception(pv_cursor,'01','Không tìm thấy bản ghi token của user');
            return;
        END IF;
        
        SELECT LOWER (STANDARD_HASH(pv_password, 'MD5')) INTO v_token FROM DUAL;
         
        UPDATE admin_user set password = pv_password where user_id = v_user_id;
        UPDATE api_token at set at.password = v_token where at.id = v_token_id;
        return_success(pv_cursor);
        
        EXCEPTION
            WHEN OTHERS THEN
            return_exception(pv_cursor, SQLCODE, SQLERRM);
    END;
    
     PROCEDURE get_admin_user_by_username (
        pv_cursor       IN OUT SYS_REFCURSOR,
        pv_username      VARCHAR2)
    AS
    BEGIN
        OPEN pv_cursor FOR SELECT * FROM admin_user where user_name = pv_username order by user_id desc;
    END;
    
    PROCEDURE get_branch_by_district (
        pv_cursor   IN OUT SYS_REFCURSOR,
        pv_did      VARCHAR2)
    AS

    BEGIN
--    OPEN pv_cursor FOR SELECT b.* from branch b, branch_map_ward bw, ward w, district d
--                        where d.id= pv_did
--                        and w.did = d.id
--                        and w.id = bw.ward_id
--                        and bw.branch_id= b.bid;
    OPEN pv_cursor FOR SELECT b.bid bid, b.name name ,b.aid aid ,b.status status ,b.rid rid, w.did did , b.full_address detai_address , w.id ward_id, d.id district_id, d.pid pid from branch b, branch_map_ward bw, ward w, district d
                        where d.id= pv_did
                        and w.did = d.id
                        and w.id = bw.ward_id
                        and bw.branch_id= b.bid;
        
    END;
    
    
     PROCEDURE return_success(pv_cursor OUT SYS_REFCURSOR) 
    IS
    BEGIN
        OPEN pv_cursor FOR SELECT '00' pv_status, 'Success' pv_des FROM DUAL;
        RETURN;
        
    END;
    
    PROCEDURE return_exception(
        pv_cursor           OUT SYS_REFCURSOR, 
        pv_error            VARCHAR2,
        pv_error_message    VARCHAR2)    
    IS
        v_status     VARCHAR2(10) := pv_error;
        v_message    VARCHAR2(200) := pv_error_message; 
    BEGIN
        IF v_status = 100 THEN
            v_status := '01';
            v_message:= 'Không tìm thấy thông tin đơn';
        END IF;
            
        OPEN pv_cursor FOR SELECT v_status pv_status, v_message pv_des FROM DUAL;
        RETURN;
    END;
    
    
END PCK_ADMIN;