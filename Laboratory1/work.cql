// professions
DROP INDEX IF EXISTS vacancybot.skl;
CREATE INDEX IF NOT EXISTS skl ON vacancybot.professions (skills);

INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills)
VALUES('.NET Developer', 'IT', 1, 'university',[{name:'C#'}, {name:'OOP and SOLID'}, {name:'english'}, {name:'google using'}]);

INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills)
VALUES('Memology professor', 'Modern', 2, 'university',[{name:'thinking'}, {name:'sense of humor'}, {name:'english'}, {name:'google using'}, {name:'teaching'}]);

INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills)
VALUES('Builder', 'Construction', 0, 'college',[{name:'work with stone'}, {name:'no alcho'}]);

SELECT *
FROM vacancybot.professions;

UPDATE vacancybot.professions SET skills = skills+[{name:'strong body'}] WHERE name = 'Builder' AND category = 'Construction';
UPDATE vacancybot.professions SET minimal_work_expirience = 0 WHERE category =  'IT'; 
UPDATE vacancybot.professions SET minimal_education = 'school' WHERE name = 'Builder' AND category = 'Construction';

SELECT *
FROM vacancybot.professions;

//to delete row i need to leave only partition key
DELETE FROM vacancybot.professions WHERE name = 'Builder' AND category = 'Construction';
DELETE FROM vacancybot.professions WHERE name = '.NET Developer' AND category = 'IT';
DELETE FROM vacancybot.professions WHERE name = 'Memology professor' AND category = 'Modern';

SELECT *
FROM vacancybot.professions;

//users
DROP INDEX IF EXISTS vacancybot.userskill;
CREATE INDEX IF NOT EXISTS userskill ON vacancybot.users (skills);

INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills)
VALUES('Yevhenii', 'Moroziuk', 1800, 5000,toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'Kiev', [{name:'programming'}, {name:'troubleshooting'}]);
INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills)
VALUES('Amid', 'Promod', 58, 50, toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'New Delhi', [{name:'programming'}, {name:'youtube'}, {name:'roof riding'}]);
INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills)
VALUES('Aaid', 'Mahachkala', 600, 78, toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'New Delhi', [{name:'programming'}, {name:'cooking'}]);

SELECT *
FROM vacancybot.users;

UPDATE vacancybot.users SET skills = skills+[{name:'strong body'}] WHERE city = 'Kiev' AND first_name = 'Yevhenii' and birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
UPDATE vacancybot.users SET last_name = 'Mahaharacachkala' WHERE city='New Delhi' AND first_name = 'Aaid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
UPDATE vacancybot.users SET living_wage = 100 WHERE city='New Delhi';

SELECT *
FROM vacancybot.users;

DELETE FROM vacancybot.users WHERE city = 'Kiev' AND first_name = 'Yevhenii' and birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
DELETE FROM vacancybot.users WHERE city='New Delhi' AND first_name = 'Aaid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
DELETE FROM vacancybot.users WHERE city='New Delhi' AND first_name = 'Amid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));

SELECT *
FROM vacancybot.users;

// vacancy
//DROP INDEX IF EXISTS vacancybot.vac;
//CREATE INDEX vac	 ON vacancybot.users (skills);

INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company)
VALUES('Dancing teacher', 'Dancing teacher', 23000.00, 'teach children', 'work with children', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Rica', company_logo:'https://i.pinimg.com/originals/b5/8d/c0/b58dc07f4d2cb7918fb24edecae846d7.jpg'});
INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company)
VALUES('Middle JS Developer', 'JS Developer', 53000.00, 'create web applications ', 'NodeJS, React', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Google', company_logo:'https://imgclf.112.ua/original/2015/12/15/199925.PNG?timestamp=1450192509'});
INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company)
VALUES('Uber driver', 'driver', 23000.00, 'carry people in your car', 'drive a car', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Uber', company_logo:'https://atr.ua/uploads_images/cache/Post/Post181612/8d3d020314-1_895x595.jpg'});

SELECT *
FROM vacancybot.vacancy;

UPDATE vacancybot.vacancy SET salary = 26000 WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher' and created_at = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
UPDATE vacancybot.vacancy SET company = {company_name:'Abba', company_logo:'https://i.pinimg.com/originals/b5/8d/c0/b58dc07f4d2cb7918fb24edecae846d7.jpg'} WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher'and created_at = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));
UPDATE vacancybot.vacancy SET duties = 'drive a car' WHERE profession = 'driver' ;

SELECT *
FROM vacancybot.vacancy;

DELETE FROM vacancybot.vacancy WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher';
DELETE FROM vacancybot.vacancy WHERE profession = 'driver' AND name = 'Uber driver';
DELETE FROM vacancybot.vacancy WHERE profession = 'JS Developer' AND name = 'Middle JS Developer';

SELECT *
FROM vacancybot.vacancy;

SELECT *
FROM vacancybot.users
WHERE skills CONTAINS {name:'programming'};

SELECT *
FROM vacancybot.professions
WHERE skills CONTAINS {name:'english'};

SELECT *
FROM vacancybot.vacancy
WHERE profession = 'driver';

SELECT COUNT(name)
FROM vacancybot.vacancy
WHERE profession = 'driver';


