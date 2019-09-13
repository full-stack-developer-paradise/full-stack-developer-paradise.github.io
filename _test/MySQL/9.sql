-- 测试NOT NULL
CREATE TABLE test_not_null(
    a varchar(20),
    b varchar(20) not null
);
INSERT test_not_null(a,b) VALUES ('','');
INSERT test_not_null(a,b) VALUES (NULL,'1');
INSERT test_not_null(a,b) VALUES (NULL,NULL);

-- 测试默认值DEFAULT
CREATE TABLE test_default(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    username VARCHAR(20) NOT NULL,
    age TINYINT UNSIGNED DEFAULT 18,
    email VARCHAR(50) NOT NULL DEFAULT '11@qq.com'
);
INSERT test_default(username) VALUES ('kings');
INSERT test_default(username,age,email) VALUES ('kings',30,'imooc@qq.com');

-- 测试枚举ENUM
CREATE TABLE test_enum1(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    sex ENUM('a','b','c') DEFAULT('a')
);

-- 测试UNIQUE KEY
CREATE TABLE test_unique(
    id INT UNSIGNED AUTO_INCREMENT KEY,
    usernmae VARCHAR(20) NOT NULL UNIQUE KEY,
    card VARCHAR(10) UNIQUE KEY
);
INSERT test_unique(usernmae,card) VALUES('kings',NULL);



