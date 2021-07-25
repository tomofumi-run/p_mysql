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

-- WHERE (group以前に機能)とHAVING(group化されてから機能)
-- likesが30より大きいareaを取得する
SELECT
  area, SUM(likes)
FROM
  posts
GROUP BY
  area
HAVING -- group化された表からの検索となる
  SUM(likes) >= 30;


-- likesが10より大きい数からlikesを合計し、グループにする
SELECT
  area, SUM(likes)
FROM
  posts
WHERE
  likes >= 10;
GROUP BY
  area