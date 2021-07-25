DROP TABLE IF EXISTS posts,posts_tokyo,posts_copy,posts_skeleton;
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140), 
  likes INT,
  area VARCHAR(20),
  PRIMARY KEY (id)
);

INSERT INTO posts (message, likes, area) VALUES 
  ('post-1', 12, 'Tokyo'),
  ('post-2', 8, 'Fukuoka'),
  ('post-3', 11, 'Tokyo'),
  ('post-4', 3, 'Osaka'),
  ('post-5', 8, 'Tokyo'),
  ('post-6', 9, 'Osaka'),
  ('post-7', 4, 'Tokyo'),
  ('post-8', 10, 'Osaka'),
  ('post-9', 31, 'Fukuoka');

-- CREATE [新しいテーブル名] AS [参照したいテーブル名]
-- 新たに東京のみを抽出したテーブルの作成
CREATE TABLE posts_tokyo AS SELECT * FROM posts WHERE area = 'TOKYO';
CREATE TABLE posts_copy AS SELECT * FROM posts;

-- データ構造をコピーしたい
CREATE TABLE posts_skeleton LIKE posts;

SHOW TABLES;
SELECT * FROM posts_copy;
SELECT * FROM posts_tokyo;
SELECT * FROM posts_skeleton;