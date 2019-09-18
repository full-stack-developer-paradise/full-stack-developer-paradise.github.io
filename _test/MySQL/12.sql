CREATE DATABASE IF NOT EXISTS king DEFAULT CHARACTER SET 'UTF8';
USE king;
CREATE TABLE IF NOT EXISTS user(
    id INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    username VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
    age TINYINT UNSIGNED DEFAULT 18 COMMENT '年龄',
    email VARCHAR(50) NOT NULL DEFAULT 'imooc@qq.com' COMMENT '邮箱'
)ENGINE=INNODB CHARSET=UTF8;

INSERT user value(1, 'king', 24,'394859@qq.com');
INSERT user values(NULL,'queen',25,'queen@qq.com');
INSERT user values(DEFAULT,'lily',26,'lily@qq.com');

INSERT user (username,email)
VALUES ('rose','rose@qq.com');

CREATE TABLE test(
    a VARCHAR(20)
);
INSERT test VALUES('AA'),('BB'),('CC');

UPDATE user SET age=29 WHERE id=1;
UPDATE user SET username='liwudi',age=28,email='619882632@qq.com' WHERE id=3;
UPDATE user SET age=age+10;
UPDATE user SET age=age-20,email=DEFAULT WHERE id<4;




-- 测试查询操作
CREATE TABLE user1 (
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
    age TINYINT UNSIGNED NOT NULL DEFAULT 18 COMMENT '年龄',
    sex ENUM('男','女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
    addr VARCHAR(20) NOT NULL DEFAULT '北京',
    married TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0代表未结婚，1代表已婚',
    salary FLOAT(8,2) NOT NULL DEFAULT 0 COMMENT '薪水'
)ENGINE=INNODB CHARSET=UTF8;

INSERT INTO user1 VALUES (NULL,'张三',23,'男',default,1,50000);

INSERT user1(username,age,sex,addr,married,salary)
VALUES ('mapbar_front',28,'男','甘肃',0,30000),
('张三疯',28,'男','上海',0,30000),
('章子怡',28,'女','北京',0,50000),
('奶茶妹',28,'女','广州',0,300000);

SELECT id AS 编号, username AS 用户名 from user1;
SELECT id,username from user1 AS u;
SELECT user1.id,user1.username FROM user1;
