CREATE KEYSPACE IF NOT EXISTS vacancybot
WITH replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 3
};

CREATE TYPE IF NOT EXISTS vacancybot.skills (
	name text
);

CREATE TYPE IF NOT EXISTS vacancybot.company_info (
	company_logo text,
	company_name text
);

CREATE TABLE IF NOT EXISTS vacancybot.professions (
	name text,
	minimal_work_expirience int static,
	minimal_education text,
	category text,
	skills list<FROZEN<skills>>,
	PRIMARY KEY (category, name)
);

CREATE TABLE IF NOT EXISTS vacancybot.vacancy (
	name text,
	duties text static,
	salary float,
	description text,
	created_at timestamp,
	company FROZEN<company_info>,
	profession text,	
	PRIMARY KEY ((profession),name, created_at)
);

CREATE TABLE IF NOT EXISTS vacancybot.users (
    first_name text,
    last_name text,	
    balance float,
    living_wage float static,
	city text,
	birthday timestamp,
	skills list<FROZEN<skills>>,
	PRIMARY KEY ((city), first_name, birthday)
);