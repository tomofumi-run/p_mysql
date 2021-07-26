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

-- ウインドウ関数
-- テーブルをPARTITIONと呼ばれる単位で集計、結果を追加する
SELECT
  *,
  AVG(likes) OVER () AS avg,  -- 全体の平均はOVER()のみ
  AVG(likes) OVER w AS area_avg, -- areaの平均
  SUM(likes) OVER w AS area_sum -- areaの合計
FROM
  posts
WINDOW
  w AS (PARTITION BY area); -- OVER(areaごと)を簡略化