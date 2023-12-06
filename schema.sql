CREATE TABLE pos_gu (
  gu_id int PRIMARY KEY AUTO_INCREMENT,
  gu varchar(50) NOT NULL
);

CREATE TABLE pos_dong (
  dong_id int PRIMARY KEY AUTO_INCREMENT,
  dong varchar(50) NOT NULL,
  p_gu int NOT NULL
);

CREATE TABLE employee (
  emp_id char(20) PRIMARY KEY,
  password varchar(20) NOT NULL,
  name varchar(10) NOT NULL,
  tel varchar(13) NOT NULL,
  pos int,
  code varchar(1) NOT NULL
);

CREATE TABLE bin (
  bin_id char(6) PRIMARY KEY,
  pos int NOT NULL,
  lat double NOT NULL,
  lon double NOT NULL,
  install_date char(10) NOT NULL
);

CREATE TABLE loadage (
  bin_id char(6),
  load_time datetime,
  amount int NOT NULL,
  PRIMARY KEY (bin_id, load_time)
);

CREATE TABLE fire (
  bin_id char(6),
  fire_time datetime,
  image varchar(20) NOT NULL,
  PRIMARY KEY (bin_id, fire_time)
);

CREATE TABLE replacement (
  bin_id char(6),
  rp_time datetime,
  emp_id char(20) NOT NULL,
  PRIMARY KEY (bin_id, rp_time)
);

CREATE TABLE notified (
  bin_id char(6),
  load_time datetime,
  emp_id char(20),
  PRIMARY KEY (bin_id, load_time, emp_id)
);

ALTER TABLE pos_dong ADD FOREIGN KEY (p_gu) REFERENCES pos_gu (gu_id);

ALTER TABLE bin ADD FOREIGN KEY (pos) REFERENCES pos_dong (dong_id);

ALTER TABLE employee ADD FOREIGN KEY (pos) REFERENCES pos_dong (dong_id);

ALTER TABLE loadage ADD FOREIGN KEY (bin_id) REFERENCES bin (bin_id);

ALTER TABLE fire ADD FOREIGN KEY (bin_id) REFERENCES bin (bin_id);

ALTER TABLE replacement ADD FOREIGN KEY (bin_id) REFERENCES bin (bin_id);
ALTER TABLE replacement ADD FOREIGN KEY (emp_id) REFERENCES employee (emp_id);

ALTER TABLE notified ADD FOREIGN KEY (bin_id, load_time) REFERENCES loadage (bin_id, load_time);
ALTER TABLE notified ADD FOREIGN KEY (emp_id) REFERENCES employee (emp_id);

INSERT INTO pos_gu (gu) VALUES ('수정'), ('중원'), ('분당');

INSERT INTO pos_dong (dong, p_gu) VALUES
  ('창곡', 1), ('양지', 1), ('산성', 1), ('단대', 1), ('신흥', 1), ('복정', 1), ('태평', 1), ('수진', 1), ('신촌', 1),
  ('오야', 1), ('심곡', 1), ('둔전', 1), ('고등', 1), ('시흥', 1), ('사송', 1), ('금토', 1), ('상적', 1),
  ('은행', 2), ('금광', 2), ('상대원', 2), ('중앙', 2), ('성남', 2), ('하대원', 2), ('갈현', 2), ('도촌', 2), ('여수', 2),
  ('야탑', 3), ('이매', 3), ('율', 3), ('서현', 3), ('분당', 3), ('수내', 3), ('삼평', 3), ('백현', 3), ('정자', 3),
  ('구미', 3), ('판교', 3), ('하산운', 3), ('궁내', 3), ('금곡', 3), ('동원', 3), ('대장', 3), ('운중', 3), ('석운', 3);

