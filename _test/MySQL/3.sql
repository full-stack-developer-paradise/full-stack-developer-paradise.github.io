-- 用户表
CREATE TABLE IF NOT EXISTS imooc_user(
id INT,
username VARCHAR(20),
password CHAR(32),
email VARCHAR(50),
age TINYINT,
card CHAR(18),
tel CHAR(11),
salary FLOAT(8,2),
married TINYINT(1),
addr VARCHAR(100),
sex ENUM('男','女','保密')
)ENGINE=INNODB CHARSET=UTF8;

-- 插入数据 INSERT [INTO] tbl_name(id, name, ...) values (1, '123', ...);

INSERT INTO imooc_user(id, username, password, email, age, card, tel, salary, married, addr, sex)
values (1, 'kings', 'kings', 'liwudi@youxin.com', 28, '622823199005039', '18910592191', 30000.11, 1, '北京市', '男');

-- 查询表中所有记录 SELECT * FROM tbl_name;

INSERT INTO imooc_user(id, username, password, email, age, card, tel, salary, married, addr, sex)
values (-5, 'kings', '123456', 'liwudi@youxin.com', -3, '622823199005039', '18910592191', 30000.11, 1, '北京市', '男');
