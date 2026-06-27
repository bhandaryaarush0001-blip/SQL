CREATE TABLE IF NOT EXISTS Restaurant(
name TEXT,
neighbourhood TEXT,
cuisine TEXT,
review REAL,
price TEXT,
health TEXT
);

INSERT INTO Restaurant(name,neighbourhood,cuisine,review,price,health)
VALUES
('peter','brooklyn','Steak',4.4,'$$$$','A'),
('jongro','midtown','korean',3.5,'$$','A'),
('pocha','midtown','pizza',4.0,'$$$','B'),
('lighthouse','queens','chinese',3.9,'$','A'),
('minca','downtown','american',4.6,'$$$',''),
('dirty candy','uptown','italian',4.9,'$$$$','B'),
('di fara pizza','brooklyn','pizza',3.8,'$$','A'),
('golden unicorn','uptown','italian',3.8,'$','A');

SELECT DISTINCT neighbourhood
FROM Restaurant;

SELECT DISTINCT cuisine
FROM Restaurant;

SELECT *
FROM Restaurant
WHERE cuisine = 'chinese';

SELECT *
FROM Restaurant
WHERE price = '$$$';

SELECT *
FROM Restaurant
WHERE name LIKE '%Candy%';

SELECT *
FROM Restaurant
WHERE neighbourhood IN ('midtown','downtown','brooklyn');

SELECT *
FROM Restaurant
WHERE health = '' OR health IS NULL;

SELECT *
FROM Restaurant
ORDER BY review DESC
LIMIT 4;