INSERT INTO bin (bin_id, pos, lat, lon, install_date) VALUES
  ('BI0001', 28, 37.394945, 127.117805, '2022-03-08'), ('SB0001', 6, 37.455800, 127.126927, '2022-04-25'), 
  ('SB0002', 6, 37.452666, 127.130279, '2022-06-24'), ('JY0001', 26, 37.417976, 127.125204, '2022-06-28'), 
  ('JS0001', 22, 37.432723, 127.130921, '2022-07-01'), ('JS0002', 22, 37.432307, 127.132341, '2022-07-16'), 
  ('BI0002', 28, 37.391873, 127.123224, '2022-07-28'), ('SB0003', 6, 37.455179, 127.133795, '2022-08-19'), 
  ('BY0001', 27, 37.413685, 127.130274, '2022-08-20'), ('JS0003', 22, 37.431791, 127.131552, '2022-10-14'), 
  ('JS0004', 22, 37.430312, 127.131016, '2022-11-07'), ('JY0002', 26, 37.418449, 127.126534, '2022-11-30'), 
  ('ST0001', 7, 37.447875, 127.127102, '2022-12-19'), ('BY0002', 27, 37.411811, 127.131089, '2022-12-24'), 
  ('BY0003', 27, 37.412938, 127.129040, '2023-01-06'), ('ST0002', 7, 37.448299, 127.127163, '2023-01-08'), 
  ('ST0003', 7, 37.448256, 127.128460, '2023-01-19'), ('BI0003', 28, 37.393578, 127.123669, '2023-01-26'), 
  ('JY0003', 26, 37.417575, 127.127315, '2023-03-05'), ('BI0004', 28, 37.393092, 127.122260, '2023-04-26'), 
  ('ST0004', 7, 37.448805, 127.127268, '2023-06-02'), ('BY0004', 27, 37.412502, 127.130370, '2023-06-07'), 
  ('SB0004', 6, 37.255883, 127.134800, '2023-06-11'), ('ST0005', 7, 37.448962, 127.126906, '2023-07-23'), 
  ('BI0005', 28, 37.396684, 127.120347, '2023-09-17'), ('JS0005', 22, 37.431322, 127.132807, '2023-09-19'), 
  ('BY0005', 27, 37.411436, 127.129063, '2023-09-30'), ('JY0004', 26, 37.417902, 127.126113, '2023-10-11'), 
  ('JY0005', 26, 37.417035, 127.126611, '2023-12-03'), ('SB0005', 6, 37.455040, 127.128365, '2023-12-08');


INSERT INTO employee (emp_id, password, name, tel, pos, code) VALUES 
  ('202136000', 'hiz304', '관리자', '010-1783-9366', null, '0'), ('202136001', 'WpB304', '노희수', '010-1083-6170', 28, '1'), 
  ('202136002', 'YKl483', '완영하', '010-1929-9718', 27, '1'), ('202136003', 'OZL825', '섭이슬', '010-1661-2233', 22, '1'), 
  ('202136004', 'Kfq682', '한해원', '010-1867-4878', 28, '1'), ('202136005', 'osD989', '피보람', '010-1993-3238', 7, '1'), 
  ('202136006', 'Hpy364', '평남선', '010-1656-8641', 27, '1'), ('202136007', 'WHc606', '빈재인', '010-1200-7898', 7, '1'), 
  ('202136008', 'mdV815', '선정우', '010-1433-5047', 27, '1'), ('202136009', 'aYA767', '육승화', '010-1663-1612', 6, '1'), 
  ('202136010', 'XwB853', '감선영', '010-1689-8303', 7, '1'), ('202136011', 'uqn718', '선남선', '010-1295-6262', 28, '1'), 
  ('202136012', 'ckj530', '임현호', '010-1898-6769', 6, '1'), ('202136013', 'zIa974', '근수민', '010-1470-2855', 27, '1'), 
  ('202136014', 'yGG590', '양은재', '010-1785-9690', 28, '1'), ('202136015', 'tuR795', '선자람', '010-1384-1588', 22, '1'), 
  ('202136016', 'uwL883', '서광희', '010-1376-9159', 22, '1'), ('202136017', 'wsO239', '학보연', '010-1390-2160', 27, '1'), 
  ('202136018', 'wGO064', '보미선', '010-1063-3878', 26, '1'), ('202136019', 'EaU175', '종한울', '010-1202-2416', 6, '1'), 
  ('202136020', 'bFT788', '나재원', '010-1430-2904', 26, '1'), ('202136021', 'IrA689', '오해진', '010-1209-0955', 26, '1'), 
  ('202136022', 'NSE187', '황경림', '010-1393-3590', 28, '1'), ('202136023', 'meQ069', '권가을', '010-1381-7321', 6, '1'), 
  ('202136024', 'gVc930', '사남규', '010-1751-9505', 22, '1'), ('202136025', 'BBv359', '조윤형', '010-1096-7971', 22, '1'), 
  ('202136026', 'gGN580', '맹나리', '010-1798-3582', 27, '1'), ('202136027', 'gZm719', '가은수', '010-1302-6915', 26, '1'), 
  ('202136028', 'oAz583', '재갈은수', '010-1423-7317', 7, '1'), ('202136029', 'fzg868', '홍재신', '010-1224-6252', 22, '1');

