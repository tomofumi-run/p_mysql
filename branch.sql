DROP TABLE IF EXISTS japan_handball_teams;
CREATE TABLE japan_handball_teams (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(20),
  score INT,
  position VARCHAR(5),
  PRIMARY KEY (id)
);

INSERT INTO japan_handball_teams (name, score, position) VALUES
  ('KASAHARA', 4, 'PV'),
  ('BAIG', 5, 'LB'),
  ('NARITA', 0, 'LB'),
  ('TOKUDA', 1, 'RB'),
  ('WATANABE', 3, 'RB'),
  ('DOI', 1, 'LW'),
  ('MOTOKU', 8, 'RW'),
  ('YOSHINO', 4, 'LB'),
  ('MIZUMACHI', 3, 'CB');

-- もしスコアが2点以上であればAチーム、それ以外はBチーム
SELECT
  *,
  IF(score > 2, 'A', 'B') AS Team
FROM
  japan_handball_teams;

-- スコアが4点以上はA、2点以上はB、それ以外はC
SELECT
  *,
  CASE
    WHEN score > 4 THEN 'A'
    WHEN score > 2 THEN 'B'
    ELSE 'C'
    END AS Team
FROM
  japan_handball_teams;