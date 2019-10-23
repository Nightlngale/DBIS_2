-- company
INSERT INTO company(id, company_name, company_logo)
VALUES(0, 'Rica', 'https://i.pinimg.com/originals/b5/8d/c0/b58dc07f4d2cb7918fb24edecae846d7.jpg');
INSERT INTO company(id, company_name, company_logo)
VALUES(1, 'Google', 'https://imgclf.112.ua/original/2015/12/15/199925.PNG?timestamp=1450192509');
INSERT INTO company(id, company_name, company_logo)
VALUES(2, 'Uber', 'https://atr.ua/uploads_images/cache/Post/Post181612/8d3d020314-1_895x595.jpg');

-- user
INSERT INTO person(id, first_name, second_name, birthday, city)
VALUES (0, 'Yevhenii', 'Moroziuk', TO_TIMESTAMP('03 10 99 04:35', 'MM DD YY HH:MI'), 'Kiev');
INSERT INTO person(id, first_name, second_name, birthday, city)
VALUES (1, 'Amid', 'Promod', TO_TIMESTAMP('12 31 89 12:47', 'MM DD YY HH:MI'), 'New Delhi');
INSERT INTO person(id, first_name, second_name, birthday, city)
VALUES (2, 'Aaid', 'Mahachkala', TO_TIMESTAMP('2 1 89 08:13', 'MM DD YY HH:MI'), 'New Delhi');

-- profession
INSERT INTO profession(id, name, minimal_work_expirience, minimal_education, category)
VALUES (0, '.NET Developer', 1, 'university', 'IT');
INSERT INTO profession(id, name, minimal_work_expirience, minimal_education, category)
VALUES (1, 'Memology professor', 3, 'university', 'Modern');
INSERT INTO profession(id, name, minimal_work_expirience, minimal_education, category)
VALUES (2, 'Builder', 0, 'college', 'Construction');
INSERT INTO profession(id, name, minimal_work_expirience, minimal_education, category)
VALUES (3, 'Dancing teacher', 0, 'school', 'Sport');

-- skill
INSERT INTO skill(id, name)
VALUES (0, 'english');
INSERT INTO skill(id, name)
VALUES (1, 'sense of humor');
INSERT INTO skill(id, name)
VALUES (2, 'work with stone');

-- profession skills
INSERT INTO professions_skills(id, profession_id, skill_id)
VALUES (0, 0, 0);
INSERT INTO professions_skills(id, profession_id, skill_id)
VALUES (1, 1, 1);
INSERT INTO professions_skills(id, profession_id, skill_id)
VALUES (2, 2, 2);

-- user skills
INSERT INTO users_skills(id, user_id, skill_id)
VALUES (0, 0, 0);
INSERT INTO users_skills(id, user_id, skill_id)
VALUES (1, 1, 1);
INSERT INTO users_skills(id, user_id, skill_id)
VALUES (2, 2, 2);

-- vacancy
INSERT INTO vacancy(id, name, duties, salary, description, created_at, profession_id, company_id)
VALUES (0, 'Dancing teacher', 'teach children', 23000.00, 'work with children', TO_TIMESTAMP('12 12 19 12:47', 'MM DD YY HH:MI'), 3, 0);
INSERT INTO vacancy(id, name, duties, salary, description, created_at, profession_id, company_id)
VALUES (1, 'Junior .Net Developer', 'create web applications ', 25000.00, 'work with ASP.NET', TO_TIMESTAMP('12 12 19 12:47', 'MM DD YY HH:MI'), 0, 1);
INSERT INTO vacancy(id, name, duties, salary, description, created_at, profession_id, company_id)
VALUES (2, 'Memology lecturer', 'teach students', 10000.00, 'work with students and memes', TO_TIMESTAMP('12 12 19 12:47', 'MM DD YY HH:MI'), 1, 1);
