DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140), 
  PRIMARY KEY (id)
);

CREATE TABLE comments (
  id INT NOT NULL AUTO_INCREMENT,
  post_id INT,
  comment VARCHAR(140), 
  parent_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (post_id) REFERENCES posts(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO posts (message) VALUES 
  ('post-1'),
  ('post-2'),
  ('post-3');

INSERT INTO comments (post_id, comment, parent_id) VALUES 
  (1, 'comment-1-1', NULL),
  (1, 'comment-1-2', NULL),
  (3, 'comment-3-1', NULL),
  (1, 'comment-1-2-1', 2),
  (1, 'comment-1-2-2', 2),
  (1, 'comment-1-2-1-1', 4);

/*
post-1
  comment-1-1
  comment-1-2
    comment-1-2-1
      comment-1-2-1-1
    comment-1-2-2
post-2
post-3
  comment-3-1
*/

SELECT * FROM posts;
SELECT * FROM comments;
-- CTE(Common Table Expression) 一時的なテーブル
-- 再帰的CTE
-- 再帰的でないCTE

WITH t AS ( -- cteとしたいサブクエリを記述
    SELECT * FROM comments WHERE parent_id = 2 -- このクエリをtとする
)
SELECT
  comments.*
FROM
  comments JOIN t
ON
  comments.parent_id = t.id;