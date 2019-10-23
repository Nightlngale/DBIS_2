CREATE TABLE person(
	id int PRIMARY KEY,
	first_name text NOT NULL,
	second_name text NOT NULL,
	birthday timestamp,
	city text NOT NULL
);

CREATE TABLE profession(
	id int PRIMARY KEY,
	name text NOT NULL,
	minimal_work_expirience int,
	minimal_education text,
	category text
);

CREATE TABLE skill(
	id int PRIMARY KEY,
	name text NOT NULL
);

CREATE TABLE users_skills(
	id int PRIMARY KEY,
	user_id int,
	skill_id int,
	FOREIGN KEY (user_id) REFERENCES person (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (skill_id) REFERENCES skill (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE professions_skills(
	id int PRIMARY KEY,
	profession_id int,
	skill_id int,
	FOREIGN KEY (profession_id) REFERENCES profession (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (skill_id) REFERENCES skill (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE company(
	id int PRIMARY KEY,
	company_name text,
	company_logo text
);

CREATE TABLE vacancy(
	id int PRIMARY KEY,
	name text NOT NULL,
	duties text NOT NULL,
	salary float,
	description text,
	created_at timestamp,
	profession_id int,
	company_id int,
	FOREIGN KEY (profession_id) REFERENCES profession (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (company_id) REFERENCES company (id) ON DELETE CASCADE ON UPDATE CASCADE
);