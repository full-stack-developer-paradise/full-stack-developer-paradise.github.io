-- 测试CHAR 和 VARCHAR
CREATE TABLE test_str(
    a CHAR(5),
    b VARCHAR(5)
);

INSERT test_str (a,b) VALUES ('name', 'name2');
INSERT test_str (a,b) VALUES ('', '');
INSERT test_str (a,b) VALUES ('a', 'a');
INSERT test_str (a,b) VALUES ('ab', 'ab');
INSERT test_str (a,b) VALUES ('abc', 'abc');
INSERT test_str (a,b) VALUES ('abcdef', 'abcdef');
INSERT test_str (a,b) VALUES (' 123 ', ' 123 ');


-- 测试TEXT不能有默认值
CREATE TABLE test_str1 (
    content TEXT DEFAULT 'THIS IS A TEXT'
);


-- 测试ENUM
CREATE TABLE test_ENUM(
sex ENUM('男','女','保密')
);
INSERT test_ENUM (sex) VALUES('男');
INSERT test_ENUM (sex) VALUES(NULL);
INSERT test_ENUM (sex) VALUES(1);

-- SET
CREATE TABLE test_set(
a SET('A','B','C')
);
INSERT test_set (a) VALUES('A');
INSERT test_set (a) VALUES('B');
INSERT test_set (a) VALUES('C');
INSERT test_set (a) VALUES('A,B,C');
