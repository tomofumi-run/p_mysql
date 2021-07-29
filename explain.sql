DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140), 
  likes INT,
  area VARCHAR(20),
  PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE 'data.csv' INTO TABLE posts
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES
  (message, likes, area);

SHOW INDEX FROM posts\G
EXPLAIN SELECT * FROM posts WHERE id = 30\G -- key 1 row 1

ALTER TABLE posts ADD INDEX index_area(area);
EXPLAIN SELECT * FROM posts WHERE area = 'Kyoto'\G; -- key null row 200 addindex -> key index_area row 83
ALTER TABLE posts DROP index_area;
SHOW INDEX FROM posts\G;