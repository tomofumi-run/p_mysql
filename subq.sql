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

-- likeの平均を表示したいが、以下の記述だと一つのレコードに集約してしまう。
SELECT *, AVG(likes) AS avg FROM posts;

-- SELECTにSELECTを取り入れて解決。
-- クエリが長くなる、処理速度が遅くなるデメリットもある。
SELECT
  *,
  (SELECT AVG(likes) FROM posts) AS avg -- サブクエリ
FROM
  posts;