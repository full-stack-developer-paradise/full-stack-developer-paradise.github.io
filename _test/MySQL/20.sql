-- 创建部门表dep
CREATE TABLE IF NOT EXISTS dep(
    `id` INT UNSIGNED AUTO_INCREMENT KEY,
    `depName` VARCHAR(20) NOT NULL,
    `depDesc` VARCHAR(20) NOT NULL DEFAULT '部门描述'
)ENGINE=InnoDB;

-- 创建员工表emp
CREATE TABLE IF NOT EXISTS emp(
    `id` INT UNSIGNED AUTO_INCREMENT KEY,
    `empName` VARCHAR(20) NOT NULL,
    `age` TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
    `sex` ENUM('男','女','保密') NOT NULL DEFAULT '保密',
    `depId` INT UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO dep (depName) values
('PHP教学部'),
('Java教学部'),
('Web教学部');

INSERT INTO emp(empName,age,sex,depId) VALUES
('Jone',23,'男',1),
('Lily',20,'女',2),
('Mapbar',28,'男',3);

INSERT INTO emp(empName,age,sex,depId) VALUES
('ROSE',23,'男',8),
('Bar',20,'女',9);

SELECT * FROM emp
WHERE depId NOT IN (SELECT id FROM dep);

-- 创建stu表
CREATE TABLE IF NOT EXISTS stu(
    `id` INT UNSIGNED AUTO_INCREMENT KEY,
    `username` VARCHAR(20) NOT NULL,
    `score` TINYINT UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 插入数据
INSERT INTO stu(username,score) VALUES
('king',95),
('queen',75),
('zhangsan',69),
('lisi',78),
('wangwu',87),
('zhaoliu',88),
('tianqi',98),
('ceshi',99),
('tiancai',50);

-- 创建level表
CREATE TABLE level(
    `id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `score` TINYINT UNSIGNED COMMENT '分数'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;


INSERT INTO level (score) VALUES (90),(80),(70);

SELECT score FROM level WHERE id=1;

SELECT * FROM stu WHERE score>=90;

SELECT * FROM stu WHERE score>=(SELECT score FROM level WHERE id=1);

SELECT * FROM stu WHERE score<=(SELECT score FROM level WHERE id=3);


-- 由EXISTS引发的子查询
SELECT * FROM emp WHERE EXISTS (SELECT depName FROM dep WHERE id=10);

SELECT * FROM emp WHERE EXISTS (SELECT depName FROM dep WHERE id=1);

-- SOME、ANY、ALL
SELECT * FROM stu
WHERE score>=ANY(SELECT score FROM level);


SELECT * FROM stu
WHERE score>=ALL(SELECT score FROM level);

-- 创建一个user1，id，username
CREATE TABLE user1(
    `id` INT UNSIGNED AUTO_INCREMENT KEY,
    `empName` VARCHAR(20)
)SELECT id,empName FROM emp;

CREATE TABLE user2(
    `id` INT UNSIGNED AUTO_INCREMENT KEY,
    `empName` VARCHAR(20)
)SELECT id,empName FROM user1;



SELECT * FROM user1
UNION all
SELECT * FROM user2;



-- 无限级分类数据表的设计及实现
CREATE TABLE IF NOT EXISTS cate(
    `id` SMALLINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `cateName` VARCHAR(100) NOT NULL UNIQUE COMMENT '分类名称',
    `pId` SMALLINT UNSIGNED NOT NULL DEFAULT 0
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;



INSERT INTO cate(cateName,pId) VALUES
('服装',0),
('数码',0),
('玩具',0);

INSERT INTO cate(cateName,pId) VALUES
('男装',1),
('女装',1),
('内衣',1);

INSERT INTO cate(cateName,pId) VALUES
('电视',2),
('冰箱',2),
('洗衣机',2);

INSERT INTO cate(cateName,pId) VALUES
('爱马仕',3),
('LV',3),
('GUCCI',3);

INSERT INTO cate(cateName,pId) VALUES
('夹克',4),
('衬衫',4),
('裤子',4);


INSERT INTO cate(cateName,pId) VALUES
('液晶电视',7),
('等离子电视',7),
('背投电视',7);






--- 查询所有的分类信息，以及父分类id,cateName,f_cateName
SELECT s.id,s.cateName AS sCateName,p.cateName AS pCateName
FROM cate AS s
LEFT JOIN cate AS p
ON s.pId=p.id;

SELECT p.id,p.cateName AS pCateName,COUNT(s.cateName) AS count
FROM cate AS s
RIGHT JOIN cate AS p
ON s.pId=p.id
GROUP BY p.cateName
ORDER BY id ASC;









