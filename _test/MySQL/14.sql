-- news_cate
CREATE TABLE IF NOT EXISTS news_cate(
    `id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
    `cateDesc` VARCHAR(100) NOT NULL DEFAULT '分类描述' COMMENT '分类描述'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;
-- 插入数据
INSERT INTO news_cate (cateName) VALUES
('国内新闻'),
('国际新闻'),
('娱乐新闻'),
('体育新闻');

-- news
CREATE TABLE IF NOT EXISTS news(
    `id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `title` VARCHAR(100) NOT NULL UNIQUE COMMENT '新闻标题',
    `content` VARCHAR(1000) NOT NULL COMMENT '新闻内容',
    `cateId` TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类编号',
    FOREIGN KEY(cateId) REFERENCES news_cate(id)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 插入数据
INSERT INTO news (title,content,cateId) VALUES
('a1','aaaa1',1),
('a2','aaaa2',1),
('a3','aaaa3',4),
('a4','aaaa4',2),
('a5','aaaa5',8);

-- 查询news id,title,content
-- news_cate cateName

select news.id,news.title,news.content,news_cate.cateName
FROM news JOIN news_cate
ON news.cateId=news_cate.id;

INSERT INTO news(title,content,cateId) values ('a6','aaaa6',45);

INSERT INTO news(title,content,cateId) VALUES ('b1','bbb1',8);

DELETE FROM news_cate WHERE id=1;

UPDATE news_cate set id=10 WHERE id=1;

INSERT news_cate(cateName) VALUES ('教育新闻');
UPDATE news_cate set cateName='教育' WHERE id=5;


-- 插入数据
INSERT INTO news_cate (cateName) VALUES
('国内新闻'),
('国际新闻'),
('娱乐新闻'),
('体育新闻');

-- news_cate
CREATE TABLE IF NOT EXISTS news_cate(
    `id` TINYINT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `cateName` VARCHAR(50) NOT NULL UNIQUE COMMENT '分类名称',
    `cateDesc` VARCHAR(100) NOT NULL DEFAULT '分类描述' COMMENT '分类描述'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;


-- news
CREATE TABLE IF NOT EXISTS news(
    `id` INT UNSIGNED AUTO_INCREMENT KEY COMMENT '编号',
    `title` VARCHAR(100) NOT NULL UNIQUE COMMENT '新闻标题',
    `content` VARCHAR(1000) NOT NULL COMMENT '新闻内容',
    `cateId` TINYINT UNSIGNED NOT NULL COMMENT '新闻所属分类编号',
    CONSTRAINT cateId_fk_newsCate FOREIGN KEY(cateId) REFERENCES news_cate(id)
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 删除外键
ALTER TABLE news
DROP FOREIGN KEY cateId_fk_newsCate;

-- ADD外键
ALTER TABLE news
ADD FOREIGN KEY(cateId) REFERENCES news_cate(id);

ALTER TABLE news
ADD CONSTRAINT cateId_fk_newsCate FOREIGN KEY(cateId) REFERENCES news_cate(id);

ALTER TABLE news
ADD FOREIGN KEY(cateId) REFERENCES news_cate(id)
ON DELETE CASCADE ON UPDATE CASCADE;
