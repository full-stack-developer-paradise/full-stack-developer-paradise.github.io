-- HH:MM:SS [D HH:MM:SS] D表示天数。
-- 测试TIME类型
CREATE TABLE test_time(
a TIME
);
INSERT test_time (a) VALUES ('12:23:25');
INSERT test_time (a) VALUES ('2 12:23:25');
INSERT test_time (a) VALUES ('22:23');
INSERT test_time (a) VALUES ('121212');
INSERT test_time (a) VALUES ('0');
INSERT test_time (a) VALUES (0);
INSERT test_time (a) VALUES (787878);
INSERT test_time (a) VALUES (NOW());
INSERT test_time (a) VALUES (CURRENT_TIME);

-- 测试DATE YYYY-MM-DD YYYYMMDD
CREATE TABLE test_date(
a DATE
);
INSERT test_date (a) VALUES ('2017-12-14');
INSERT test_date (a) VALUES ('2017-2-14');
INSERT test_date (a) VALUES ('2017-02-04');
INSERT test_date (a) VALUES ('4017-02-04');
INSERT test_date (a) VALUES ('40170214');

-- YY-MM-DD YYMMDD
-- 70-99 1970~1999
-- 00-69 2000~2069
INSERT test_date (a) VALUES ('780214');
INSERT test_date (a) VALUES ('780214');


-- DATETIME
-- YYYY-MM-DD HH:MM:SS
-- YYMMDDHHMMSS




-- TIMESTAMP
-- 范围从1978-2038年，范围比较小。
-- CURRENT_TIMESTAMP、NULL、什么也不写-----当前系统的时间。





-- YEAR
-- 1901-2155
-- 0 ----0000
-- '0'---- 2000
-- 70-99 1970~1999
-- 00-69 2000~2069




















