CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  likes INT,
  area VARCHAR(20), -- どこで投稿されたか
  PRIMARY KEY (id)
);

INSERT INTO posts (message, likes, area) VALUES
  ('post-1', 12, 'Tokyo'),
  ('post-2', 8, 'Hokkaido'),
  ('post-3', 11, 'Okinawa'),
  ('post-4', 3, 'Tokyo'),
  ('post-5', NULL, 'Tokyo'),
  ('post-6', 9, 'Ishikawa'),
  ('post-7', 4, 'Fukuoka'),
  ('post-8', NULL, 'Osaka'),
  ('post-9', 31, 'Tokyo');

SELECT * FROM posts;

SELECT DISTINCT area FROM posts; -- areaの重複なしデータ抽出

-- areaごとのlikesの合計を抽出
-- group by を使うことでareaを基準とした結果を抽出できる
SELECT area,SUM(likes) FROM posts GROUP BY area;