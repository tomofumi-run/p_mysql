-- 内部結合
DROP TABLE IF EXISTS posts; -- userより前に削除しないと整合性が取れなくなる
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20),
  introduction VARCHAR(140),
  PRIMARY KEY(id)
);

CREATE TABLE posts (
 id INT NOT NULL AUTO_INCREMENT,
 user_id INT,
 title VARCHAR(15),
 body VARCHAR(140),
 PRIMARY KEY(id),
 FOREIGN KEY(user_id) REFERENCES users(id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
 -- userに参照して、user_idが存在しなければ弾いて欲しい。
);

INSERT INTO users (name, introduction) VALUES
  ('Tom', 'Hey!'),
  ('Bob', 'Wow!'),
  ('Shelly', "What's?"),
  ('John', 'Hoge'),
  ('Koike', 'Welcome in Tokyo');

INSERT INTO posts (user_id, title, body) VALUES 
  (1, 'Hello', "I'm Tom"),
  (1, 'Nice day', 'Today is sunny'),
  (3, 'Hey everyone', 'Go go !!'),
  (5, 'Mitsudesu', 'Be careful.'),
  (6, 'Null Post', 'Search Me');

-- 内部結合 usersを主にしてpostsを結合 
SELECT
 *
FROM users RIGHT JOIN posts ON users.id = posts.user_id; -- usersを軸にしてデータを抽出
FROM users LEFT JOIN posts ON users.id = posts.user_id; -- postsを軸にしてデータを抽出