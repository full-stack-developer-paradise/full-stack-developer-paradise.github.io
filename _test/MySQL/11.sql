-- 添加和删除字断操作
CREATE TABLE IF NOT EXISTS user1(
    id INT UNSIGNED AUTO_INCREMENT KEY
);
-- 添加用户名字断 username varchar(20)
ALTER TABLE user1
ADD username VARCHAR(20);

-- 添加password not null CHAR(32);
ALTER TABLE user1
ADD password CHAR(32) NOT NULL;
-- 添加固定位置email
ALTER TABLE user1
ADD email CHAR(32) NOT NULL UNIQUE AFTER username;
-- test TINYINT(1) NOT NULL
ALTER TABLE user1
ADD test TINYINT NOT NULL DEFAULT 0 FIRST;

-- 删除TEST
ALTER TABLE user1
DROP test;



-- 添加age,addr,删除email
ALTER TABLE user1
ADD age TINYINT UNSIGNED NOT NULL DEFAULT 18,
ADD addr VARCHAR(32) NOT NULL DEFAULT '北京',
DROP email;


-- 测试添加和删除默认值的操作
CREATE TABLE user2(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL,
    age TINYINT UNSIGNED NOT NULL DEFAULT 18,
    email VARCHAR(50) NOT NULL
);

ALTER TABLE user2
ALTER email SET DEFAULT 'imooc@qq.com';

ALTER TABLE user2
ALTER age DROP DEFAULT;
