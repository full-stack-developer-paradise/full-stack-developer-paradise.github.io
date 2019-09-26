-- 用户表imooc_user
CREATE DATABASE IF NOT EXISTS test2 DEFAULT CHARACTER SET 'UTF8';
CREATE TABLE IF NOT EXISTS `emp`(
`id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '用户编号',
`username` VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
`age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
`sex` ENUM('男','女') NOT NULL DEFAULT '男' COMMENT '性别',
`addr` VARCHAR(50) NOT NULL DEFAULT '北京' COMMENT '地址',
`depId` TINYINT UNSIGNED NOT NULL COMMENT '部门对应编号'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;


INSERT emp(username,age,depId)VALUES('King',24,1),
('Queen',25,2),
('imooc',26,1),
('lily',27,1),
('rose',28,3),
('john',29,3);

INSERT emp(username,age,depId)VALUES('测试用户',24,6);

CREATE TABLE `dep`(
    id TINYINT UNSIGNED AUTO_INCREMENT KEY,
    depName VARCHAR(50) NOT NULL UNIQUE,
    depDesc VARCHAR(100) NOT NULL DEFAULT ''
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT dep(depName,depDesc) VALUES('PHP教学部','研发PHP课程'),
('JAVA教学部','研发JAVA课程'),
('WEB教学部','研发WEB课程'),
('IOS教学部','研发IOS课程');

SELECT emp.id,emp.username,emp.age,dep.depName FROM emp,dep;

SELECT emp.id,emp.username,emp.age,dep.depName
FROM emp
INNER JOIN dep
ON emp.depId=dep.id;

-- 左外连接
SELECT emp.id,emp.username,emp.age,dep.depName
FROM emp
LEFT OUTER JOIN dep
ON emp.depId=dep.id;

-- 右外连接
SELECT emp.id,emp.username,emp.age,dep.depName
FROM emp
RIGHT OUTER JOIN dep
ON emp.depId=dep.id;

CREATE TABLE IF NOT EXISTS user(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL DEFAULT '619882632@qq.com',
proId TINYINT UNSIGNED NOT NULL
);

INSERT user (username,proId) VALUES('a',1),
('b',1),
('c',1),
('d',2),
('e',3),
('f',1),
('g',1);
-- 省份表
CREATE TABLE provinces(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
proName VARCHAR(10) NOT NULL UNIQUE
);
INSERT provinces(proName) VALUES('北京'),
('上海'),
('深圳');

SELECT user.id,user.username,provinces.proName
FROM user
JOIN provinces
ON user.proId=provinces.id;

-- 管理员表
CREATE TABLE admin (
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
username VARCHAR(20) NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL DEFAULT 'liwudi@qq.com',
proId TINYINT UNSIGNED NOT NULL
);
INSERT admin(username,proId) VALUES('king',1);
INSERT admin(username,proId) VALUES('queen',2);

-- 商品分类表
CREATE TABLE cate(
id TINYINT UNSIGNED AUTO_INCREMENT KEY,
cateName VARCHAR(50) NOT NULL UNIQUE,
cateDesc VARCHAR(100) NOT NULL DEFAULT ''
);
INSERT cate(cateName) VALUES ('母婴'),
('服装'),
('电子');

-- 商品表
CREATE TABLE products(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
    productName VARCHAR(50) NOT NULL UNIQUE,
    price FLOAT(8,2) NOT NULL DEFAULT 0,
    cateId TINYINT UNSIGNED NOT NULL,
    adminId TINYINT UNSIGNED NOT NULL
);
INSERT products(productName,price,cateId,adminId) VALUES
('iphone9',9888,3,1),
('adidas',388,2,2),
('nike',888,2,2),
('奶瓶',288,1,1);


SELECT p.id,p.productName,p.price,c.cateName
FROM products AS p
JOIN cate AS c
ON p.cateId=c.id;

-- 查询 products id productName price
-- cate cateName
-- admin username email

SELECT p.id,p.productName,p.price,c.cateName,a.username,a.email
FROM products AS p
JOIN admin AS a
ON p.adminId=a.id
JOIN cate AS c
ON p.cateId=c.id
WHERE p.price<1000
ORDER BY p.price DESC
LIMIT 0,2;













