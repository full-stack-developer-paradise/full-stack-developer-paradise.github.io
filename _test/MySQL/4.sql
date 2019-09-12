-- 测试整型

CREATE TABLE test_int(
    a tinyint,
    b smallint,
    c mediumint,
    d int,
    e bigint
)ENGINE=INNODB CHARSET=UTF8;
-- 如果超过数据类型的范围，会发生截断的效果。
INSERT test_int(a) VALUES(-128);
INSERT test_int(a) VALUES(-129);

-- 测试无符号
CREATE TABLE test_unsigned(
    a tinyint,
    b tinyint unsigned
);

INSERT INTO test_unsigned (A, B) values (-12, -12);

INSERT INTO test_unsigned (A, B) values (0, 0);

-- 测试0填充
CREATE TABLE test_int1(
    a tinyint ZEROFILL,
    b smallint ZEROFILL,
    c mediumint ZEROFILL,
    d int ZEROFILL,
    e bigint ZEROFILL
)ENGINE=INNODB CHARSET=UTF8;

INSERT INTO test_int1 (a, b) values (1, 2);

















