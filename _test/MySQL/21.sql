-- 测试字符串函数
-- CHAR_LENGTH();得到字符串的字符数。
SELECT CHAR_LENGTH('abc');

-- LENGTH();返回字符串的长度
SELECT LENGTH('abc'); -- 3
SELECT LENGTH('你好啊'); -- 9

-- CONCAT(s1,s2...);合并字符串
SELECT CONCAT('a','b','c',null);

-- CONCAT_WS(x,s1,s2,s3);以指定的字符拼接字符串

SELECT CONCAT_WS('-','b','c','d'); -- b-c-d

SELECT CONCAT_WS('-','b','c',null); -- b-c

SELECT CONCAT_WS(null,'b','c','d'); -- null

SELECT CONCAT_WS('-a','b','c','d'); -- b-ac-ad

-- UPPER() | UCASE()  LOWER() | LCASE();将字符串转化为大写或者小写。
SELECT UPPER('hello world'),LOWER('hello world');

-- REVERSE();字符串反转函数
SELECT REVERSE('abc');

-- LEFT() | RIGHT();返回字符串的前两个字符，或者后两个字符。
SELECT LEFT('hello'),RIGHT('hello');

-- LPAD() | RPAD();填充字符串。
SELECT LPAD('abc',10,'?'); -- ???????abc

-- 去掉字符串两端空格 TRIM() | LTRIM() | RTRIM();

SELECT CONCAT('*','*')

-- REPEAT();重复指定的次数
SELECT REPEAT('abc',3);

-- REPLACE();替换字符串
SELECT REPLACE('hello world',' ',',');

-- SUBSTRING();截取字符串
SELECT SUBSTRING('abcdef',1,3);
SELECT SUBSTRING('abcdef',5,2);

-- STRCMP();比较字符串
SELECT STRCMP('a','b');

-- SELECT VERSION(),CONNECTION_ID(),




-- 练习
CREATE DATABASE school;
use school;

-- 创建班级表
CREATE TABLE IF NOT EXISTS class (
    `c_id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '班级ID',
    `name` VARCHAR(20) NOT NULL UNIQUE COMMENT '名称',
    `descrip` VARCHAR(20) NOT NULL DEFAULT '普通班' COMMENT '备注'
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT class (name,descrip) VALUES
('一年级一班','重点班'),
('一年级二班','重点班'),
('二年级一班','重点班'),
('二年级二班','普通班');

-- 创建学生表
CREATE TABLE IF NOT EXISTS student(
    `s_id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '学生ID',
    `name` VARCHAR(10) NOT NULL COMMENT '姓名',
    `gender` ENUM('男','女','未知') NOT NULL DEFAULT '未知' COMMENT '性别',
    `class` INT UNSIGNED NOT NULL,
    CONSTRAINT class_fk_class FOREIGN KEY(class) REFERENCES class(c_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT student (name,gender,class) VALUES
('赵晓明','男',111),
('王晓红','女',1),
('张晓晓','女',1),
('孙琪琪','女',3),
('李米米','女',4),
('赵晓刚','男',3),
('张大宝','男',2),
('张兰','女',4),
('孙好','男',1);

-- 错误数据测试
INSERT student (name,gender,class) VALUES
('赵晓明','男',111);


-- 创建成绩表
CREATE TABLE IF NOT EXISTS score (
    `sc_id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '成绩ID',
    `s_id` INT UNSIGNED NOT NULL COMMENT '学生ID',
    `course` CHAR(10) NOT NULL COMMENT '课程',
    `mark` TINYINT UNSIGNED NOT NULL COMMENT '分数',
    CONSTRAINT sId_fk_student FOREIGN KEY(s_id) REFERENCES student(s_id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT score (s_id,course,mark) VALUES
(1,'数学',98),
(1,'语文',90),
(1,'英语',97),
(2,'数学',96),
(2,'语文',88),
(3,'语文',88),
(2,'英语',91),
(3,'数学',96),
(3,'英语',86),
(4,'数学',89),
(4,'语文',82),
(4,'英语',83),
(5,'数学',75),
(5,'语文',86),
(5,'英语',77),
(6,'数学',81),
(6,'语文',77),
(6,'英语',60),
(7,'数学',89),
(7,'语文',56),
(7,'英语',70),
(8,'数学',87),
(8,'语文',55),
(8,'英语',66),
(9,'数学',78),
(9,'语文',60),
(9,'英语',52);

-- 测试垃圾数据
INSERT score (s_id,course,mark) VALUES
(10,'数学',98),
(10,'语文',90),
(10,'英语',97);

-- 查询每个班级中每一科的平均成绩，显示数据包括班级名称class.name，课程score.course以及平均分数score.mark，并按照班ID升序排列
SELECT class.name,score.course,AVG(score.mark) AS avg_score
FROM score
JOIN student
ON score.s_id=student.s_id
JOIN class
ON student.class=class.c_id
GROUP BY class.name,score.course
ORDER BY class.c_id ASC;

-- 查询所有同学的学生ID，姓名，性别以及总分，并按照成绩从高到低排序

SELECT student.s_id AS student_id,student.name AS student_name,student.gender AS student_gender, SUM(score.mark) AS score_sum
FROM student
JOIN score
ON student.s_id=score.s_id
GROUP BY student_id
ORDER BY score_sum DESC;



-- 查询课程成绩小于75分的学生ID，姓名，班级，课程以及分数
SELECT student.s_id,student.name,class.name,score.course,score.mark
FROM student
JOIN class
ON student.class=class.c_id
JOIN score
ON student.s_id=score.s_id
WHERE score.mark<75;

-- 将李米米的数学成绩修改为88分
UPDATE score
set score.mark=88
WHERE score.course='数学' && score.s_id=(SELECT s_id FROM student WHERE name='李米米');


-- 计算重点班中每一科的平均成绩，显示数据包括：重点班级ID，班级名称，课程，平均分数，按照降序排列
SELECT class.c_id,class.name,class.descrip,score.course,AVG(score.mark) AS average
FROM class
JOIN student
ON class.c_id=student.class
JOIN score
ON student.s_id=score.s_id
WHERE class.descrip='重点班'
GROUP BY class.name,score.course
ORDER BY average DESC;


CREATE TABLE IF NOT EXISTS goods (
    id INT UNSIGNED AUTO_INCREMENT KEY,
    name VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    desp VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO goods VALUES
(null,'手机',2000.0,'黑色，存储容量32G'),
(null,'冰箱',1500.0,'银色，对开门'),
(null,'洗衣机',3000.0,'滚筒'),
(null,'空调',4000.0,'变频空调');

CREATE TABLE IF NOT EXISTS imooc (
    id INT UNSIGNED AUTO_INCREMENT KEY,
    name VARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    desp VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO imooc VALUES
(null,'手机',2000.0,'黑色，存储容量32G'),
(null,'冰箱',1500.0,'银色，对开门'),
(null,'洗衣机',3000.0,'滚筒'),
(null,'空调',4000.0,'变频空调');



