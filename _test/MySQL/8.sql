-- 测试主键
CREATE TABLE test_primary_key(
    id INT UNSIGNED PRIMARY KEY,
    username VARCHAR(20)
);
INSERT test_primary_key(id,username) VALUES (1,'king');
INSERT test_primary_key(username) VALUES ('que');
INSERT test_primary_key(id,username) VALUES (1,'que');

CREATE TABLE test_primary_key1(
    id INT UNSIGNED KEY,
    username VARCHAR(20)
);

CREATE TABLE test_primary_key2(
    id INT UNSIGNED,
    username VARCHAR(20),
    PRIMARY KEY(id)
);


--CREATE TABLE test_primary_key2(
--    id INT UNSIGNED PRIMARY KEY,
--    courseid INT UNSIGNED PRIMARY KEY,
--    username VARCHAR(20),
--    email VARCHAR(20)
--);

CREATE TABLE test_primary_key3(
    id INT UNSIGNED,
    courseid VARCHAR(20),
    username VARCHAR(20),
    email VARCHAR(20),
    PRIMARY KEY(id,courseid)
);

CREATE TABLE test_primary_key4(
    id INT UNSIGNED,
    courseid VARCHAR(20),
    username VARCHAR(20),
    email VARCHAR(20),
    PRIMARY KEY(id,courseid)
);

INSERT INTO test_primary_key4(id,courseid,username,email)
values (1,'a','king','33@qq.com');
INSERT INTO test_primary_key4(id,courseid,username,email)
values (1,'b','king','33@qq.com');

-- 测试AUTO_INCREMENT
CREATE TABLE test_auto_increment(
id INT UNSIGNED KEY AUTO_INCREMENT,
username VARCHAR(20)
);
INSERT test_auto_increment(username) VALUES('a');
INSERT test_auto_increment(username) VALUES('b');
INSERT test_auto_increment(username) VALUES('c');
