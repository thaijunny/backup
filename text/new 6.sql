ALTER TABLE CUSTOMERHIS MODIFY (IDNUMBER VARCHAR2(20 BYTE));

ALTER TABLE BUSINESS
    MODIFY (BANKACCOUNTNAME NVARCHAR2(100 BYTE));

ALTER TABLE CUSTOMER_EXTRA
    MODIFY (BANKACCOUNTNAME NVARCHAR2(100 BYTE));
	
	 MODIFY ADDRESSVEHICLEDOCUMENTS NVARCHAR2(100);
	  MODIFY ADDRESSVEHICLEDOCUMENTS NVARCHAR2(100);
	  MODIFY ADDRESSVEHICLEDOCUMENTS NVARCHAR2(100);
	/
	
	
	DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM user_tab_columns
WHERE table_name = 'PROVINCE'
  AND column_name = 'NEW_POLICY';

IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            ALTER TABLE PROVINCE
            ADD NEW_POLICY NUMBER(1) DEFAULT 0
        ';
END IF;
END;

/
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (97, 'Hà Nội', '', 'Thành phố Trung ương', 'HN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (98, 'Cao Bằng', '', 'Tỉnh', 'CB', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (99, 'Tuyên Quang', '', 'Tỉnh', 'TQ', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (100, 'Điện Biên', '', 'Tỉnh', 'ĐB', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (101, 'Lai Châu', '', 'Tỉnh', 'LC', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (102, 'Sơn La', '', 'Tỉnh', 'SL', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (103, 'Lào Cai', '', 'Tỉnh', 'LC', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (104, 'Thái Nguyên', '', 'Tỉnh', 'TN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (105, 'Lạng Sơn', '', 'Tỉnh', 'LS', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (106, 'Quảng Ninh', '', 'Tỉnh', 'QN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (107, 'Bắc Ninh', '', 'Tỉnh', 'BN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (108, 'Phú Thọ', '', 'Tỉnh', 'PT', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (109, 'Hải Phòng', '', 'Thành phố Trung ương', 'HP', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (110, 'Hưng Yên', '', 'Tỉnh', 'HY', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (111, 'Ninh Bình', '', 'Tỉnh', 'NB', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (112, 'Thanh Hóa', '', 'Tỉnh', 'TH', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (113, 'Nghệ An', '', 'Tỉnh', 'NA', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (114, 'Hà Tĩnh', '', 'Tỉnh', 'HT', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (115, 'Quảng Trị', '', 'Tỉnh', 'QT', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (116, 'Huế', '', 'Thành phố Trung ương', 'H', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (117, 'Đà Nẵng', '', 'Thành phố Trung ương', 'ĐN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (118, 'Quảng Ngãi', '', 'Tỉnh', 'QN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (119, 'Gia Lai', '', 'Tỉnh', 'GL', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (120, 'Khánh Hòa', '', 'Tỉnh', 'KH', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (121, 'Đắk Lắk', '', 'Tỉnh', 'ĐL', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (122, 'Lâm Đồng', '', 'Tỉnh', 'LĐ', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (123, 'Đồng Nai', '', 'Tỉnh', 'ĐN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (124, 'Hồ Chí Minh', '', 'Thành phố Trung ương', 'HCM', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (125, 'Tây Ninh', '', 'Tỉnh', 'TN', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (126, 'Đồng Tháp', '', 'Tỉnh', 'ĐT', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (127, 'Vĩnh Long', '', 'Tỉnh', 'VL', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (128, 'An Giang', '', 'Tỉnh', 'AG', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (129, 'Cần Thơ', '', 'Thành phố Trung ương', 'CT', 1);
INSERT INTO province (ID, PNAME, EN_NAME, PLEVEL, SHORT_NAME, NEW_POLICY) VALUES (130, 'Cà Mau', '', 'Tỉnh', 'CM', 1);

/

DECLARE
v_count NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_count
FROM user_tab_columns
WHERE table_name = 'WARD'
  AND column_name = 'PID';

IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            ALTER TABLE WARD
            ADD PID NUMBER
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
WHERE index_name = 'IDX_WARD_PID';

IF v_count = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE INDEX IDX_WARD_PID ON WARD (PID)
        ';
END IF;
END;
/

INSERT ALL
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32249, 'Ba Đình', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32250, 'Ngọc Hà', 'Lieu Giai Commune', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32251, 'Giảng Võ', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32252, 'Hoàn Kiếm', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32253, 'Cửa Nam', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32254, 'Phú Thượng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32255, 'Hồng Hà', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32256, 'Tây Hồ', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32257, 'Bồ Đề', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32258, 'Việt Hưng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32259, 'Phúc Lợi', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32260, 'Long Biên', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32261, 'Nghĩa Đô', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32262, 'Cầu Giấy', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32263, 'Yên Hòa', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32264, 'Ô Chợ Dừa', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32265, 'Láng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32266, 'Văn Miếu - Quốc Tử Giám', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32267, 'Kim Liên', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32268, 'Đống Đa', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32269, 'Hai Bà Trưng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32270, 'Vĩnh Tuy', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32271, 'Bạch Mai', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32272, 'Vĩnh Hưng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32273, 'Định Công', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32274, 'Tương Mai', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32275, 'Lĩnh Nam', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32276, 'Hoàng Mai', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32277, 'Hoàng Liệt', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32278, 'Yên Sở', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32279, 'Phương Liệt', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32280, 'Khương Đình', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32281, 'Thanh Xuân', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32282, 'Sóc Sơn', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32283, 'Kim Anh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32284, 'Trung Giã', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32285, 'Đa Phúc', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32286, 'Nội Bài', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32287, 'Đông Anh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32288, 'Phúc Thịnh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32289, 'Thư Lâm', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32290, 'Thiên Lộc', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32291, 'Vĩnh Thanh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32292, 'Phù Đổng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32293, 'Thuận An', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32294, 'Gia Lâm', 'Trau Quy Commune', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32295, 'Bát Tràng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32296, 'Từ Liêm', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32297, 'Thượng Cát', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32298, 'Đông Ngạc', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32299, 'Xuân Đỉnh', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32300, 'Tây Tựu', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32301, 'Phú Diễn', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32302, 'Xuân Phương', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32303, 'Tây Mỗ', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32304, 'Đại Mỗ', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32305, 'Thanh Trì', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32306, 'Thanh Liệt', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32307, 'Đại Thanh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32308, 'Ngọc Hồi', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32309, 'Nam Phù', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32310, 'Yên Xuân', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32311, 'Quang Minh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32312, 'Yên Lãng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32313, 'Tiến Thắng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32314, 'Mê Linh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32315, 'Kiến Hưng', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32316, 'Hà Đông', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32317, 'Yên Nghĩa', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32318, 'Phú Lương', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32319, 'Sơn Tây', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32320, 'Tùng Thiện', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32321, 'Đoài Phương', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32322, 'Quảng Oai', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32323, 'Cổ Đô', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32324, 'Minh Châu', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32325, 'Vật Lại', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32326, 'Bất Bạt', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32327, 'Suối Hai', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32328, 'Ba Vì', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32329, 'Yên Bài', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32330, 'Phúc Thọ', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32331, 'Phúc Lộc', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32332, 'Hát Môn', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32333, 'Đan Phượng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32334, 'Liên Minh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32335, 'Ô Diên', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32336, 'Hoài Đức', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32337, 'Dương Hòa', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32338, 'Sơn Đồng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32339, 'An Khánh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32340, 'Dương Nội', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32341, 'Quốc Oai', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32342, 'Kiều Phú', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32343, 'Hưng Đạo', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32344, 'Phú Cát', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32345, 'Thạch Thất', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32346, 'Hạ Bằng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32347, 'Hòa Lạc', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32348, 'Tây Phương', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32349, 'Chương Mỹ', '', 'Phường', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32350, 'Phú Nghĩa', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32351, 'Xuân Mai', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32352, 'Quảng Bị', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32353, 'Trần Phú', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32354, 'Hòa Phú', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32355, 'Thanh Oai', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32356, 'Bình Minh', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32357, 'Tam Hưng', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32358, 'Dân Hòa', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32359, 'Thường Tín', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32360, 'Hồng Vân', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32361, 'Thượng Phúc', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32362, 'Chương Dương', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32363, 'Phú Xuyên', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32364, 'Phượng Dực', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32365, 'Chuyên Mỹ', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32366, 'Đại Xuyên', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32367, 'Vân Đình', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32368, 'Ứng Thiên', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32369, 'Ứng Hòa', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32370, 'Hòa Xá', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32371, 'Mỹ Đức', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32372, 'Phúc Sơn', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32373, 'Hồng Sơn', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32374, 'Hương Sơn', '', 'Xã', NULL, 97)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32375, 'Thục Phán', '', 'Phường', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32376, 'Nùng Trí Cao', '', 'Phường', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32377, 'Tân Giang', '', 'Phường', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32378, 'Bảo Lâm', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32379, 'Lý Bôn', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32380, 'Nam Quang', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32381, 'Quảng Lâm', 'Thach Lam commune', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32382, 'Yên Thổ', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32383, 'Bảo Lạc', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32384, 'Cốc Pàng', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32385, 'Cô Ba', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32386, 'Khánh Xuân', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32387, 'Xuân Trường', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32388, 'Hưng Đạo', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32389, 'Huy Giáp', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32390, 'Sơn Lộ', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32391, 'Thông Nông', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32392, 'Cần Yên', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32393, 'Thanh Long', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32394, 'Trường Hà', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32395, 'Lũng Nặm', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32396, 'Tổng Cọt', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32397, 'Hà Quảng', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32398, 'Trà Lĩnh', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32399, 'Quang Hán', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32400, 'Quang Trung', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32401, 'Trùng Khánh', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32402, 'Đình Phong', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32403, 'Đàm Thủy', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32404, 'Đoài Dương', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32405, 'Lý Quốc', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32406, 'Quang Long', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32407, 'Hạ Lang', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32408, 'Vinh Quý', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32409, 'Quảng Uyên', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32410, 'Độc Lập', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32411, 'Hạnh Phúc', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32412, 'Bế Văn Đàn', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32413, 'Phục Hòa', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32414, 'Hòa An', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32415, 'Nam Tuấn', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32416, 'Nguyễn Huệ', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32417, 'Bạch Đằng', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32418, 'Nguyên Bình', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32419, 'Tĩnh Túc', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32420, 'Ca Thành', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32421, 'Minh Tâm', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32422, 'Phan Thanh', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32423, 'Tam Kim', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32424, 'Thành Công', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32425, 'Đông Khê', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32426, 'Canh Tân', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32427, 'Kim Đồng', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32428, 'Minh Khai', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32429, 'Thạch An', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32430, 'Đức Long', '', 'Xã', NULL, 98)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32431, 'Hà Giang 2', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32432, 'Hà Giang 1', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32433, 'Ngọc Đường', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32434, 'Phú Linh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32435, 'Lũng Cú', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32436, 'Đồng Văn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32437, 'Sà Phìn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32438, 'Phố Bảng', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32439, 'Lũng Phìn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32440, 'Mèo Vạc', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32441, 'Sơn Vĩ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32442, 'Sủng Máng', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32443, 'Khâu Vai', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32444, 'Tát Ngà', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32445, 'Niêm Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32446, 'Yên Minh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32447, 'Thắng Mố', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32448, 'Bạch Đích', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32449, 'Mậu Duệ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32450, 'Ngọc Long', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32451, 'Đường Thượng', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32452, 'Du Già', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32453, 'Quản Bạ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32454, 'Cán Tỷ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32455, 'Nghĩa Thuận', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32456, 'Tùng Vài', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32457, 'Lùng Tám', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32458, 'Vị Xuyên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32459, 'Minh Tân', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32460, 'Thuận Hoà', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32461, 'Tùng Bá', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32462, 'Thanh Thủy', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32463, 'Lao Chải', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32464, 'Cao Bồ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32465, 'Thượng Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32466, 'Việt Lâm', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32467, 'Linh Hồ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32468, 'Bạch Ngọc', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32469, 'Minh Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32470, 'Giáp Trung', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32471, 'Bắc Mê', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32472, 'Minh Ngọc', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32473, 'Yên Cường', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32474, 'Đường Hồng', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32475, 'Hoàng Su Phì', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32476, 'Bản Máy', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32477, 'Thàng Tín', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32478, 'Tân Tiến', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32479, 'Pờ Ly Ngài', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32480, 'Nậm Dịch', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32481, 'Hồ Thầu', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32482, 'Thông Nguyên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32483, 'Pà Vầy Sủ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32484, 'Xín Mần', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32485, 'Trung Thịnh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32486, 'Nấm Dẩn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32487, 'Quảng Nguyên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32488, 'Khuôn Lùng', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32489, 'Bắc Quang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32490, 'Vĩnh Tuy', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32491, 'Đồng Tâm', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32492, 'Tân Quang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32493, 'Bằng Hành', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32494, 'Liên Hiệp', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32495, 'Hùng An', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32496, 'Đồng Yên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32497, 'Tiên Nguyên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32498, 'Yên Thành', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32499, 'Quang Bình', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32500, 'Tân Trịnh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32501, 'Bằng Lang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32502, 'Xuân Giang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32503, 'Tiên Yên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32504, 'Nông Tiến', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32505, 'Minh Xuân', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32506, 'Nà Hang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32507, 'Thượng Nông', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32508, 'Côn Lôn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32509, 'Yên Hoa', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32510, 'Hồng Thái', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32511, 'Lâm Bình', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32512, 'Thượng Lâm', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32513, 'Chiêm Hoá', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32514, 'Bình An', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32515, 'Minh Quang', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32516, 'Trung Hà', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32517, 'Tân Mỹ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32518, 'Yên Lập', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32519, 'Tân An', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32520, 'Kiên Đài', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32521, 'Kim Bình', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32522, 'Hoà An', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32523, 'Tri Phú', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32524, 'Yên Nguyên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32525, 'Hàm Yên', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32526, 'Bạch Xa', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32527, 'Phù Lưu', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32528, 'Yên Phú', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32529, 'Bình Xa', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32530, 'Thái Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32531, 'Thái Hoà', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32532, 'Hùng Đức', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32533, 'Lực Hành', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32534, 'Kiến Thiết', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32535, 'Xuân Vân', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32536, 'Hùng Lợi', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32537, 'Trung Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32538, 'Tân Long', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32539, 'Yên Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32540, 'Thái Bình', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32541, 'Mỹ Lâm', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32542, 'An Tường', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32543, 'Bình Thuận', '', 'Phường', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32544, 'Nhữ Khê', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32545, 'Sơn Dương', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32546, 'Tân Trào', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32547, 'Bình Ca', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32548, 'Minh Thanh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32549, 'Đông Thọ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32550, 'Tân Thanh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32551, 'Hồng Sơn', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32552, 'Phú Lương', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32553, 'Sơn Thuỷ', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32554, 'Trường Sinh', '', 'Xã', NULL, 99)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32555, 'Điện Biên Phủ', '', 'Phường', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32556, 'Mường Lay', '', 'Phường', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32557, 'Sín Thầu', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32558, 'Mường Nhé', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32559, 'Nậm Kè', 'Nam Ke commune', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32560, 'Mường Toong', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32561, 'Quảng Lâm', 'Quang Lam Commune', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32562, 'Mường Chà', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32563, 'Nà Hỳ', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32564, 'Na Sang', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32565, 'Chà Tở', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32566, 'Nà Bủng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32567, 'Mường Tùng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32568, 'Pa Ham', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32569, 'Nậm Nèn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32570, 'Si Pa Phìn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32571, 'Mường Pồn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32572, 'Na Son', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32573, 'Xa Dung', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32574, 'Mường Luân', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32575, 'Tủa Chùa', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32576, 'Tủa Thàng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32577, 'Sín Chải', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32578, 'Sính Phình', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32579, 'Sáng Nhè', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32580, 'Tuần Giáo', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32581, 'Mường Ảng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32582, 'Pú Nhung', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32583, 'Mường Mùn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32584, 'Chiềng Sinh', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32585, 'Quài Tở', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32586, 'Búng Lao', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32587, 'Mường Lạn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32588, 'Nà Tấu', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32589, 'Mường Phăng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32590, 'Thanh Nưa', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32591, 'Mường Thanh', '', 'Phường', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32592, 'Thanh Yên', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32593, 'Thanh An', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32594, 'Sam Mứn', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32595, 'Núa Ngam', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32596, 'Mường Nhà', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32597, 'Pu Nhi', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32598, 'Phình Giàng', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32599, 'Tìa Dình', '', 'Xã', NULL, 100)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32600, 'Đoàn Kết', '', 'Phường', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32601, 'Bình Lư', 'Tam Đường town', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32602, 'Sin Suối Hồ', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32603, 'Tả Lèng', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32604, 'Tân Phong', '', 'Phường', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32605, 'Bản Bo', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32606, 'Khun Há', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32607, 'Bum Tở', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32608, 'Nậm Hàng', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32609, 'Thu Lũm', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32610, 'Pa Ủ', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32611, 'Mường Tè', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32612, 'Mù Cả', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32613, 'Hua Bum', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32614, 'Tà Tổng', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32615, 'Bum Nưa', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32616, 'Mường Mô', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32617, 'Sìn Hồ', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32618, 'Lê Lợi', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32619, 'Pa Tần', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32620, 'Hồng Thu', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32621, 'Nậm Tăm', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32622, 'Tủa Sín Chải', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32623, 'Pu Sam Cáp', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32624, 'Nậm Mạ', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32625, 'Nậm Cuổi', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32626, 'Phong Thổ', 'Phong Thổ town', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32627, 'Sì Lở Lầu', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32628, 'Dào San', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32629, 'Khổng Lào', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32630, 'Than Uyên', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32631, 'Tân Uyên', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32632, 'Mường Khoa', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32633, 'Nậm Sỏ', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32634, 'Pắc Ta', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32635, 'Mường Than', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32636, 'Mường Kim', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32637, 'Khoen On', '', 'Xã', NULL, 101)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32638, 'Tô Hiệu', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32639, 'Chiềng An', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32640, 'Chiềng Cơi', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32641, 'Chiềng Sinh', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32642, 'Mường Chiên', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32643, 'Mường Giôn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32644, 'Quỳnh Nhai', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32645, 'Mường Sại', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32646, 'Thuận Châu', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32647, 'Bình Thuận', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32648, 'Mường É', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32649, 'Chiềng La', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32650, 'Mường Khiêng', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32651, 'Mường Bám', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32652, 'Long Hẹ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32653, 'Co Mạ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32654, 'Nậm Lầu', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32655, 'Muổi Nọi', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32656, 'Mường La', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32657, 'Chiềng Lao', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32658, 'Ngọc Chiến', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32659, 'Mường Bú', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32660, 'Chiềng Hoa', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32661, 'Bắc Yên', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32662, 'Xím Vàng', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32663, 'Tà Xùa', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32664, 'Pắc Ngà', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32665, 'Tạ Khoa', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32666, 'Chiềng Sại', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32667, 'Suối Tọ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32668, 'Mường Cơi', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32669, 'Phù Yên', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32670, 'Gia Phù', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32671, 'Mường Bang', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32672, 'Tường Hạ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32673, 'Kim Bon', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32674, 'Tân Phong', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32675, 'Mộc Sơn', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32676, 'Mộc Châu', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32677, 'Thảo Nguyên', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32678, 'Chiềng Sơn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32679, 'Tân Yên', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32680, 'Đoàn Kết', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32681, 'Song Khủa', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32682, 'Tô Múa', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32683, 'Vân Sơn', '', 'Phường', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32684, 'Lóng Sập', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32685, 'Vân Hồ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32686, 'Xuân Nha', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32687, 'Yên Châu', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32688, 'Chiềng Hặc', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32689, 'Yên Sơn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32690, 'Lóng Phiêng', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32691, 'Phiêng Khoài', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32692, 'Mai Sơn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32693, 'Chiềng Sung', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32694, 'Mường Chanh', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32695, 'Chiềng Mung', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32696, 'Chiềng Mai', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32697, 'Tà Hộc', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32698, 'Phiêng Cằm', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32699, 'Phiêng Pằn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32700, 'Sông Mã', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32701, 'Bó Sinh', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32702, 'Mường Lầm', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32703, 'Nậm Ty', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32704, 'Chiềng Sơ', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32705, 'Chiềng Khoong', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32706, 'Huổi Một', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32707, 'Mường Hung', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32708, 'Chiềng Khương', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32709, 'Púng Bánh', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32710, 'Sốp Cộp', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32711, 'Mường Lèo', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32712, 'Mường Lạn', '', 'Xã', NULL, 102)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32713, 'Lào Cai', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32714, 'Cam Đường', 'Nam Cuong Commune', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32715, 'Hợp Thành', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32716, 'Bát Xát', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32717, 'A Mú Sung', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32718, 'Trịnh Tường', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32719, 'Y Tý', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32720, 'Dền Sáng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32721, 'Bản Xèo', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32722, 'Mường Hum', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32723, 'Cốc San', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32724, 'Pha Long', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32725, 'Mường Khương', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32726, 'Cao Sơn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32727, 'Bản Lầu', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32728, 'Si Ma Cai', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32729, 'Sín Chéng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32730, 'Bắc Hà', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32731, 'Tả Củ Tỷ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32732, 'Lùng Phình', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32733, 'Bản Liền', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32734, 'Bảo Nhai', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32735, 'Cốc Lầu', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32736, 'Phong Hải', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32737, 'Bảo Thắng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32738, 'Tằng Loỏng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32739, 'Gia Phú', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32740, 'Xuân Quang', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32741, 'Bảo Yên', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32742, 'Nghĩa Đô', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32743, 'Xuân Hòa', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32744, 'Thượng Hà', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32745, 'Bảo Hà', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32746, 'Phúc Khánh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32747, 'Ngũ Chỉ Sơn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32748, 'Sa Pa', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32749, 'Tả Phìn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32750, 'Tả Van', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32751, 'Mường Bo', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32752, 'Bản Hồ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32753, 'Võ Lao', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32754, 'Nậm Chày', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32755, 'Văn Bàn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32756, 'Nậm Xé', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32757, 'Chiềng Ken', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32758, 'Khánh Yên', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32759, 'Dương Quỳ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32760, 'Minh Lương', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32761, 'Yên Bái', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32762, 'Nam Cường', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32763, 'Văn Phú', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32764, 'Nghĩa Lộ', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32765, 'Lục Yên', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32766, 'Lâm Thượng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32767, 'Tân Lĩnh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32768, 'Khánh Hòa', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32769, 'Mường Lai', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32770, 'Phúc Lợi', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32771, 'Mậu A', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32772, 'Lâm Giang', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32773, 'Châu Quế', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32774, 'Đông Cuông', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32775, 'Phong Dụ Hạ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32776, 'Phong Dụ Thượng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32777, 'Tân Hợp', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32778, 'Xuân Ái', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32779, 'Mỏ Vàng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32780, 'Mù Cang Chải', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32781, 'Nậm Có', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32782, 'Khao Mang', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32783, 'Lao Chải', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32784, 'Chế Tạo', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32785, 'Púng Luông', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32786, 'Trấn Yên', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32787, 'Quy Mông', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32788, 'Lương Thịnh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32789, 'Âu Lâu', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32790, 'Việt Hồng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32791, 'Hưng Khánh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32792, 'Hạnh Phúc', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32793, 'Tà Xi Láng', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32794, 'Trạm Tấu', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32795, 'Phình Hồ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32796, 'Tú Lệ', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32797, 'Gia Hội', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32798, 'Sơn Lương', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32799, 'Liên Sơn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32800, 'Trung Tâm', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32801, 'Văn Chấn', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32802, 'Cầu Thia', '', 'Phường', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32803, 'Cát Thịnh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32804, 'Chấn Thịnh', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32805, 'Thượng Bằng La', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32806, 'Nghĩa Tâm', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32807, 'Yên Bình', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32808, 'Thác Bà', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32809, 'Cảm Nhân', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32810, 'Yên Thành', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32811, 'Bảo Ái', '', 'Xã', NULL, 103)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32812, 'Đức Xuân', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32813, 'Bắc Kạn', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32814, 'Phong Quang', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32815, 'Bằng Thành', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32816, 'Cao Minh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32817, 'Nghiên Loan', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32818, 'Phúc Lộc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32819, 'Ba Bể', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32820, 'Chợ Rã', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32821, 'Thượng Minh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32822, 'Đồng Phúc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32823, 'Nà Phặc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32824, 'Bằng Vân', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32825, 'Ngân Sơn', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32826, 'Thượng Quan', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32827, 'Hiệp Lực', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32828, 'Phủ Thông', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32829, 'Vĩnh Thông', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32830, 'Cẩm Giàng', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32831, 'Bạch Thông', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32832, 'Chợ Đồn', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32833, 'Nam Cường', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32834, 'Quảng Bạch', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32835, 'Yên Thịnh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32836, 'Nghĩa Tá', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32837, 'Yên Phong', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32838, 'Chợ Mới', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32839, 'Thanh Mai', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32840, 'Tân Kỳ', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32841, 'Thanh Thịnh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32842, 'Yên Bình', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32843, 'Văn Lang', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32844, 'Cường Lợi', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32845, 'Na Rì', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32846, 'Trần Phú', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32847, 'Côn Minh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32848, 'Xuân Dương', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32849, 'Phan Đình Phùng', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32850, 'Quyết Thắng', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32851, 'Gia Sàng', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32852, 'Quan Triều', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32853, 'Đại Phúc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32854, 'Tích Lương', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32855, 'Tân Cương', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32856, 'Sông Công', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32857, 'Bách Quang', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32858, 'Bá Xuyên', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32859, 'Lam Vỹ', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32860, 'Kim Phượng', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32861, 'Phượng Tiến', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32862, 'Định Hóa', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32863, 'Trung Hội', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32864, 'Bình Yên', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32865, 'Phú Đình', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32866, 'Bình Thành', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32867, 'Phú Lương', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32868, 'Yên Trạch', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32869, 'Hợp Thành', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32870, 'Vô Tranh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32871, 'Trại Cau', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32872, 'Văn Lăng', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32873, 'Quang Sơn', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32874, 'Văn Hán', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32875, 'Đồng Hỷ', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32876, 'Nam Hòa', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32877, 'Linh Sơn', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32878, 'Võ Nhai', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32879, 'Sảng Mộc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32880, 'Nghinh Tường', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32881, 'Thần Sa', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32882, 'La Hiên', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32883, 'Tràng Xá', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32884, 'Dân Tiến', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32885, 'Phú Xuyên', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32886, 'Đức Lương', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32887, 'Phú Lạc', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32888, 'Phú Thịnh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32889, 'An Khánh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32890, 'La Bằng', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32891, 'Đại Từ', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32892, 'Vạn Phú', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32893, 'Quân Chu', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32894, 'Phúc Thuận', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32895, 'Phổ Yên', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32896, 'Thành Công', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32897, 'Vạn Xuân', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32898, 'Trung Thành', '', 'Phường', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32899, 'Phú Bình', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32900, 'Tân Khánh', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32901, 'Tân Thành', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32902, 'Điềm Thụy', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32903, 'Kha Sơn', '', 'Xã', NULL, 104)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32904, 'Đông Kinh', '', 'Phường', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32905, 'Lương Văn Tri', '', 'Phường', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32906, 'Tam Thanh', '', 'Phường', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32907, 'Đoàn Kết', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32908, 'Quốc Khánh', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32909, 'Tân Tiến', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32910, 'Kháng Chiến', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32911, 'Thất Khê', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32912, 'Tràng Định', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32913, 'Quốc Việt', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32914, 'Hoa Thám', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32915, 'Quý Hòa', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32916, 'Hồng Phong', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32917, 'Thiện Hòa', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32918, 'Thiện Thuật', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32919, 'Thiện Long', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32920, 'Bình Gia', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32921, 'Tân Văn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32922, 'Na Sầm', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32923, 'Thụy Hùng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32924, 'Hội Hoan', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32925, 'Văn Lãng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32926, 'Hoàng Văn Thụ', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32927, 'Đồng Đăng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32928, 'Kỳ Lừa', '', 'Phường', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32929, 'Ba Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32930, 'Cao Lộc', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32931, 'Công Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32932, 'Văn Quan', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32933, 'Điềm He', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32934, 'Khánh Khê', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32935, 'Yên Phúc', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32936, 'Tri Lễ', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32937, 'Tân Đoàn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32938, 'xã Bắc Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32939, 'Tân Tri', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32940, 'Hưng Vũ', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32941, 'Vũ Lễ', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32942, 'Vũ Lăng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32943, 'Nhất Hòa', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32944, 'Hữu Lũng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32945, 'Yên Bình', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32946, 'Hữu Liên', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32947, 'Vân Nham', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32948, 'Cai Kinh', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32949, 'Thiện Tân', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32950, 'Tân Thành', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32951, 'Tuấn Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32952, 'Chi Lăng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32953, 'Bằng Mạc', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32954, 'Chiến Thắng', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32955, 'Nhân Lý', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32956, 'Vạn Linh', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32957, 'Quan Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32958, 'Na Dương', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32959, 'Lộc Bình', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32960, 'Mẫu Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32961, 'Khuất Xá', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32962, 'Thống Nhất', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32963, 'Lợi Bác', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32964, 'Xuân Dương', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32965, 'Đình Lập', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32966, 'Thái Bình', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32967, 'Kiên Mộc', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32968, 'Châu Sơn', '', 'Xã', NULL, 105)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32969, 'Hà Tu', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32970, 'Cao Xanh', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32971, 'Việt Hưng', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32972, 'Bãi Cháy', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32973, 'Hà Lầm', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32974, 'Hồng Gai', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32975, 'Hạ Long', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32976, 'Tuần Châu', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32977, 'Móng Cái 2', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32978, 'Móng Cái 1', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32979, 'Hải Sơn', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32980, 'Hải Ninh', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32981, 'Móng Cái 3', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32982, 'Vĩnh Thực', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32983, 'Mông Dương', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32984, 'Quang Hanh', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32985, 'Cửa Ông', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32986, 'Cẩm Phả', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32987, 'Hải Hòa', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32988, 'Uông Bí', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32989, 'Vàng Danh', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32990, 'Yên Tử', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32991, 'Bình Liêu', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32992, 'Hoành Mô', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32993, 'Lục Hồn', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32994, 'Tiên Yên', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32995, 'Điền Xá', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32996, 'Đông Ngũ', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32997, 'Hải Lạng', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32998, 'Đầm Hà', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (32999, 'Quảng Tân', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33000, 'Quảng Hà', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33001, 'Quảng Đức', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33002, 'Đường Hoa', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33003, 'Cái Chiên', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33004, 'Ba Chẽ', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33005, 'Kỳ Thượng', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33006, 'Lương Minh', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33007, 'Đặc khu Vân Đồn', '', 'Đặc khu', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33008, 'Hoành Bồ', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33009, 'Quảng La', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33010, 'Thống Nhất', '', 'Xã', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33011, 'Mạo Khê', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33012, 'Bình Khê', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33013, 'An Sinh', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33014, 'Đông Triều', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33015, 'Hoàng Quế', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33016, 'Quảng Yên', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33017, 'Đông Mai', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33018, 'Hiệp Hòa', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33019, 'Hà An', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33020, 'Liên Hòa', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33021, 'Phong Cốc', '', 'Phường', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33022, 'Đặc khu Cô Tô', '', 'Đặc khu', NULL, 106)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33023, 'Bắc Giang', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33024, 'Đa Mai', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33025, 'Xuân Lương', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33026, 'Tam Tiến', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33027, 'Đồng Kỳ', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33028, 'Yên Thế', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33029, 'Bố Hạ', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33030, 'Nhã Nam', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33031, 'Phúc Hòa', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33032, 'Quang Trung', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33033, 'Tân Yên', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33034, 'Ngọc Thiện', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33035, 'Lạng Giang', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33036, 'Tiên Lục', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33037, 'Kép', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33038, 'Mỹ Thái', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33039, 'Tân Dĩnh', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33040, 'Lục Nam', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33041, 'Đông Phú', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33042, 'Bảo Đài', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33043, 'Nghĩa Phương', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33044, 'Trường Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33045, 'Lục Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33046, 'Bắc Lũng', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33047, 'Cẩm Lý', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33048, 'Chũ', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33049, 'Tân Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33050, 'Sa Lý', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33051, 'Biên Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33052, 'Sơn Hải', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33053, 'Kiên Lao', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33054, 'Biển Động', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33055, 'Lục Ngạn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33056, 'Đèo Gia', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33057, 'Nam Dương', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33058, 'Phượng Sơn', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33059, 'Sơn Động', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33060, 'Tây Yên Tử', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33061, 'Vân Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33062, 'Đại Sơn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33063, 'Yên Định', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33064, 'An Lạc', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33065, 'Tuấn Đạo', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33066, 'Dương Hưu', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33067, 'Yên Dũng', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33068, 'Tân An', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33069, 'Tiền Phong', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33070, 'Tân Tiến', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33071, 'Đồng Việt', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33072, 'Cảnh Thụy', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33073, 'Tự Lạn', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33074, 'Việt Yên', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33075, 'Nếnh', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33076, 'Vân Hà', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33077, 'Hoàng Vân', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33078, 'Hiệp Hoà', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33079, 'Hợp Thịnh', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33080, 'Xuân Cẩm', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33081, 'Vũ Ninh', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33082, 'Kinh Bắc', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33083, 'Võ Cường', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33084, 'Yên Phong', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33085, 'Tam Giang', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33086, 'Yên Trung', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33087, 'Tam Đa', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33088, 'Văn Môn', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33089, 'Quế Võ', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33090, 'Nhân Hòa', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33091, 'Phương Liễu', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33092, 'Nam Sơn', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33093, 'Phù Lãng', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33094, 'Bồng Lai', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33095, 'Đào Viên', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33096, 'Chi Lăng', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33097, 'Tiên Du', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33098, 'Hạp Lĩnh', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33099, 'Liên Bão', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33100, 'Đại Đồng', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33101, 'Tân Chi', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33102, 'Phật Tích', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33103, 'Từ Sơn', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33104, 'Tam Sơn', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33105, 'Phù Khê', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33106, 'Đồng Nguyên', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33107, 'Thuận Thành', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33108, 'Mão Điền', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33109, 'Trí Quả', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33110, 'Trạm Lộ', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33111, 'Song Liễu', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33112, 'Ninh Xá', '', 'Phường', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33113, 'Gia Bình', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33114, 'Cao Đức', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33115, 'Đại Lai', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33116, 'Nhân Thắng', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33117, 'Đông Cứu', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33118, 'Lương Tài', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33119, 'Trung Kênh', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33120, 'Trung Chính', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33121, 'Lâm Thao', '', 'Xã', NULL, 107)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33122, 'Tân Hòa', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33123, 'Hòa Bình', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33124, 'Thống Nhất', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33125, 'Đà Bắc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33126, 'Đức Nhàn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33127, 'Tân Pheo', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33128, 'Quy Đức', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33129, 'Cao Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33130, 'Tiền Phong', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33131, 'Kỳ Sơn', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33132, 'Thịnh Minh', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33133, 'Lương Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33134, 'Liên Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33135, 'Kim Bôi', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33136, 'Nật Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33137, 'Mường Động', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33138, 'Cao Dương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33139, 'Hợp Kim', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33140, 'Dũng Tiến', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33141, 'Cao Phong', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33142, 'Thung Nai', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33143, 'Mường Thàng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33144, 'Tân Lạc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33145, 'Mường Hoa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33146, 'Vân Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33147, 'Mường Bi', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33148, 'Toàn Thắng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33149, 'Mai Châu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33150, 'Tân Mai', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33151, 'Pà Cò', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33152, 'Bao La', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33153, 'Mai Hạ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33154, 'Lạc Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33155, 'Mường Vang', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33156, 'Nhân Nghĩa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33157, 'Thượng Cốc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33158, 'Yên Phú', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33159, 'Quyết Thắng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33160, 'Ngọc Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33161, 'Đại Đồng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33162, 'Yên Thủy', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33163, 'Lạc Lương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33164, 'Yên Trị', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33165, 'Lạc Thủy', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33166, 'An Nghĩa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33167, 'An Bình', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33168, 'Nông Trang', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33169, 'Việt Trì', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33170, 'Thanh Miếu', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33171, 'Vân Phú', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33172, 'Phú Thọ', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33173, 'Âu Cơ', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33174, 'Phong Châu', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33175, 'Đoan Hùng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33176, 'Bằng Luân', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33177, 'Chí Đám', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33178, 'Tây Cốc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33179, 'Chân Mộng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33180, 'Hạ Hòa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33181, 'Đan Thượng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33182, 'Hiền Lương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33183, 'Yên Kỳ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33184, 'Văn Lang', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33185, 'Vĩnh Chân', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33186, 'Thanh Ba', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33187, 'Quảng Yên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33188, 'Hoàng Cương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33189, 'Đông Thành', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33190, 'Chí Tiên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33191, 'Liên Minh', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33192, 'Phù Ninh', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33193, 'Phú Mỹ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33194, 'Trạm Thản', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33195, 'Dân Chủ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33196, 'Bình Phú', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33197, 'Yên Lập', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33198, 'Sơn Lương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33199, 'Xuân Viên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33200, 'Trung Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33201, 'Thượng Long', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33202, 'Minh Hòa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33203, 'Cẩm Khê', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33204, 'Tiên Lương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33205, 'Vân Bán', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33206, 'Phú Khê', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33207, 'Hùng Việt', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33208, 'Đồng Lương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33209, 'Tam Nông', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33210, 'Hiền Quan', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33211, 'Vạn Xuân', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33212, 'Thọ Văn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33213, 'Lâm Thao', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33214, 'Xuân Lũng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33215, 'Hy Cương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33216, 'Phùng Nguyên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33217, 'Bản Nguyên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33218, 'Thanh Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33219, 'Thu Cúc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33220, 'Lai Đồng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33221, 'Tân Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33222, 'Võ Miếu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33223, 'Xuân Đài', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33224, 'Minh Đài', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33225, 'Văn Miếu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33226, 'Cự Đồng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33227, 'Long Cốc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33228, 'Hương Cần', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33229, 'Khả Cửu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33230, 'Yên Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33231, 'Đào Xá', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33232, 'Thanh Thủy', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33233, 'Tu Vũ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33234, 'Vĩnh Yên', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33235, 'Vĩnh Phúc', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33236, 'Phúc Yên', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33237, 'Xuân Hòa', '', 'Phường', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33238, 'Lập Thạch', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33239, 'Hợp Lý', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33240, 'Yên Lãng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33241, 'Hải Lựu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33242, 'Thái Hòa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33243, 'Liên Hòa', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33244, 'Tam Sơn', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33245, 'Tiên Lữ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33246, 'Sông Lô', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33247, 'Sơn Đông', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33248, 'Tam Dương', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33249, 'Tam Dương Bắc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33250, 'Hoàng An', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33251, 'Hội Thịnh', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33252, 'Tam Đảo', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33253, 'Đạo Trù', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33254, 'Đại Đình', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33255, 'Bình Nguyên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33256, 'Bình Tuyền', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33257, 'Bình Xuyên', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33258, 'Xuân Lãng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33259, 'Yên Lạc', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33260, 'Tề Lỗ', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33261, 'Tam Hồng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33262, 'Nguyệt Đức', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33263, 'Liên Châu', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33264, 'Vĩnh Tường', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33265, 'Vĩnh An', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33266, 'Vĩnh Hưng', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33267, 'Vĩnh Thành', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33268, 'Thổ Tang', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33269, 'Vĩnh Phú', '', 'Xã', NULL, 108)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33270, 'Thành Đông', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33271, 'Hải Dương', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33272, 'Lê Thanh Nghị', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33273, 'Tân Hưng', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33274, 'Việt Hòa', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33275, 'Chí Linh', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33276, 'Chu Văn An', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33277, 'Nguyễn Trãi', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33278, 'Trần Hưng Đạo', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33279, 'Trần Nhân Tông', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33280, 'Lê Đại Hành', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33281, 'Nam Sách', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33282, 'Hợp Tiến', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33283, 'Trần Phú', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33284, 'Thái Tân', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33285, 'An Phú', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33286, 'Ái Quốc', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33287, 'Kinh Môn', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33288, 'Bắc An Phụ', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33289, 'Nam An Phụ', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33290, 'Nhị Chiểu', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33291, 'Phạm Sư Mạnh', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33292, 'Trần Liễu', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33293, 'Nguyễn Đại Năng', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33294, 'Phú Thái', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33295, 'Lai Khê', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33296, 'An Thành', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33297, 'Kim Thành', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33298, 'Thanh Hà', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33299, 'Hà Bắc', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33300, 'Nam Đồng', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33301, 'Hà Nam', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33302, 'Hà Tây', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33303, 'Hà Đông', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33304, 'Cẩm Giang', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33305, 'Tứ Minh', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33306, 'Cẩm Giàng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33307, 'Tuệ Tĩnh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33308, 'Mao Điền', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33309, 'Kẻ Sặt', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33310, 'Bình Giang', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33311, 'Đường An', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33312, 'Thượng Hồng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33313, 'Gia Lộc', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33314, 'Thạch Khôi', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33315, 'Yết Kiêu', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33316, 'Gia Phúc', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33317, 'Trường Tân', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33318, 'Tứ Kỳ', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33319, 'Đại Sơn', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33320, 'Tân Kỳ', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33321, 'Chí Minh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33322, 'Lạc Phượng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33323, 'Nguyên Giáp', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33324, 'Vĩnh Lại', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33325, 'Tân An', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33326, 'Ninh Giang', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33327, 'Hồng Châu', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33328, 'Khúc Thừa Dụ', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33329, 'Thanh Miện', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33330, 'Nguyễn Lương Bằng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33331, 'Bắc Thanh Miện', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33332, 'Hải Hưng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33333, 'Nam Thanh Miện', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33334, 'Hồng Bàng', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33335, 'Ngô Quyền', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33336, 'Gia Viên', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33337, 'Lê Chân', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33338, 'An Biên', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33339, 'Đông Hải', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33340, 'Hải An', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33341, 'Kiến An', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33342, 'Phù Liễn', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33343, 'Đồ Sơn', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33344, 'Bạch Đằng', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33345, 'Lưu Kiếm', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33346, 'Việt Khê', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33347, 'Lê Ích Mộc', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33348, 'Hòa Bình', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33349, 'Nam Triệu', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33350, 'Thiên Hương', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33351, 'Thủy Nguyên', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33352, 'An Dương', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33353, 'An Phong', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33354, 'Hồng An', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33355, 'An Hải', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33356, 'An Lão', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33357, 'An Trường', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33358, 'An Quang', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33359, 'An Khánh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33360, 'An Hưng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33361, 'Kiến Thụy', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33362, 'Hưng Đạo', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33363, 'Dương Kinh', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33364, 'Nghi Dương', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33365, 'Kiến Minh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33366, 'Kiến Hưng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33367, 'Nam Đồ Sơn', '', 'Phường', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33368, 'Kiến Hải', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33369, 'Tiên Lãng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33370, 'Quyết Thắng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33371, 'Tân Minh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33372, 'Tiên Minh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33373, 'Chấn Hưng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33374, 'Hùng Thắng', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33375, 'Vĩnh Bảo', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33376, 'Vĩnh Thịnh', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33377, 'Vĩnh Thuận', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33378, 'Vĩnh Hòa', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33379, 'Vĩnh Hải', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33380, 'Vĩnh Am', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33381, 'Nguyễn Bỉnh Khiêm', '', 'Xã', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33382, 'Đặc khu Cát Hải', '', 'Đặc khu', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33383, 'Đặc khu Bạch Long Vĩ', '', 'Đặc khu', NULL, 109)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33384, 'Phố Hiến', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33385, 'Tân Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33386, 'Hồng Châu', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33387, 'Sơn Nam', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33388, 'Lạc Đạo', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33389, 'Đại Đồng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33390, 'Như Quỳnh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33391, 'Văn Giang', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33392, 'Phụng Công', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33393, 'Nghĩa Trụ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33394, 'Mễ Sở', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33395, 'Nguyễn Văn Linh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33396, 'Hoàn Long', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33397, 'Yên Mỹ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33398, 'Việt Yên', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33399, 'Mỹ Hào', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33400, 'Thượng Hồng', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33401, 'Đường Hào', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33402, 'Ân Thi', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33403, 'Phạm Ngũ Lão', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33404, 'Xuân Trúc', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33405, 'Nguyễn Trãi', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33406, 'Hồng Quang', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33407, 'Khoái Châu', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33408, 'Triệu Việt Vương', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33409, 'Việt Tiến', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33410, 'Châu Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33411, 'Chí Minh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33412, 'Lương Bằng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33413, 'Nghĩa Dân', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33414, 'Đức Hợp', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33415, 'Hiệp Cường', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33416, 'Hoàng Hoa Thám', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33417, 'Tiên Hoa', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33418, 'Tiên Lữ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33419, 'Quang Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33420, 'Đoàn Đào', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33421, 'Tiên Tiến', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33422, 'Tống Trân', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33423, 'Trần Hưng Đạo', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33424, 'Trần Lãm', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33425, 'Vũ Phúc', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33426, 'Quỳnh Phụ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33427, 'A Sào', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33428, 'Minh Thọ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33429, 'Ngọc Lâm', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33430, 'Phụ Dực', 'An Bai town', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33431, 'Đồng Bằng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33432, 'Nguyễn Du', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33433, 'Quỳnh An', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33434, 'Tân Tiến', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33435, 'Hưng Hà', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33436, 'Ngự Thiên', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33437, 'Long Hưng', 'Hung Nhan town', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33438, 'Diên Hà', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33439, 'Thần Khê', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33440, 'Tiên La', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33441, 'Lê Quý Đôn', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33442, 'Hồng Minh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33443, 'Đông Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33444, 'Bắc Đông Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33445, 'Bắc Tiên Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33446, 'Đông Tiên Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33447, 'Bắc Đông Quan', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33448, 'Tiên Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33449, 'Nam Tiên Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33450, 'Nam Đông Hưng', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33451, 'Đông Quan', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33452, 'Trà Lý', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33453, 'Thái Thụy', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33454, 'Tây Thụy Anh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33455, 'Bắc Thụy Anh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33456, 'Đông Thụy Anh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33457, 'Thụy Anh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33458, 'Nam Thụy Anh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33459, 'Bắc Thái Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33460, 'Tây Thái Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33461, 'Thái Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33462, 'Đông Thái Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33463, 'Nam Thái Ninh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33464, 'Tiền Hải', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33465, 'Đông Tiền Hải', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33466, 'Đồng Châu', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33467, 'Ái Quốc', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33468, 'Tây Tiền Hải', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33469, 'Nam Cường', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33470, 'Nam Tiền Hải', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33471, 'Hưng Phú', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33472, 'Kiến Xương', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33473, 'Trà Giang', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33474, 'Bình Nguyên', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33475, 'Lê Lợi', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33476, 'Quang Lịch', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33477, 'Vũ Quý', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33478, 'Hồng Vũ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33479, 'Bình Thanh', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33480, 'Bình Định', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33481, 'Vũ Thư', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33482, 'Vạn Xuân', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33483, 'Thư Trì', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33484, 'Thái Bình', '', 'Phường', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33485, 'Tân Thuận', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33486, 'Thư Vũ', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33487, 'Vũ Tiên', '', 'Xã', NULL, 110)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33488, 'Phủ Lý', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33489, 'Phù Vân', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33490, 'Châu Sơn', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33491, 'Duy Tiên', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33492, 'Duy Tân', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33493, 'Duy Hà', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33494, 'Đồng Văn', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33495, 'Tiên Sơn', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33496, 'Hà Nam', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33497, 'Kim Bảng', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33498, 'Lê Hồ', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33499, 'Nguyễn Uý', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33500, 'Kim Thanh', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33501, 'Tam Chúc', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33502, 'Lý Thường Kiệt', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33503, 'Liêm Tuyền', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33504, 'Liêm Hà', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33505, 'Tân Thanh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33506, 'Thanh Bình', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33507, 'Thanh Lâm', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33508, 'Thanh Liêm', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33509, 'Bình Mỹ', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33510, 'Bình Lục', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33511, 'Bình Giang', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33512, 'Bình An', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33513, 'Bình Sơn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33514, 'Lý Nhân', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33515, 'Bắc Lý', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33516, 'Nam Xang', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33517, 'Trần Thương', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33518, 'Vĩnh Trụ', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33519, 'Nhân Hà', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33520, 'Nam Lý', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33521, 'Nam Định', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33522, 'Thiên Trường', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33523, 'Đông A', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33524, 'Thành Nam', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33525, 'Mỹ Lộc', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33526, 'Vụ Bản', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33527, 'Minh Tân', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33528, 'Hiển Khánh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33529, 'Trường Thi', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33530, 'Liên Minh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33531, 'Ý Yên', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33532, 'Tân Minh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33533, 'Phong Doanh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33534, 'Vũ Dương', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33535, 'Vạn Thắng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33536, 'Yên Cường', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33537, 'Yên Đồng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33538, 'Nghĩa Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33539, 'Rạng Đông', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33540, 'Đồng Thịnh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33541, 'Nghĩa Sơn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33542, 'Hồng Phong', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33543, 'Quỹ Nhất', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33544, 'Nghĩa Lâm', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33545, 'Nam Trực', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33546, 'Vị Khê', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33547, 'Hồng Quang', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33548, 'Nam Hồng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33549, 'Nam Ninh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33550, 'Nam Minh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33551, 'Nam Đồng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33552, 'Cổ Lễ', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33553, 'Ninh Giang', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33554, 'Trực Ninh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33555, 'Cát Thành', 'Cat Thanh town', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33556, 'Quang Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33557, 'Minh Thái', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33558, 'Ninh Cường', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33559, 'Xuân Trường', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33560, 'Xuân Hồng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33561, 'Xuân Giang', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33562, 'Xuân Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33563, 'Giao Minh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33564, 'Giao Thuỷ', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33565, 'Giao Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33566, 'Giao Hoà', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33567, 'Giao Bình', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33568, 'Giao Phúc', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33569, 'Giao Ninh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33570, 'Hải Hậu', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33571, 'Hải Tiến', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33572, 'Hải Thịnh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33573, 'Hải Anh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33574, 'Hải Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33575, 'Hải An', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33576, 'Hải Quang', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33577, 'Hải Xuân', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33578, 'Hoa Lư', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33579, 'Nam Hoa Lư', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33580, 'Tam Điệp', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33581, 'Trung Sơn', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33582, 'Yên Sơn', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33583, 'Gia Lâm', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33584, 'Gia Tường', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33585, 'Cúc Phương', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33586, 'Phú Sơn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33587, 'Nho Quan', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33588, 'Thanh Sơn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33589, 'Quỳnh Lưu', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33590, 'Phú Long', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33591, 'Gia Viễn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33592, 'Gia Hưng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33593, 'Gia Vân', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33594, 'Gia Trấn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33595, 'Đại Hoàng', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33596, 'Gia Phong', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33597, 'Tây Hoa Lư', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33598, 'Yên Khánh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33599, 'Khánh Thiện', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33600, 'Đông Hoa Lư', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33601, 'Khánh Trung', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33602, 'Khánh Nhạc', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33603, 'Khánh Hội', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33604, 'Phát Diệm', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33605, 'Bình Minh', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33606, 'Kim Sơn', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33607, 'Quang Thiện', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33608, 'Chất Bình', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33609, 'Lai Thành', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33610, 'Định Hóa', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33611, 'Kim Đông', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33612, 'Yên Mô', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33613, 'Yên Thắng', '', 'Phường', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33614, 'Yên Từ', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33615, 'Yên Mạc', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33616, 'Đồng Thái', '', 'Xã', NULL, 111)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33617, 'Hàm Rồng', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33618, 'Hạc Thành', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33619, 'Bỉm Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33620, 'Quang Trung', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33621, 'Mường Lát', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33622, 'Tam Chung', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33623, 'Mường Lý', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33624, 'Trung Lý', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33625, 'Quang Chiểu', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33626, 'Pù Nhi', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33627, 'Nhi Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33628, 'Mường Chanh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33629, 'Hồi Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33630, 'Trung Thành', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33631, 'Trung Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33632, 'Phú Lệ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33633, 'Phú Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33634, 'Hiền Kiệt', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33635, 'Nam Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33636, 'Thiên Phủ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33637, 'Bá Thước', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33638, 'Điền Quang', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33639, 'Điền Lư', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33640, 'Quý Lương', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33641, 'Pù Luông', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33642, 'Cổ Lũng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33643, 'Văn Nho', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33644, 'Thiết Ống', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33645, 'Trung Hạ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33646, 'Tam Thanh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33647, 'Sơn Thủy', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33648, 'Na Mèo', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33649, 'Quan Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33650, 'Tam Lư', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33651, 'Sơn Điện', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33652, 'Mường Mìn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33653, 'Yên Khương', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33654, 'Yên Thắng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33655, 'Giao An', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33656, 'Văn Phú', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33657, 'Linh Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33658, 'Đồng Lương', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33659, 'Ngọc Lặc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33660, 'Thạch Lập', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33661, 'Ngọc Liên', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33662, 'Nguyệt Ấn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33663, 'Kiên Thọ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33664, 'Minh Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33665, 'Cẩm Thủy', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33666, 'Cẩm Thạch', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33667, 'Cẩm Tú', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33668, 'Cẩm Vân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33669, 'Cẩm Tân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33670, 'Kim Tân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33671, 'Vân Du', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33672, 'Thạch Quảng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33673, 'Thạch Bình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33674, 'Thành Vinh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33675, 'Ngọc Trạo', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33676, 'Hà Trung', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33677, 'Hà Long', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33678, 'Hoạt Giang', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33679, 'Lĩnh Toại', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33680, 'Tống Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33681, 'Vĩnh Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33682, 'Tây Đô', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33683, 'Biện Thượng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33684, 'Yên Phú', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33685, 'Quý Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33686, 'Yên Trường', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33687, 'Yên Ninh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33688, 'Định Hòa', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33689, 'Định Tân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33690, 'Yên Định', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33691, 'Thọ Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33692, 'Thọ Long', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33693, 'Xuân Hòa', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33694, 'Lam Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33695, 'Sao Vàng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33696, 'Thọ Lập', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33697, 'Xuân Tín', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33698, 'Xuân Lập', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33699, 'Bát Mọt', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33700, 'Yên Nhân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33701, 'Vạn Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33702, 'Lương Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33703, 'Luận Thành', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33704, 'Thắng Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33705, 'Thường Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33706, 'Xuân Chinh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33707, 'Tân Thành', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33708, 'Triệu Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33709, 'Thọ Bình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33710, 'Hợp Tiến', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33711, 'Tân Ninh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33712, 'Đồng Tiến', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33713, 'Thọ Ngọc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33714, 'Thọ Phú', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33715, 'An Nông', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33716, 'Thiệu Hóa', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33717, 'Thiệu Tiến', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33718, 'Thiệu Quang', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33719, 'Thiệu Toán', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33720, 'Thiệu Trung', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33721, 'Đông Tiến', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33722, 'Hoằng Hóa', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33723, 'Hoằng Giang', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33724, 'Hoằng Phú', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33725, 'Hoằng Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33726, 'Nguyệt Viên', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33727, 'Hoằng Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33728, 'Hoằng Châu', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33729, 'Hoằng Tiến', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33730, 'Hoằng Thanh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33731, 'Hậu Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33732, 'Triệu Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33733, 'Đông Thành', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33734, 'Hoa Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33735, 'Vạn Lộc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33736, 'Nga Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33737, 'Tân Tiến', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33738, 'Nga Thắng', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33739, 'Hồ Vương', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33740, 'Nga An', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33741, 'Ba Đình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33742, 'Như Xuân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33743, 'Xuân Bình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33744, 'Hóa Quỳ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33745, 'Thanh Phong', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33746, 'Thanh Quân', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33747, 'Thượng Ninh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33748, 'Như Thanh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33749, 'Xuân Du', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33750, 'Mậu Lâm', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33751, 'Xuân Thái', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33752, 'Yên Thọ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33753, 'Thanh Kỳ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33754, 'Nông Cống', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33755, 'Trung Chính', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33756, 'Thắng Lợi', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33757, 'Thăng Bình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33758, 'Trường Văn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33759, 'Tượng Lĩnh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33760, 'Công Chính', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33761, 'Đông Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33762, 'Đông Quang', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33763, 'Lưu Vệ', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33764, 'Quảng Yên', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33765, 'Quảng Chính', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33766, 'Quảng Ngọc', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33767, 'Nam Sầm Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33768, 'Quảng Phú', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33769, 'Sầm Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33770, 'Quảng Ninh', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33771, 'Quảng Bình', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33772, 'Tiên Trang', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33773, 'Tĩnh Gia', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33774, 'Ngọc Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33775, 'Các Sơn', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33776, 'Tân Dân', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33777, 'Hải Lĩnh', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33778, 'Đào Duy Từ', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33779, 'Trúc Lâm', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33780, 'Trường Lâm', '', 'Xã', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33781, 'Hải Bình', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33782, 'Nghi Sơn', '', 'Phường', NULL, 112)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33783, 'Thành Vinh', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33784, 'Trường Vinh', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33785, 'Vinh Phú', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33786, 'Vinh Lộc', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33787, 'Cửa Lò', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33788, 'Quế Phong', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33789, 'Thông Thụ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33790, 'Tiền Phong', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33791, 'Tri Lễ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33792, 'Mường Quàng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33793, 'Quỳ Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33794, 'Châu Tiến', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33795, 'Hùng Chân', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33796, 'Châu Bình', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33797, 'Mường Xén', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33798, 'Mỹ Lý', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33799, 'Bắc Lý', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33800, 'Keng Đu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33801, 'Huồi Tụ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33802, 'Mường Lống', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33803, 'Na Loi', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33804, 'Nậm Cắn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33805, 'Hữu Kiệm', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33806, 'Chiêu Lưu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33807, 'Mường Típ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33808, 'Na Ngoi', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33809, 'Tương Dương', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33810, 'Nhôn Mai', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33811, 'Hữu Khuông', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33812, 'Nga My', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33813, 'Lượng Minh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33814, 'Yên Hòa', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33815, 'Yên Na', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33816, 'Tam Quang', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33817, 'Tam Thái', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33818, 'Thái Hòa', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33819, 'Nghĩa Đàn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33820, 'Nghĩa Lâm', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33821, 'Nghĩa Thọ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33822, 'Nghĩa Hưng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33823, 'Nghĩa Mai', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33824, 'Tây Hiếu', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33825, 'Đông Hiếu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33826, 'Nghĩa Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33827, 'Nghĩa Khánh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33828, 'Quỳ Hợp', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33829, 'Châu Hồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33830, 'Châu Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33831, 'Tam Hợp', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33832, 'Minh Hợp', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33833, 'Mường Ham', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33834, 'Mường Chọng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33835, 'Hoàng Mai', 'Hoang Mai town', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33836, 'Quỳnh Mai', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33837, 'Tân Mai', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33838, 'Quỳnh Văn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33839, 'Quỳnh Tam', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33840, 'Quỳnh Sơn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33841, 'Quỳnh Anh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33842, 'Quỳnh Lưu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33843, 'Quỳnh Phú', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33844, 'Quỳnh Thắng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33845, 'Bình Chuẩn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33846, 'Mậu Thạch', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33847, 'Cam Phục', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33848, 'Châu Khê', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33849, 'Con Cuông', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33850, 'Môn Sơn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33851, 'Tân Kỳ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33852, 'Tân Phú', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33853, 'Giai Xuân', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33854, 'Nghĩa Đồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33855, 'Tiên Đồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33856, 'Tân An', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33857, 'Nghĩa Hành', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33858, 'Anh Sơn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33859, 'Thành Bình Thọ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33860, 'Nhân Hòa', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33861, 'Vĩnh Tường', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33862, 'Anh Sơn Đông', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33863, 'Yên Xuân', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33864, 'Hùng Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33865, 'Đức Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33866, 'Hải Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33867, 'Quảng Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33868, 'Diễn Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33869, 'Minh Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33870, 'An Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33871, 'Tân Châu', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33872, 'Yên Thành', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33873, 'Bình Minh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33874, 'Quang Đồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33875, 'Giai Lạc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33876, 'Đông Thành', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33877, 'Vân Du', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33878, 'Quan Thành', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33879, 'Hợp Minh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33880, 'Vân Tụ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33881, 'Bạch Ngọc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33882, 'Lương Sơn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33883, 'Đô Lương', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33884, 'Văn Hiến', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33885, 'Thuần Trung', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33886, 'Bạch Hà', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33887, 'Đại Đồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33888, 'Hạnh Lâm', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33889, 'Cát Ngạn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33890, 'Tam Đồng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33891, 'Sơn Lâm', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33892, 'Hoa Quân', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33893, 'Xuân Lâm', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33894, 'Kim Bảng', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33895, 'Bích Hào', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33896, 'Nghi Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33897, 'Hải Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33898, 'Thần Lĩnh', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33899, 'Văn Kiều', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33900, 'Phúc Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33901, 'Trung Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33902, 'Đông Lộc', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33903, 'Vinh Hưng', '', 'Phường', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33904, 'Nam Đàn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33905, 'Đại Huệ', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33906, 'Vạn An', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33907, 'Kim Liên', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33908, 'Thiên Nhẫn', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33909, 'Hưng Nguyên', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33910, 'Yên Trung', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33911, 'Hưng Nguyên Nam', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33912, 'Lam Thành', '', 'Xã', NULL, 113)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33913, 'Thành Sen', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33914, 'Trần Phú', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33915, 'Bắc Hồng Lĩnh', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33916, 'Nam Hồng Lĩnh', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33917, 'Hương Sơn', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33918, 'Sơn Hồng', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33919, 'Sơn Tiến', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33920, 'Sơn Tây', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33921, 'Sơn Giang', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33922, 'Sơn Kim 1', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33923, 'Sơn Kim 2', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33924, 'Tứ Mỹ', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33925, 'Kim Hoa', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33926, 'Đức Thọ', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33927, 'Đức Minh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33928, 'Đức Quang', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33929, 'Đức Thịnh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33930, 'Đức Đồng', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33931, 'Vũ Quang', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33932, 'Mai Hoa', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33933, 'Thượng Đức', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33934, 'Nghi Xuân', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33935, 'Đan Hải', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33936, 'Tiên Điền', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33937, 'Cổ Đạm', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33938, 'Can Lộc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33939, 'Hồng Lộc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33940, 'Tùng Lộc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33941, 'Trường Lưu', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33942, 'Gia Hanh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33943, 'Xuân Lộc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33944, 'Đồng Lộc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33945, 'Hương Khê', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33946, 'Hà Linh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33947, 'Hương Bình', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33948, 'Hương Phố', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33949, 'Hương Xuân', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33950, 'Phúc Trạch', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33951, 'Hương Đô', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33952, 'Thạch Hà', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33953, 'Lộc Hà', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33954, 'Mai Phụ', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33955, 'Đông Kinh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33956, 'Việt Xuyên', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33957, 'Thạch Khê', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33958, 'Đồng Tiến', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33959, 'Thạch Lạc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33960, 'Toàn Lưu', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33961, 'Hà Huy Tập', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33962, 'Thạch Xuân', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33963, 'Cẩm Xuyên', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33964, 'Thiên Cầm', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33965, 'Yên Hòa', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33966, 'Cẩm Bình', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33967, 'Cẩm Hưng', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33968, 'Cẩm Duệ', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33969, 'Cẩm Trung', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33970, 'Cẩm Lạc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33971, 'Sông Trí', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33972, 'Kỳ Xuân', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33973, 'Kỳ Anh', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33974, 'Hải Ninh', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33975, 'Kỳ Văn', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33976, 'Kỳ Khang', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33977, 'Kỳ Hoa', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33978, 'Vũng Áng', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33979, 'Hoành Sơn', '', 'Phường', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33980, 'Kỳ Lạc', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33981, 'Kỳ Thượng', '', 'Xã', NULL, 114)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33982, 'Đồng Thuận', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33983, 'Đồng Sơn', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33984, 'Đồng Hới', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33985, 'Minh Hóa', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33986, 'Dân Hóa', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33987, 'Tân Thành', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33988, 'Kim Điền', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33989, 'Kim Phú', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33990, 'Đồng Lê', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33991, 'Tuyên Sơn', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33992, 'Tuyên Lâm', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33993, 'Tuyên Phú', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33994, 'Tuyên Bình', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33995, 'Tuyên Hóa', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33996, 'Ba Đồn', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33997, 'Phú Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33998, 'Trung Thuần', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (33999, 'Hòa Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34000, 'Tân Gianh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34001, 'Quảng Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34002, 'Bắc Gianh', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34003, 'Nam Ba Đồn', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34004, 'Nam Gianh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34005, 'Hoàn Lão', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34006, 'Bắc Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34007, 'Phong Nha', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34008, 'Bố Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34009, 'Thượng Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34010, 'Đông Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34011, 'Nam Trạch', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34012, 'Trường Sơn', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34013, 'Quảng Ninh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34014, 'Ninh Châu', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34015, 'Trường Ninh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34016, 'Lệ Ninh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34017, 'Lệ Thủy', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34018, 'Cam Hồng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34019, 'Sen Ngư', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34020, 'Tân Mỹ', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34021, 'Trường Phú', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34022, 'Kim Ngân', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34023, 'Đông Hà', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34024, 'Nam Đông Hà', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34025, 'Quảng Trị', '', 'Phường', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34026, 'Vĩnh Linh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34027, 'Bến Quan', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34028, 'Vĩnh Hoàng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34029, 'Vĩnh Thủy', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34030, 'Cửa Tùng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34031, 'Khe Sanh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34032, 'Lao Bảo', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34033, 'Hướng Lập', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34034, 'Hướng Phùng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34035, 'Tân Lập', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34036, 'A Dơi', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34037, 'Lìa', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34038, 'Gio Linh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34039, 'Cửa Việt', 'Cua Viet town', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34040, 'Bến Hải', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34041, 'Cồn Tiên', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34042, 'Hướng Hiệp', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34043, 'Đakrông', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34044, 'Ba Lòng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34045, 'Tà Rụt', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34046, 'La Lay', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34047, 'Cam Lộ', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34048, 'Hiếu Giang', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34049, 'Triệu Phong', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34050, 'Nam Cửa Việt', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34051, 'Triệu Bình', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34052, 'Triệu Cơ', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34053, 'Ái Tử', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34054, 'Diên Sanh', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34055, 'Vĩnh Định', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34056, 'Hải Lăng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34057, 'Nam Hải Lăng', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34058, 'Mỹ Thủy', '', 'Xã', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34059, 'Đặc khu Cồn Cỏ', '', 'Đặc khu', NULL, 115)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34060, 'Phú Xuân', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34061, 'Kim Long', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34062, 'Vỹ Dạ', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34063, 'Thuận Hóa', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34064, 'Hương An', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34065, 'Thủy Xuân', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34066, 'An Cựu', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34067, 'Phong Điền', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34068, 'Phong Phú', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34069, 'Phong Dinh', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34070, 'Phong Thái', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34071, 'Quảng Điền', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34072, 'Phong Quảng', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34073, 'Đan Điền', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34074, 'Thuận An', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34075, 'Dương Nỗ', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34076, 'Phú Hồ', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34077, 'Mỹ Thượng', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34078, 'Phú Vang', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34079, 'Phú Vinh', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34080, 'Phú Bài', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34081, 'Thanh Thủy', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34082, 'Hương Thủy', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34083, 'Hương Trà', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34084, 'Hóa Châu', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34085, 'Kim Trà', '', 'Phường', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34086, 'Bình Điền', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34087, 'A Lưới 2', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34088, 'A Lưới 5', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34089, 'A Lưới 1', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34090, 'A Lưới 3', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34091, 'A Lưới 4', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34092, 'Phú Lộc', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34093, 'Vinh Lộc', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34094, 'Hưng Lộc', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34095, 'Chân Mây - Lăng Cô', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34096, 'Lộc An', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34097, 'Khe Tre', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34098, 'Nam Đông', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34099, 'Long Quảng', '', 'Xã', NULL, 116)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34100, 'Hải Vân', 'Hoa Hiep Bac Commune', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34101, 'Liên Chiểu', 'Hoa Khanh Bac Commune', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34102, 'Hòa Khánh', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34103, 'Thanh Khê', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34104, 'Hải Châu', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34105, 'Hòa Cường', 'Hoa Cuong Bac Commune', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34106, 'Cẩm Lệ', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34107, 'Sơn Trà', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34108, 'An Hải', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34109, 'Ngũ Hành Sơn', 'Khue My Commune', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34110, 'An Khê', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34111, 'Bà Nà', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34112, 'Hòa Xuân', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34113, 'Hòa Vang', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34114, 'Hòa Tiến', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34115, 'Đặc khu Hoàng Sa', '', 'Đặc khu', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34116, 'Bàn Thạch', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34117, 'Tam Kỳ', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34118, 'Hương Trà', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34119, 'Quảng Phú', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34120, 'Chiên Đàn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34121, 'Tây Hồ', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34122, 'Phú Ninh', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34123, 'Hội An Tây', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34124, 'Hội An', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34125, 'Hội An Đông', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34126, 'Tân Hiệp', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34127, 'Hùng Sơn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34128, 'Tây Giang', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34129, 'Avương', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34130, 'Đông Giang', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34131, 'Sông Kôn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34132, 'Sông Vàng', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34133, 'Bến Hiên', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34134, 'Đại Lộc', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34135, 'Thượng Đức', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34136, 'Hà Nha', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34137, 'Vu Gia', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34138, 'Phú Thuận', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34139, 'Điện Bàn', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34140, 'Điện Bàn Bắc', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34141, 'Điện Bàn Tây', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34142, 'An Thắng', '', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34143, 'Điện Bàn Đông', 'Dien Nam Trung commune', 'Phường', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34144, 'Gò Nổi', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34145, 'Nam Phước', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34146, 'Thu Bồn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34147, 'Duy Xuyên', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34148, 'Duy Nghĩa', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34149, 'Quế Sơn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34150, 'Xuân Phú', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34151, 'Nông Sơn', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34152, 'Quế Sơn Trung', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34153, 'Quế Phước', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34154, 'Thạnh Mỹ', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34155, 'La Êê', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34156, 'La Dêê', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34157, 'Nam Giang', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34158, 'Bến Giằng', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34159, 'Đắc Pring', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34160, 'Khâm Đức', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34161, 'Phước Hiệp', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34162, 'Phước Năng', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34163, 'Phước Chánh', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34164, 'Phước Thành', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34165, 'Việt An', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34166, 'Phước Trà', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34167, 'Hiệp Đức', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34168, 'Thăng Bình', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34169, 'Thăng An', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34170, 'Đồng Dương', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34171, 'Thăng Phú', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34172, 'Thăng Trường', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34173, 'Thăng Điền', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34174, 'Tiên Phước', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34175, 'Sơn Cẩm Hà', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34176, 'Lãnh Ngọc', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34177, 'Thạnh Bình', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34178, 'Trà My', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34179, 'Trà Liên', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34180, 'Trà Đốc', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34181, 'Trà Tân', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34182, 'Trà Giáp', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34183, 'Trà Leng', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34184, 'Trà Tập', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34185, 'Nam Trà My', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34186, 'Trà Linh', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34187, 'Trà Vân', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34188, 'Núi Thành', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34189, 'Tam Xuân', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34190, 'Đức Phú', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34191, 'Tam Anh', 'Tam Anh Nam commune', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34192, 'Tam Hải', '', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34193, 'Tam Mỹ', 'Tam My Tay commune', 'Xã', NULL, 117)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34194, 'Cẩm Thành', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34195, 'Nghĩa Lộ', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34196, 'An Phú', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34197, 'Bình Sơn', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34198, 'Vạn Tường', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34199, 'Bình Minh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34200, 'Bình Chương', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34201, 'Đông Sơn', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34202, 'Trà Bồng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34203, 'Thanh Bồng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34204, 'Đông Trà Bồng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34205, 'Cà Đam', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34206, 'Tây Trà', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34207, 'Tây Trà Bồng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34208, 'Trương Quang Trọng', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34209, 'Thọ Phong', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34210, 'Trường Giang', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34211, 'Ba Gia', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34212, 'Tịnh Khê', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34213, 'Sơn Tịnh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34214, 'Tư Nghĩa', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34215, 'Vệ Giang', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34216, 'Trà Giang', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34217, 'Nghĩa Giang', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34218, 'Sơn Hà', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34219, 'Sơn Hạ', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34220, 'Sơn Linh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34221, 'Sơn Thủy', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34222, 'Sơn Kỳ', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34223, 'Sơn Tây Thượng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34224, 'Sơn Tây', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34225, 'Sơn Tây Hạ', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34226, 'Sơn Mai', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34227, 'Minh Long', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34228, 'Nghĩa Hành', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34229, 'Phước Giang', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34230, 'Đình Cương', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34231, 'Thiện Tín', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34232, 'Mộ Đức', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34233, 'Long Phụng', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34234, 'Mỏ Cày', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34235, 'Lân Phong', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34236, 'Đức Phổ', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34237, 'Trà Câu', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34238, 'Nguyễn Nghiêm', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34239, 'Khánh Cường', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34240, 'Sa Huỳnh', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34241, 'Ba Tơ', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34242, 'Ba Vinh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34243, 'Ba Động', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34244, 'Ba Dinh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34245, 'Đặng Thùy Trâm', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34246, 'Ba Tô', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34247, 'Ba Vì', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34248, 'Ba Xa', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34249, 'Đặc khu Lý Sơn', '', 'Đặc khu', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34250, 'Đăk Cấm', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34251, 'Kon Tum', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34252, 'Đăk Bla', '', 'Phường', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34253, 'Ngọk Bay', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34254, 'Ia Chim', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34255, 'Đăk Rơ Wa', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34256, 'Đăk Pék', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34257, 'Đăk Plô', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34258, 'Xốp', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34259, 'Ngọc Linh', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34260, 'Đăk Long', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34261, 'Đăk Môn', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34262, 'Bờ Y', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34263, 'Dục Nông', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34264, 'Sa Loong', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34265, 'Đăk Tô', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34266, 'Đăk Sao', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34267, 'Đăk Tờ Kan', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34268, 'Tu Mơ Rông', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34269, 'Ngọk Tụ', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34270, 'Kon Đào', 'Dak Tram commune', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34271, 'Măng Ri', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34272, 'Măng Bút', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34273, 'Măng Đen', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34274, 'Kon Plông', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34275, 'Đăk Rve', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34276, 'Đăk Kôi', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34277, 'Kon Braih', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34278, 'Đăk Hà', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34279, 'Đăk Pxi', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34280, 'Đăk Ui', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34281, 'Đăk Mar', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34282, 'Ngọk Réo', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34283, 'Sa Thầy', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34284, 'Rờ Kơi', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34285, 'Sa Bình', 'Ho Moong commune', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34286, 'Ia Đal', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34287, 'Mô Rai', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34288, 'Ia Tơi', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34289, 'Ya Ly', '', 'Xã', NULL, 118)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34290, 'Quy Nhơn Bắc', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34291, 'Quy Nhơn', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34292, 'Quy Nhơn Tây', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34293, 'Quy Nhơn Nam', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34294, 'Quy Nhơn Đông', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34295, 'Nhơn Châu', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34296, 'An Lão', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34297, 'An Vinh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34298, 'An Toàn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34299, 'An Hòa', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34300, 'Tam Quan', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34301, 'Bồng Sơn', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34302, 'Hoài Nhơn Bắc', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34303, 'Hoài Nhơn Tây', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34304, 'Hoài Nhơn', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34305, 'Hoài Nhơn Đông', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34306, 'Hoài Nhơn Nam', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34307, 'Hoài Ân', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34308, 'Ân Hảo', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34309, 'Vạn Đức', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34310, 'Ân Tường', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34311, 'Kim Sơn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34312, 'Phù Mỹ', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34313, 'Bình Dương', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34314, 'Phù Mỹ Bắc', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34315, 'Phù Mỹ Đông', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34316, 'Phù Mỹ Tây', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34317, 'An Lương', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34318, 'Phù Mỹ Nam', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34319, 'Vĩnh Thạnh', 'Vinh Thanh commune', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34320, 'Vĩnh Sơn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34321, 'Vĩnh Thịnh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34322, 'Vĩnh Quang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34323, 'Tây Sơn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34324, 'Bình Hiệp', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34325, 'Bình Khê', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34326, 'Bình An', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34327, 'Bình Phú', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34328, 'Phù Cát', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34329, 'Đề Gi', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34330, 'Hội Sơn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34331, 'Hòa Hội', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34332, 'Cát Tiến', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34333, 'Xuân An', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34334, 'Ngô Mây', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34335, 'Bình Định', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34336, 'An Nhơn', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34337, 'An Nhơn Bắc', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34338, 'An Nhơn Đông', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34339, 'An Nhơn Tây', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34340, 'An Nhơn Nam', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34341, 'Tuy Phước', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34342, 'Tuy Phước Bắc', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34343, 'Tuy Phước Đông', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34344, 'Tuy Phước Tây', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34345, 'Vân Canh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34346, 'Canh Liên', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34347, 'Canh Vinh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34348, 'Diên Hồng', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34349, 'Pleiku', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34350, 'Thống Nhất', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34351, 'Hội Phú', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34352, 'Biển Hồ', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34353, 'An Phú', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34354, 'Gào', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34355, 'An Bình', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34356, 'An Khê', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34357, 'Cửu An', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34358, 'Kbang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34359, 'Đak Rong', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34360, 'Sơn Lang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34361, 'Krong', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34362, 'Tơ Tung', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34363, 'Kông Bơ La', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34364, 'Đak Đoa', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34365, 'Đak Sơmei', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34366, 'Kon Gang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34367, 'Ia Băng', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34368, 'KDang', 'Hnol commune', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34369, 'Chư Păh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34370, 'Ia Khươl', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34371, 'Ia Ly', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34372, 'Ia Phí', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34373, 'Ia Grai', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34374, 'Ia Hrung', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34375, 'Ia Krái', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34376, 'Ia O', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34377, 'Ia Chia', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34378, 'Mang Yang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34379, 'Ayun', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34380, 'Hra', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34381, 'Lơ Pang', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34382, 'Kon Chiêng', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34383, 'Kông Chro', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34384, 'Chư Krey', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34385, 'Ya Ma', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34386, 'SRó', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34387, 'Đăk Song', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34388, 'Chơ Long', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34389, 'Đức Cơ', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34390, 'Ia Krêl', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34391, 'Ia Dơk', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34392, 'Ia Dom', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34393, 'Ia Pnôn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34394, 'Ia Nan', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34395, 'Chư Prông', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34396, 'Bàu Cạn', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34397, 'Ia Tôr', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34398, 'Ia Boòng', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34399, 'Ia Púch', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34400, 'Ia Pia', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34401, 'Ia Lâu', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34402, 'Ia Mơ', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34403, 'Chư Sê', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34404, 'Chư Pưh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34405, 'Bờ Ngoong', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34406, 'Al Bá', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34407, 'Ia Hrú', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34408, 'Ia Ko', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34409, 'Ia Le', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34410, 'Đak Pơ', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34411, 'Ya Hội', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34412, 'Pờ Tó', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34413, 'Ia Pa', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34414, 'Ia Tul', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34415, 'Phú Thiện', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34416, 'Ayun Pa', '', 'Phường', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34417, 'Chư A Thai', 'Ia Ake Commune', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34418, 'Ia Hiao', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34419, 'Ia Rbol', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34420, 'Ia Sao', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34421, 'Phú Túc', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34422, 'Ia Dreh', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34423, 'Uar', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34424, 'Ia Rsai', '', 'Xã', NULL, 119)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34425, 'Bắc Nha Trang', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34426, 'Nha Trang', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34427, 'Tây Nha Trang', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34428, 'Nam Nha Trang', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34429, 'Bắc Cam Ranh', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34430, 'Cam Ranh', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34431, 'Ba Ngòi', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34432, 'Cam Linh', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34433, 'Cam Hiệp', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34434, 'Cam Lâm', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34435, 'Cam An', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34436, 'Nam Cam Ranh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34437, 'Vạn Ninh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34438, 'Tu Bông', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34439, 'Đại Lãnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34440, 'Vạn Thắng', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34441, 'Vạn Hưng', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34442, 'Ninh Hòa', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34443, 'Bắc Ninh Hòa', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34444, 'Tây Ninh Hòa', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34445, 'Hòa Trí', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34446, 'Đông Ninh Hòa', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34447, 'Tân Định', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34448, 'Hòa Thắng', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34449, 'Nam Ninh Hòa', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34450, 'Khánh Vĩnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34451, 'Trung Khánh Vĩnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34452, 'Bắc Khánh Vĩnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34453, 'Tây Khánh Vĩnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34454, 'Nam Khánh Vĩnh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34455, 'Diên Khánh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34456, 'Diên Điền', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34457, 'Diên Lâm', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34458, 'Diên Thọ', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34459, 'Diên Lạc', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34460, 'Suối Hiệp', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34461, 'Suối Dầu', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34462, 'Khánh Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34463, 'Tây Khánh Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34464, 'Đông Khánh Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34465, 'Đặc khu Trường Sa', '', 'Đặc khu', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34466, 'Đô Vinh', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34467, 'Bảo An', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34468, 'Phan Rang', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34469, 'Đông Hải', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34470, 'Bác Ái Tây', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34471, 'Bác Ái', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34472, 'Bác Ái Đông', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34473, 'Ninh Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34474, 'Lâm Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34475, 'Mỹ Sơn', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34476, 'Anh Dũng', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34477, 'Ninh Chử', '', 'Phường', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34478, 'Công Hải', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34479, 'Vĩnh Hải', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34480, 'Thuận Bắc', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34481, 'Ninh Hải', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34482, 'Xuân Hải', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34483, 'Ninh Phước', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34484, 'Phước Hậu', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34485, 'Phước Dinh', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34486, 'Phước Hữu', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34487, 'Thuận Nam', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34488, 'Phước Hà', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34489, 'Cà Ná', '', 'Xã', NULL, 120)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34490, 'Tuy Hòa', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34491, 'Bình Kiến', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34492, 'Sông Cầu', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34493, 'Xuân Lộc', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34494, 'Xuân Cảnh', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34495, 'Xuân Thọ', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34496, 'Xuân Đài', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34497, 'Đồng Xuân', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34498, 'Xuân Lãnh', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34499, 'Phú Mỡ', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34500, 'Xuân Phước', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34501, 'Tuy An Bắc', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34502, 'Tuy An Đông', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34503, 'Tuy An Tây', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34504, 'Ô Loan', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34505, 'Tuy An Nam', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34506, 'Sơn Hòa', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34507, 'Tây Sơn', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34508, 'Vân Hòa', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34509, 'Suối Trai', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34510, 'Sông Hinh', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34511, 'Đức Bình', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34512, 'Ea Bá', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34513, 'Ea Ly', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34514, 'Phú Yên', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34515, 'Sơn Thành', 'Son Thanh Dong commune', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34516, 'Tây Hòa', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34517, 'Đông Hòa', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34518, 'Hòa Hiệp', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34519, 'Hòa Thịnh', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34520, 'Hòa Mỹ', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34521, 'Hòa Xuân', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34522, 'Phú Hòa 2', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34523, 'Phú Hòa 1', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34524, 'Tân Lập', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34525, 'Buôn Ma Thuột', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34526, 'Thành Nhất', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34527, 'Tân An', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34528, 'Ea Kao', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34529, 'Hòa Phú', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34530, 'Ea Drăng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34531, 'Ea H’Leo', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34532, 'Ea Hiao', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34533, 'Ea Wy', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34534, 'Ea Khăl', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34535, 'Ea Súp', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34536, 'Ia Lốp', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34537, 'Ea Rốk', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34538, 'Ia Rvê', 'Ia RVe commune', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34539, 'Ea Bung', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34540, 'Buôn Đôn', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34541, 'Ea Wer', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34542, 'Ea Nuôl', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34543, 'Quảng Phú', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34544, 'Ea Kiết', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34545, 'Ea Tul', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34546, 'Cư M’gar', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34547, 'Ea M’Droh', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34548, 'Cuôr Đăng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34549, 'Buôn Hồ', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34550, 'Krông Búk', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34551, 'Cư Pơng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34552, 'Pơng Drang', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34553, 'Ea Drông', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34554, 'Cư Bao', '', 'Phường', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34555, 'Krông Năng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34556, 'Dliê Ya', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34557, 'Tam Giang', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34558, 'Phú Xuân', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34559, 'Ea Kar', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34560, 'Ea Knốp', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34561, 'Ea Păl', 'Ea Păl commune', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34562, 'Ea Ô', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34563, 'Cư Yang', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34564, 'M’Drắk', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34565, 'Cư Prao', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34566, 'Ea Riêng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34567, 'Cư M’ta', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34568, 'Krông Á', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34569, 'Ea Trang', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34570, 'Krông Bông', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34571, 'Dang Kang', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34572, 'Hòa Sơn', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34573, 'Cư Pui', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34574, 'Yang Mao', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34575, 'Krông Pắc', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34576, 'Ea Kly', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34577, 'Ea Phê', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34578, 'Ea Knuếc', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34579, 'Tân Tiến', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34580, 'Vụ Bổn', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34581, 'Krông Ana', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34582, 'Ea Ning', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34583, 'Ea Ktur', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34584, 'Ea Na', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34585, 'Dray Bhăng', 'Dray Bhang Commune', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34586, 'Dur Kmăl', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34587, 'Liên Sơn Lắk', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34588, 'Đắk Liêng', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34589, 'Đắk Phơi', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34590, 'Krông Nô', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34591, 'Nam Ka', '', 'Xã', NULL, 121)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34592, 'Mũi Né', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34593, 'Phú Thuỷ', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34594, 'Hàm Thắng', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34595, 'Phan Thiết', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34596, 'Tiến Thành', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34597, 'Bình Thuận', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34598, 'Tuyên Quang', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34599, 'Liên Hương', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34600, 'Phan Rí Cửa', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34601, 'Tuy Phong', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34602, 'Vĩnh Hảo', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34603, 'Bắc Bình', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34604, 'Phan Sơn', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34605, 'Hải Ninh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34606, 'Sông Lũy', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34607, 'Lương Sơn', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34608, 'Hồng Thái', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34609, 'Hòa Thắng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34610, 'Hàm Thuận', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34611, 'La Dạ', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34612, 'Đông Giang', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34613, 'Hồng Sơn', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34614, 'Hàm Thuận Bắc', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34615, 'Hàm Liêm', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34616, 'Hàm Thuận Nam', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34617, 'Hàm Thạnh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34618, 'Hàm Kiệm', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34619, 'Tân Lập', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34620, 'Tân Thành', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34621, 'Tánh Linh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34622, 'Bắc Ruộng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34623, 'Nghị Đức', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34624, 'Đồng Kho', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34625, 'Suối Kiết', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34626, 'Đức Linh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34627, 'Hoài Đức', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34628, 'Nam Thành', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34629, 'Trà Tân', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34630, 'Tân Minh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34631, 'Phước Hội', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34632, 'La Gi', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34633, 'Hàm Tân', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34634, 'Tân Hải', 'Tan Tien commune', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34635, 'Sơn Mỹ', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34636, 'Đặc khu Phú Quý', '', 'Đặc khu', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34637, 'Bắc Gia Nghĩa', 'Nghĩa Đức precinct', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34638, 'Nam Gia Nghĩa', 'Nghia Tan precinct', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34639, 'Quảng Sơn', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34640, 'Đông Gia Nghĩa', 'Nghia Trung precinct', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34641, 'Quảng Hòa', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34642, 'Quảng Khê', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34643, 'Tà Đùng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34644, 'Cư Jút', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34645, 'Đắk Wil', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34646, 'Nam Dong', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34647, 'Đức Lập', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34648, 'Đắk Mil', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34649, 'Đắk Sắk', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34650, 'Thuận An', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34651, 'Krông Nô', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34652, 'Nam Đà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34653, 'Nâm Nung', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34654, 'Quảng Phú', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34655, 'Đức An', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34656, 'Đắk Song', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34657, 'Thuận Hạnh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34658, 'Trường Xuân', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34659, 'Kiến Đức', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34660, 'Quảng Trực', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34661, 'Tuy Đức', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34662, 'Quảng Tân', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34663, 'Nhân Cơ', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34664, 'Quảng Tín', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34665, 'Lâm Viên - Đà Lạt', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34666, 'Xuân Hương - Đà Lạt', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34667, 'Cam Ly - Đà Lạt', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34668, 'Xuân Trường - Đà Lạt', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34669, '2 Bảo Lộc', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34670, '1 Bảo Lộc', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34671, 'B’Lao', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34672, '3 Bảo Lộc', '', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34673, 'Lang Biang - Đà Lạt', 'Lac Duong Commune', 'Phường', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34674, 'Lạc Dương', 'Da Nhim', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34675, 'Đam Rông 4', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34676, 'Nam Ban Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34677, 'Đinh Văn Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34678, 'Đam Rông 3', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34679, 'Đam Rông 2', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34680, 'Nam Hà Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34681, 'Đam Rông 1', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34682, 'Phú Sơn Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34683, 'Phúc Thọ Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34684, 'Tân Hà Lâm Hà', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34685, 'Đơn Dương', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34686, 'D’Ran', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34687, 'Ka Đô', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34688, 'Quảng Lập', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34689, 'Đức Trọng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34690, 'Hiệp Thạnh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34691, 'Tân Hội', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34692, 'Ninh Gia', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34693, 'Tà Năng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34694, 'Tà Hine', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34695, 'Di Linh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34696, 'Đinh Trang Thượng', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34697, 'Gia Hiệp', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34698, 'Bảo Thuận', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34699, 'Hòa Ninh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34700, 'Hòa Bắc', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34701, 'Sơn Điền', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34702, 'Bảo Lâm 1', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34703, 'Bảo Lâm 5', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34704, 'Bảo Lâm 4', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34705, 'Bảo Lâm 2', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34706, 'Bảo Lâm 3', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34707, 'Đạ Huoai', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34708, 'Đạ Huoai 2', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34709, 'Đạ Huoai 3', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34710, 'Đạ Tẻh', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34711, 'Đạ Tẻh 3', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34712, 'Đạ Tẻh 2', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34713, 'Cát Tiên', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34714, 'Cát Tiên 3', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34715, 'Cát Tiên 2', '', 'Xã', NULL, 122)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34716, 'Bình Phước', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34717, 'Đồng Xoài', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34718, 'Phước Long', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34719, 'Phước Bình', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34720, 'Bù Gia Mập', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34721, 'Đăk Ơ', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34722, 'Đa Kia', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34723, 'Bình Tân', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34724, 'Phú Riềng', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34725, 'Long Hà', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34726, 'Phú Trung', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34727, 'Phú Nghĩa', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34728, 'Lộc Ninh', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34729, 'Lộc Tấn', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34730, 'Lộc Thạnh', 'Loc Thanh commune', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34731, 'Lộc Quang', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34732, 'Lộc Thành', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34733, 'Lộc Hưng', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34734, 'Thiện Hưng', 'Thanh Binh town', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34735, 'Hưng Phước', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34736, 'Tân Tiến', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34737, 'Bình Long', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34738, 'An Lộc', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34739, 'Tân Hưng', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34740, 'Minh Đức', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34741, 'Tân Quan', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34742, 'Tân Khai', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34743, 'Đồng Phú', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34744, 'Tân Lợi', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34745, 'Thuận Lợi', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34746, 'Đồng Tâm', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34747, 'Bù Đăng', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34748, 'Đak Nhau', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34749, 'Thọ Sơn', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34750, 'Bom Bo', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34751, 'Nghĩa Trung', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34752, 'Phước Sơn', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34753, 'Chơn Thành', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34754, 'Minh Hưng', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34755, 'Nha Bích', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34756, 'Trảng Dài', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34757, 'Hố Nai', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34758, 'Tam Hiệp', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34759, 'Long Bình', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34760, 'Trấn Biên', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34761, 'Biên Hòa', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34762, 'Long Khánh', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34763, 'Bình Lộc', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34764, 'Bảo Vinh', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34765, 'Xuân Lập', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34766, 'Hàng Gòn', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34767, 'Tân Phú', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34768, 'Đak Lua', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34769, 'Nam Cát Tiên', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34770, 'Tà Lài', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34771, 'Phú Lâm', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34772, 'Trị An', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34773, 'Phú Lý', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34774, 'Tân An', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34775, 'Tân Triều', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34776, 'Định Quán', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34777, 'Thanh Sơn', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34778, 'Phú Vinh', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34779, 'Phú Hòa', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34780, 'La Ngà', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34781, 'Trảng Bom', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34782, 'Bàu Hàm', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34783, 'Bình Minh', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34784, 'Hưng Thịnh', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34785, 'An Viễn', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34786, 'Thống Nhất', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34787, 'Gia Kiệm', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34788, 'Dầu Giây', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34789, 'Xuân Quế', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34790, 'Cẩm Mỹ', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34791, 'Xuân Đường', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34792, 'Xuân Đông', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34793, 'Sông Ray', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34794, 'Long Thành', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34795, 'Tam Phước', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34796, 'Phước Tân', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34797, 'Long Hưng', '', 'Phường', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34798, 'An Phước', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34799, 'Bình An', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34800, 'Long Phước', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34801, 'Phước Thái', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34802, 'Xuân Lộc', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34803, 'Xuân Bắc', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34804, 'Xuân Thành', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34805, 'Xuân Hòa', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34806, 'Xuân Phú', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34807, 'Xuân Định', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34808, 'Nhơn Trạch', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34809, 'Đại Phước', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34810, 'Phước An', '', 'Xã', NULL, 123)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34811, 'Thủ Dầu Một', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34812, 'Phú Lợi', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34813, 'Bình Dương', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34814, 'Phú An', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34815, 'Chánh Hiệp', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34816, 'Dầu Tiếng', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34817, 'Minh Thạnh', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34818, 'Long Hòa', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34819, 'Thanh An', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34820, 'Bến Cát', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34821, 'Trừ Văn Thố', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34822, 'Bàu Bàng', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34823, 'Chánh Phú Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34824, 'Long Nguyên', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34825, 'Tây Nam', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34826, 'Thới Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34827, 'Hòa Lợi', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34828, 'Phú Giáo', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34829, 'Phước Thành', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34830, 'An Long', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34831, 'Phước Hòa', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34832, 'Tân Uyên', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34833, 'Tân Khánh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34834, 'Bắc Tân Uyên', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34835, 'Thường Tân', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34836, 'Vĩnh Tân', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34837, 'Bình Cơ', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34838, 'Tân Hiệp', 'Tan Hiep Commune', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34839, 'Dĩ An', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34840, 'Tân Đông Hiệp', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34841, 'Đông Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34842, 'Lái Thiêu', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34843, 'Thuận Giao', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34844, 'An Phú', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34845, 'Thuận An', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34846, 'Bình Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34847, 'Vũng Tàu', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34848, 'Tam Thắng', 'Ninh An Nguyên Commune', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34849, 'Rạch Dừa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34850, 'Phước Thắng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34851, 'Long Sơn', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34852, 'Bà Rịa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34853, 'Long Hương', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34854, 'Tam Long', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34855, 'Ngãi Giao', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34856, 'Xuân Sơn', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34857, 'Bình Giã', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34858, 'Châu Đức', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34859, 'Kim Long', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34860, 'Nghĩa Thành', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34861, 'Hồ Tràm', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34862, 'Xuyên Mộc', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34863, 'Bàu Lâm', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34864, 'Hòa Hội', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34865, 'Hòa Hiệp', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34866, 'Bình Châu', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34867, 'Long Điền', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34868, 'Long Hải', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34869, 'Đất Đỏ', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34870, 'Phước Hải', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34871, 'Phú Mỹ', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34872, 'Tân Hải', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34873, 'Tân Phước', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34874, 'Tân Thành', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34875, 'Châu Pha', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34876, 'Đặc khu Côn Đảo', '', 'Đặc khu', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34877, 'Tân Định', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34878, 'Sài Gòn', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34879, 'Bến Thành', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34880, 'Cầu Ông Lãnh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34881, 'An Phú Đông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34882, 'Thới An', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34883, 'Tân Thới Hiệp', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34884, 'Trung Mỹ Tây', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34885, 'Đông Hưng Thuận', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34886, 'Linh Xuân', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34887, 'Tam Bình', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34888, 'Hiệp Bình', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34889, 'Thủ Đức', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34890, 'Long Bình', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34891, 'Tăng Nhơn Phú', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34892, 'Phước Long', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34893, 'Long Phước', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34894, 'Long Trường', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34895, 'An Nhơn', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34896, 'An Hội Đông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34897, 'An Hội Tây', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34898, 'Gò Vấp', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34899, 'Hạnh Thông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34900, 'Thông Tây Hội', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34901, 'Bình Lợi Trung', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34902, 'Bình Quới', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34903, 'Bình Thạnh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34904, 'Gia Định', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34905, 'Thạnh Mỹ Tây', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34906, 'Tân Sơn Nhất', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34907, 'Tân Sơn Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34908, 'Bảy Hiền', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34909, 'Tân Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34910, 'Tân Bình', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34911, 'Tân Sơn', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34912, 'Tây Thạnh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34913, 'Tân Sơn Nhì', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34914, 'Phú Thọ Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34915, 'Phú Thạnh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34916, 'Tân Phú', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34917, 'Đức Nhuận', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34918, 'Cầu Kiệu', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34919, 'Phú Nhuận', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34920, 'An Khánh', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34921, 'Bình Trưng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34922, 'Cát Lái', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34923, 'Xuân Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34924, 'Nhiêu Lộc', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34925, 'Bàn Cờ', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34926, 'Hòa Hưng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34927, 'Diên Hồng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34928, 'Vườn Lài', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34929, 'Hòa Bình', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34930, 'Phú Thọ', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34931, 'Bình Thới', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34932, 'Minh Phụng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34933, 'Xóm Chiếu', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34934, 'Khánh Hội', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34935, 'Vĩnh Hội', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34936, 'Chợ Quán', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34937, 'An Đông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34938, 'Chợ Lớn', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34939, 'Phú Lâm', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34940, 'Bình Phú', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34941, 'Bình Tây', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34942, 'Bình Tiên', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34943, 'Chánh Hưng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34944, 'Bình Đông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34945, 'Phú Định', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34946, 'Bình Hưng Hòa', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34947, 'Bình Tân', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34948, 'Bình Trị Đông', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34949, 'Tân Tạo', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34950, 'An Lạc', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34951, 'Tân Hưng', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34952, 'Tân Thuận', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34953, 'Phú Thuận', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34954, 'Tân Mỹ', '', 'Phường', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34955, 'Tân An Hội', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34956, 'An Nhơn Tây', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34957, 'Nhuận Đức', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34958, 'Thái Mỹ', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34959, 'Phú Hòa Đông', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34960, 'Bình Mỹ', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34961, 'Củ Chi', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34962, 'Hóc Môn', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34963, 'Đông Thạnh', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34964, 'Xuân Thới Sơn', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34965, 'Bà Điểm', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34966, 'Tân Nhựt', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34967, 'Vĩnh Lộc', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34968, 'Tân Vĩnh Lộc', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34969, 'Bình Lợi', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34970, 'Bình Hưng', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34971, 'Hưng Long', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34972, 'Bình Chánh', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34973, 'Nhà Bè', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34974, 'Hiệp Phước', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34975, 'Cần Giờ', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34976, 'Bình Khánh', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34977, 'An Thới Đông', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34978, 'Thạnh An', '', 'Xã', NULL, 124)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34979, 'Tân Ninh', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34980, 'Bình Minh', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34981, 'Tân Biên', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34982, 'Tân Lập', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34983, 'Thạnh Bình', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34984, 'Trà Vong', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34985, 'Tân Châu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34986, 'Tân Đông', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34987, 'Tân Hội', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34988, 'Tân Hòa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34989, 'Tân Thành', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34990, 'Tân Phú', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34991, 'Dương Minh Châu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34992, 'Ninh Thạnh', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34993, 'Cầu Khởi', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34994, 'Lộc Ninh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34995, 'Châu Thành', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34996, 'Hảo Đước', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34997, 'Phước Vinh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34998, 'Hòa Hội', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (34999, 'Ninh Điền', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35000, 'Long Hoa', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35001, 'Thanh Điền', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35002, 'Hòa Thành', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35003, 'Gò Dầu', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35004, 'Thạnh Đức', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35005, 'Phước Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35006, 'Truông Mít', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35007, 'Gia Lộc', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35008, 'Bến Cầu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35009, 'Long Chữ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35010, 'Long Thuận', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35011, 'Trảng Bàng', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35012, 'Hưng Thuận', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35013, 'Phước Chỉ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35014, 'An Tịnh', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35015, 'Long An', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35016, 'Tân An', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35017, 'Khánh Hậu', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35018, 'Tân Hưng', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35019, 'Hưng Điền', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35020, 'Vĩnh Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35021, 'Vĩnh Châu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35022, 'Vĩnh Hưng', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35023, 'Khánh Hưng', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35024, 'Tuyên Bình', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35025, 'Kiến Tường', '', 'Phường', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35026, 'Bình Hiệp', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35027, 'Bình Hòa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35028, 'Tuyên Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35029, 'Mộc Hóa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35030, 'Tân Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35031, 'Nhơn Hòa Lập', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35032, 'Hậu Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35033, 'Nhơn Ninh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35034, 'Thạnh Hóa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35035, 'Bình Thành', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35036, 'Thạnh Phước', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35037, 'Tân Tây', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35038, 'Đông Thành', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35039, 'Mỹ Quý', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35040, 'Đức Huệ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35041, 'Hậu Nghĩa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35042, 'Đức Hòa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35043, 'An Ninh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35044, 'Hiệp Hòa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35045, 'Đức Lập', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35046, 'Mỹ Hạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35047, 'Hòa Khánh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35048, 'Bến Lức', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35049, 'Thạnh Lợi', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35050, 'Lương Hòa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35051, 'Bình Đức', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35052, 'Mỹ Yên', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35053, 'Thủ Thừa', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35054, 'Mỹ Thạnh', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35055, 'Mỹ An', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35056, 'Tân Long', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35057, 'Tân Trụ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35058, 'Nhựt Tảo', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35059, 'Vàm Cỏ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35060, 'Cần Đước', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35061, 'Rạch Kiến', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35062, 'Long Cang', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35063, 'Mỹ Lệ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35064, 'Tân Lân', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35065, 'Long Hựu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35066, 'Cần Giuộc', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35067, 'Phước Lý', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35068, 'Mỹ Lộc', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35069, 'Phước Vĩnh Tây', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35070, 'Tân Tập', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35071, 'Tầm Vu', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35072, 'Vĩnh Công', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35073, 'Thuận Mỹ', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35074, 'An Lục Long', '', 'Xã', NULL, 125)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35075, 'Đạo Thạnh', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35076, 'Mỹ Tho', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35077, 'Thới Sơn', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35078, 'Mỹ Phong', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35079, 'Trung An', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35080, 'Long Thuận', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35081, 'Gò Công', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35082, 'Bình Xuân', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35083, 'Tân Phước 1', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35084, 'Tân Phước 2', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35085, 'Hưng Thạnh', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35086, 'Tân Phước 3', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35087, 'Cái Bè', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35088, 'Hậu Mỹ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35089, 'Mỹ Thiện', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35090, 'Hội Cư', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35091, 'Mỹ Đức Tây', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35092, 'Mỹ Lợi', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35093, 'Thanh Hưng', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35094, 'An Hữu', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35095, 'Mỹ Phước Tây', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35096, 'Thanh Hòa', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35097, 'Cai Lậy', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35098, 'Thạnh Phú', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35099, 'Mỹ Thành', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35100, 'Tân Phú', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35101, 'Bình Phú', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35102, 'Nhị Quý', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35103, 'Hiệp Đức', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35104, 'Long Tiên', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35105, 'Ngũ Hiệp', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35106, 'Châu Thành', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35107, 'Tân Hương', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35108, 'Long Hưng', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35109, 'Long Định', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35110, 'Bình Trưng', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35111, 'Vĩnh Kim', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35112, 'Kim Sơn', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35113, 'Chợ Gạo', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35114, 'Mỹ Tịnh An', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35115, 'Lương Hòa Lạc', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35116, 'Tân Thuận Bình', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35117, 'An Thạnh Thủy', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35118, 'Bình Ninh', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35119, 'Vĩnh Bình', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35120, 'Đồng Sơn', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35121, 'Phú Thành', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35122, 'Vĩnh Hựu', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35123, 'Long Bình', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35124, 'Tân Thới', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35125, 'Tân Phú Đông', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35126, 'Tân Hòa', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35127, 'Gia Thuận', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35128, 'Tân Đông', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35129, 'Sơn Qui', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35130, 'Tân Điền', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35131, 'Gò Công Đông', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35132, 'Cao Lãnh', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35133, 'Mỹ Ngãi', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35134, 'Mỹ Trà', 'My Phu Commune', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35135, 'Sa Đéc', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35136, 'Tân Hồng', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35137, 'Tân Hộ Cơ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35138, 'Tân Thành', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35139, 'An Phước', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35140, 'An Bình', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35141, 'Hồng Ngự', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35142, 'Thường Phước', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35143, 'Thường Lạc', '', 'Phường', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35144, 'Long Khánh', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35145, 'Long Phú Thuận', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35146, 'Tràm Chim', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35147, 'Tam Nông', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35148, 'An Hòa', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35149, 'Phú Cường', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35150, 'An Long', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35151, 'Phú Thọ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35152, 'Tháp Mười', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35153, 'Phương Thịnh', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35154, 'Trường Xuân', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35155, 'Mỹ Quí', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35156, 'Đốc Binh Kiều', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35157, 'Thanh Mỹ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35158, 'Mỹ Thọ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35159, 'Ba Sao', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35160, 'Phong Mỹ', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35161, 'Mỹ Hiệp', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35162, 'Bình Hàng Trung', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35163, 'Thanh Bình', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35164, 'Tân Long', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35165, 'Tân Thạnh', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35166, 'Bình Thành', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35167, 'Lấp Vò', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35168, 'Mỹ An Hưng', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35169, 'Tân Khánh Trung', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35170, 'Hòa Long', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35171, 'Tân Dương', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35172, 'Lai Vung', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35173, 'Phong Hòa', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35174, 'Phú Hựu', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35175, 'Tân Nhuận Đông', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35176, 'Tân Phú Trung', '', 'Xã', NULL, 126)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35177, 'Phú Khương', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35178, 'An Hội', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35179, 'Sơn Đông', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35180, 'Bến Tre', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35181, 'Giao Long', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35182, 'Phú Túc', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35183, 'Tân Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35184, 'Phú Tân', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35185, 'Tiên Thủy', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35186, 'Chợ Lách', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35187, 'Phú Phụng', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35188, 'Vĩnh Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35189, 'Hưng Khánh Trung', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35190, 'Mỏ Cày', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35191, 'Phước Mỹ Trung', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35192, 'Tân Thành Bình', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35193, 'Đồng Khởi', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35194, 'Nhuận Phú Tân', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35195, 'An Định', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35196, 'Thành Thới', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35197, 'Hương Mỹ', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35198, 'Giồng Trôm', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35199, 'Lương Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35200, 'Lương Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35201, 'Châu Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35202, 'Phước Long', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35203, 'Tân Hào', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35204, 'Hưng Nhượng', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35205, 'Bình Đại', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35206, 'Phú Thuận', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35207, 'Lộc Thuận', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35208, 'Châu Hưng', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35209, 'Thạnh Trị', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35210, 'Thạnh Phước', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35211, 'Thới Thuận', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35212, 'Ba Tri', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35213, 'Mỹ Chánh Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35214, 'Bảo Thạnh', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35215, 'Tân Xuân', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35216, 'An Ngãi Trung', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35217, 'An Hiệp', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35218, 'Tân Thủy', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35219, 'Thạnh Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35220, 'Quới Điền', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35221, 'Đại Điền', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35222, 'Thạnh Hải', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35223, 'An Qui', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35224, 'Thạnh Phong', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35225, 'Trà Vinh', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35226, 'Nguyệt Hóa', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35227, 'Long Đức', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35228, 'Càng Long', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35229, 'An Trường', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35230, 'Tân An', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35231, 'Bình Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35232, 'Nhị Long', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35233, 'Cầu Kè', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35234, 'An Phú Tân', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35235, 'Phong Thạnh', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35236, 'Tam Ngãi', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35237, 'Tiểu Cần', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35238, 'Hùng Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35239, 'Tập Ngãi', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35240, 'Tân Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35241, 'Châu Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35242, 'Song Lộc', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35243, 'Hòa Thuận', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35244, 'Hưng Mỹ', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35245, 'Hòa Minh', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35246, 'Long Hòa', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35247, 'Cầu Ngang', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35248, 'Mỹ Long', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35249, 'Vinh Kim', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35250, 'Nhị Trường', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35251, 'Hiệp Mỹ', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35252, 'Trà Cú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35253, 'Tập Sơn', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35254, 'Lưu Nghiệp Anh', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35255, 'Hàm Giang', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35256, 'Đại An', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35257, 'Đôn Châu', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35258, 'Long Hiệp', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35259, 'Duyên Hải', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35260, 'Long Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35261, 'Trường Long Hòa', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35262, 'Long Hữu', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35263, 'Ngũ Lạc', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35264, 'Long Vĩnh', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35265, 'Đông Hải', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35266, 'Long Châu', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35267, 'Phước Hậu', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35268, 'Tân Ngãi', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35269, 'An Bình', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35270, 'Thanh Đức', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35271, 'Tân Hạnh', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35272, 'Long Hồ', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35273, 'Phú Quới', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35274, 'Nhơn Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35275, 'Bình Phước', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35276, 'Cái Nhum', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35277, 'Tân Long Hội', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35278, 'Trung Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35279, 'Quới An', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35280, 'Quới Thiện', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35281, 'Trung Hiệp', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35282, 'Trung Ngãi', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35283, 'Hiếu Phụng', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35284, 'Hiếu Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35285, 'Tam Bình', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35286, 'Cái Ngang', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35287, 'Hòa Hiệp', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35288, 'Song Phú', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35289, 'Ngãi Tứ', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35290, 'Cái Vồn', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35291, 'Bình Minh', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35292, 'Tân Lược', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35293, 'Mỹ Thuận', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35294, 'Tân Quới', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35295, 'Đông Thành', '', 'Phường', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35296, 'Trà Ôn', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35297, 'Hòa Bình', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35298, 'Trà Côn', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35299, 'Vĩnh Xuân', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35300, 'Lục Sĩ Thành', '', 'Xã', NULL, 127)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35301, 'Bình Đức', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35302, 'Mỹ Thới', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35303, 'Long Xuyên', 'My Hoa Ward', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35304, 'Mỹ Hòa Hưng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35305, 'Châu Đốc', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35306, 'Vĩnh Tế', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35307, 'An Phú', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35308, 'Khánh Bình', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35309, 'Nhơn Hội', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35310, 'Phú Hữu', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35311, 'Vĩnh Hậu', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35312, 'Tân Châu', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35313, 'Long Phú', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35314, 'Vĩnh Xương', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35315, 'Tân An', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35316, 'Châu Phong', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35317, 'Phú Tân', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35318, 'Chợ Vàm', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35319, 'Phú Lâm', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35320, 'Hòa Lạc', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35321, 'Phú An', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35322, 'Bình Thạnh Đông', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35323, 'Châu Phú', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35324, 'Mỹ Đức', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35325, 'Vĩnh Thạnh Trung', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35326, 'Thạnh Mỹ Tây', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35327, 'Bình Mỹ', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35328, 'Thới Sơn', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35329, 'Chi Lăng', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35330, 'Tịnh Biên', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35331, 'An Cư', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35332, 'Núi Cấm', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35333, 'Tri Tôn', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35334, 'Ba Chúc', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35335, 'Vĩnh Gia', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35336, 'Ô Lâm', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35337, 'Cô Tô', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35338, 'An Châu', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35339, 'Cần Đăng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35340, 'Vĩnh An', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35341, 'Bình Hòa', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35342, 'Vĩnh Hanh', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35343, 'Chợ Mới', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35344, 'Long Điền', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35345, 'Cù Lao Giêng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35346, 'Nhơn Mỹ', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35347, 'Long Kiến', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35348, 'Hội An', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35349, 'Thoại Sơn', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35350, 'Phú Hòa', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35351, 'Óc Eo', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35352, 'Tây Phú', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35353, 'Vĩnh Trạch', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35354, 'Định Mỹ', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35355, 'Rạch Giá', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35356, 'Vĩnh Thông', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35357, 'Tô Châu', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35358, 'Hà Tiên', '', 'Phường', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35359, 'Tiên Hải', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35360, 'Kiên Lương', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35361, 'Hòa Điền', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35362, 'Vĩnh Điều', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35363, 'Giang Thành', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35364, 'Sơn Hải', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35365, 'Hòn Nghệ', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35366, 'Hòn Đất', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35367, 'Bình Sơn', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35368, 'Bình Giang', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35369, 'Sơn Kiên', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35370, 'Mỹ Thuận', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35371, 'Tân Hiệp', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35372, 'Tân Hội', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35373, 'Thạnh Đông', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35374, 'Châu Thành', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35375, 'Thạnh Lộc', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35376, 'Bình An', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35377, 'Giồng Riềng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35378, 'Thạnh Hưng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35379, 'Ngọc Chúc', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35380, 'Hòa Hưng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35381, 'Long Thạnh', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35382, 'Hòa Thuận', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35383, 'Gò Quao', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35384, 'Định Hòa', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35385, 'Vĩnh Hòa Hưng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35386, 'Vĩnh Tuy', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35387, 'An Biên', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35388, 'Tây Yên', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35389, 'Đông Thái', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35390, 'Vĩnh Hòa', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35391, 'An Minh', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35392, 'Đông Hòa', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35393, 'U Minh Thượng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35394, 'Tân Thạnh', 'Tan Thanh commune', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35395, 'Đông Hưng', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35396, 'Vân Khánh', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35397, 'Vĩnh Phong', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35398, 'Vĩnh Bình', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35399, 'Vĩnh Thuận', '', 'Xã', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35400, 'Đặc khu Phú Quốc', '', 'Đặc khu', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35401, 'Đặc khu Thổ Châu', '', 'Đặc khu', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35402, 'Đặc khu Kiên Hải', '', 'Đặc khu', NULL, 128)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35403, 'Cái Khế', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35404, 'Ninh Kiều', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35405, 'Tân An', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35406, 'An Bình', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35407, 'Ô Môn', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35408, 'Thới Long', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35409, 'Phước Thới', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35410, 'Bình Thủy', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35411, 'Thới An Đông', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35412, 'Long Tuyền', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35413, 'Cái Răng', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35414, 'Hưng Phú', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35415, 'Thốt Nốt', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35416, 'Tân Lộc', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35417, 'Trung Nhứt', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35418, 'Thuận Hưng', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35419, 'Thạnh An', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35420, 'Vĩnh Thạnh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35421, 'Vĩnh Trinh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35422, 'Thạnh Quới', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35423, 'Thạnh Phú', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35424, 'Trung Hưng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35425, 'Thới Lai', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35426, 'Cờ Đỏ', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35427, 'Thới Hưng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35428, 'Đông Hiệp', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35429, 'Đông Thuận', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35430, 'Trường Thành', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35431, 'Trường Xuân', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35432, 'Phong Điền', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35433, 'Trường Long', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35434, 'Nhơn Ái', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35435, 'Vị Thanh', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35436, 'Vị Tân', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35437, 'Hỏa Lựu', 'Tân Tiến Commune', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35438, 'Ngã Bảy', 'Nga Bay precinct', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35439, 'Tân Hòa', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35440, 'Trường Long Tây', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35441, 'Thạnh Xuân', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35442, 'Châu Thành', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35443, 'Đông Phước', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35444, 'Phú Hữu', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35445, 'Hòa An', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35446, 'Hiệp Hưng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35447, 'Tân Bình', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35448, 'Thạnh Hòa', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35449, 'Đại Thành', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35450, 'Phụng Hiệp', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35451, 'Phương Bình', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35452, 'Tân Phước Hưng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35453, 'Vị Thủy', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35454, 'Vĩnh Thuận Đông', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35455, 'Vĩnh Tường', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35456, 'Vị Thanh 1', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35457, 'Long Mỹ', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35458, 'Long Bình', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35459, 'Long Phú 1', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35460, 'Vĩnh Viễn', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35461, 'Lương Tâm', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35462, 'Xà Phiên', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35463, 'Sóc Trăng', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35464, 'Phú Lợi', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35465, 'Kế Sách', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35466, 'An Lạc Thôn', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35467, 'Phong Nẫm', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35468, 'Thới An Hội', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35469, 'Nhơn Mỹ', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35470, 'Đại Hải', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35471, 'Mỹ Tú', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35472, 'Phú Tâm', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35473, 'Hồ Đắc Kiện', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35474, 'Long Hưng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35475, 'Thuận Hòa', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35476, 'Mỹ Hương', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35477, 'An Ninh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35478, 'Mỹ Phước', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35479, 'An Thạnh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35480, 'Cù Lao Dung', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35481, 'Long Phú', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35482, 'Đại Ngãi', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35483, 'Trường Khánh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35484, 'Tân Thạnh', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35485, 'Trần Đề', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35486, 'Liêu Tú', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35487, 'Lịch Hội Thượng', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35488, 'Mỹ Xuyên', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35489, 'Tài Văn', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35490, 'Thạnh Thới An', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35491, 'Nhu Gia', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35492, 'Hòa Tú', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35493, 'Ngọc Tố', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35494, 'Gia Hòa', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35495, 'Ngã Năm', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35496, 'Tân Long', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35497, 'Mỹ Quới', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35498, 'Phú Lộc', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35499, 'Lâm Tân', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35500, 'Vĩnh Lợi', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35501, 'Vĩnh Châu', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35502, 'Khánh Hòa', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35503, 'Vĩnh Hải', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35504, 'Vĩnh Phước', '', 'Phường', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35505, 'Lai Hòa', '', 'Xã', NULL, 129)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35506, 'Bạc Liêu', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35507, 'Vĩnh Trạch', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35508, 'Hiệp Thành', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35509, 'Hồng Dân', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35510, 'Ninh Quới', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35511, 'Vĩnh Lộc', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35512, 'Ninh Thạnh Lợi', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35513, 'Phước Long', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35514, 'Vĩnh Phước', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35515, 'Vĩnh Thanh', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35516, 'Phong Hiệp', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35517, 'Hòa Bình', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35518, 'Châu Thới', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35519, 'Vĩnh Lợi', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35520, 'Hưng Hội', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35521, 'Vĩnh Mỹ', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35522, 'Vĩnh Hậu', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35523, 'Giá Rai', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35524, 'Láng Tròn', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35525, 'Phong Thạnh', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35526, 'Gành Hào', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35527, 'Đông Hải', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35528, 'Long Điền', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35529, 'An Trạch', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35530, 'Định Thành', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35531, 'An Xuyên', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35532, 'Lý Văn Lâm', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35533, 'Tân Thành', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35534, 'Hòa Thành', '', 'Phường', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35535, 'Nguyễn Phích', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35536, 'U Minh', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35537, 'Khánh An', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35538, 'Khánh Lâm', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35539, 'Thới Bình', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35540, 'Biển Bạch', 'Tan Bang commune', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35541, 'Trí Phải', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35542, 'Tân Lộc', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35543, 'Hồ Thị Kỷ', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35544, 'Trần Văn Thời', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35545, 'Sông Đốc', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35546, 'Đá Bạc', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35547, 'Khánh Bình', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35548, 'Khánh Hưng', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35549, 'Cái Nước', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35550, 'Lương Thế Trân', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35551, 'Tân Hưng', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35552, 'Hưng Mỹ', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35553, 'Đầm Dơi', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35554, 'Tạ An Khương', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35555, 'Trần Phán', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35556, 'Tân Thuận', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35557, 'Quách Phẩm', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35558, 'Thanh Tùng', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35559, 'Tân Tiến', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35560, 'Năm Căn', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35561, 'Đất Mới', 'Lam Hai commune', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35562, 'Tam Giang', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35563, 'Cái Đôi Vàm', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35564, 'Phú Mỹ', 'Phu Thuan Commune', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35565, 'Phú Tân', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35566, 'Nguyễn Việt Khái', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35567, 'Tân Ân', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35568, 'Phan Ngọc Hiển', '', 'Xã', NULL, 130)
  INTO ward (ID, WNAME, EN_NAME, WLEVEL, DID, PID) VALUES (35569, 'Đất Mũi', '', 'Xã', NULL, 130)
SELECT 1 FROM DUAL;

/
UPDATE province SET plevel = 'Thành phố' WHERE plevel = 'Thành phố Trung ương';
/

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