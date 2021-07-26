-- 内部結合
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20),
  introduction VARCHAR(140),
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
 id INT NOT NULL AUTO_INCREMENT,
 user_id INT,
 title VARCHAR(15),
 body VARCHAR(140),
 PRIMARY KEY(id)
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
  (5, 'Mitsudesu', 'Be careful.');

-- 内部結合 usersを主にしてpostsを結合 
SELECT
  name,title, body
FROM
  users JOIN posts ON users.id = posts.user_id;
