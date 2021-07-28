DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140), 
  likes INT,
  area VARCHAR(20),
  PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE 'data.csv' INTO TABLE posts -- 同じサーバーのファイルを読み込む
  FIELDS TERMINATED BY ',' -- 項目の区切りをカンマなので指定
  LINES TERMINATED BY '\n' -- 行の区切りを指定(CSVに合わせてる)
  IGNORE 1 LINES -- データの1行目をスキップ
  (message, likes, area);

SELECT * FROM posts;