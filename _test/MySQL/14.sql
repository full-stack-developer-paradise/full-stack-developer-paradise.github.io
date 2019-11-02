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
    `cateId` TINYINT NOT NULL COMMENT '新闻所属分类编号'
)ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 插入数据
INSERT INTO news (title,content,cateId) VALUES
('a1','aaaa1',1),
('a2','aaaa2',1),
('a3','aaaa3',4),
('a4','aaaa4',2),
('a5','aaaa5',3);

-- 查询news id,title,content
-- news_cate cateName

select news.id,news.title,news.content,news_cate.cateName
FROM news JOIN news_cate
ON news.cateId=news_cate.id;

