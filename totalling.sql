-- データベース
CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  likes INT,
  PRIMARY KEY (id)
);

INSERT INTO posts (message, likes) VALUES
  ('post-1', 12),
  ('post-2', 8),
  ('post-3', 11),
  ('post-4', 3),
  ('post-5', NULL),
  ('post-6', 9),
  ('post-7', 4),
  ('post-8', NULL),
  ('post-9', 31);

-- 集計関数 (何を、どのように集計する、どこから)
SELECT COUNT(likes) FROM posts; -- 7
SELECT COUNT(id) FROM posts; -- 9
SELECT COUNT(*) FROM posts; -- 9

SELECT SUM(likes) FROM posts; -- 78 合計
SELECT AVG(likes) FROM posts; -- 11.1429 平均
SELECT MAX(likes) FROM posts; -- 31 最大値
SELECT MIN(likes) FROM posts; -- 3 最小値

