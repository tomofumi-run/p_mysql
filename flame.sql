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

SELECT 
  *, 
  SUM(likes) OVER (
    PARTITION BY area -- partitionは同じグループの塊
    ORDER BY likes -- 小さい順にする
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING -- 前後1行をフレームにする
    ) AS area_sum -- likesの小さい順で累計集計
FROM 
  posts;