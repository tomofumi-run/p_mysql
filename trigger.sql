DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS logs;
DROP TRIGGER IF EXISTS posts_update_trigger; -- triggerの削除

CREATE TABLE posts (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  PRIMARY KEY (id)
);

CREATE TABLE logs (
  id INT NOT NULL AUTO_INCREMENT,
  message VARCHAR(140),
  created DATETIME DEFAULT NOW(),
  PRIMARY KEY (id)
);

CREATE TRIGGER
  posts_update_trigger
AFTER UPDATE ON
  posts
FOR EACH ROW -- 繰り返しで複数も更新
  INSERT INTO
    logs (message)
  VALUES
    -- ('Updated'); 更新前更新後を含めると...
    (CONCAT(OLD.message, '->', NEW.message));

INSERT INTO posts (message) VALUES
  ('post-1'),
  ('post-2'),
  ('post-3');
UPDATE posts SET message = "change post" WHERE id = 1;
UPDATE posts SET message = "change post2" WHERE id = 2;

SELECT * FROM posts;
SELECT * FROM logs; -- ログが残る

-- SHOW TRIGGERS; -- 見にくい
SHOW TRIGGERS\G; -- 改行されて見やすくなる