INSERT INTO fire (bin_id, fire_time, image) VALUES
  ('BI0001', '2022-03-08 10:30:02', 'BI0001_1.jpg'), ('BI0001', '2022-03-08 10:30:32', 'BI0001_2.jpg'),
  ('BI0001', '2022-03-08 10:31:02', 'BI0001_3.jpg'), ('BI0001', '2022-03-08 10:31:32', 'BI0001_4.jpg'),
  ('BI0001', '2022-03-08 10:32:02', 'BI0001_5.jpg'), ('BI0001', '2022-03-08 10:32:32', 'BI0001_6.jpg');

INSERT INTO loadage (bin_id, load_time, amount) VALUES
  ('SB0001', '2023-12-08 10:00:00', 0), ('SB0002', '2023-12-08 10:00:05', 0), ('SB0003', '2023-12-08 10:00:12', 1),
  ('SB0001', '2023-12-08 10:10:00', 13), ('SB0002', '2023-12-08 10:10:05', 16), ('SB0003', '2023-12-08 10:10:12', 24),
  ('SB0001', '2023-12-08 10:20:00', 28), ('SB0002', '2023-12-08 10:20:05', 32), ('SB0003', '2023-12-08 10:20:12', 78),
  ('SB0001', '2023-12-08 10:30:00', 43), ('SB0002', '2023-12-08 10:30:05', 45), ('SB0003', '2023-12-08 10:30:12', 94),
  ('SB0001', '2023-12-08 10:40:00', 57), ('SB0002', '2023-12-08 10:40:05', 62), ('SB0003', '2023-12-08 10:40:12', 7),
  ('SB0001', '2023-12-08 10:50:00', 62), ('SB0002', '2023-12-08 10:50:05', 79), ('SB0003', '2023-12-08 10:50:12', 12),
  ('SB0001', '2023-12-08 11:00:00', 78), ('SB0002', '2023-12-08 11:00:05', 93), ('SB0003', '2023-12-08 11:00:12', 43),
  ('SB0001', '2023-12-08 11:10:00', 92), ('SB0002', '2023-12-08 11:10:05', 4), ('SB0003', '2023-12-08 11:10:12', 46),
  ('SB0001', '2023-12-08 11:20:00', 98), ('SB0002', '2023-12-08 11:20:05', 18), ('SB0003', '2023-12-08 11:20:12', 51),
  ('SB0001', '2023-12-08 11:30:00', 2), ('SB0002', '2023-12-08 11:30:05', 31), ('SB0003', '2023-12-08 11:30:12', 56);

INSERT INTO replacement (bin_id, rp_time, emp_id) VALUES
  ('SB0003', '2023-12-08 10:31:38', '202136023'), ('SB0002', '2023-12-08 11:07:52', '202136019'), ('SB0001', '2023-12-08 11:21:07', '202136012');

INSERT INTO notified (bin_id, load_time, emp_id) VALUES
  ('SB0003', '2023-12-08 10:30:12', '202136012'), ('SB0003', '2023-12-08 10:30:12', '202136019'), ('SB0003', '2023-12-08 10:30:12', '202136023'),
  ('SB0002', '2023-12-08 11:00:05', '202136012'), ('SB0002', '2023-12-08 11:00:05', '202136019'), ('SB0002', '2023-12-08 11:00:05', '202136023'),
  ('SB0001', '2023-12-08 11:10:00', '202136012'), ('SB0001', '2023-12-08 11:10:00', '202136019'), ('SB0001', '2023-12-08 11:10:00', '202136023');