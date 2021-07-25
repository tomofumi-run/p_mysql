DROP TABLE IF EXISTS posts;
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

-- areaごとの平均も表示させたい！
-- 参照元は t1 と別名をつけたpostsテーブル
-- 28行目のwhereでは区別する必要があるので、別名t2とする
-- t1のareaとt2のareaが同じデータを集計関数でまとめる

SELECT
  *,
  (SELECT AVG(likes) FROM posts) AS avg,
  (SELECT AVG(likes) FROM posts AS t2 WHERE t1.area = t2.area) AS area_avg
FROM
  posts AS t1;