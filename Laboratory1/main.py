from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement

cluster = Cluster()

session = cluster.connect('vacancybot')

def execute_command(command):
    session.execute(command)

def print_result(table_name):
    rows = session.execute('SELECT * FROM '+table_name)
    print('Table: ', table_name)
    for el in rows:
        print(el, '\n')

# create indexes
#ind1 = SimpleStatement("DROP INDEX IF EXISTS vacancybot.skl; CREATE INDEX skl ON vacancybot.professions (skills);", consistency_level = ConsistencyLevel.ANY)
#execute_command(ind1)
#ind2 = SimpleStatement("DROP INDEX IF EXISTS vacancybot.userskill; CREATE INDEX userskill ON vacancybot.users (skills);", consistency_level = ConsistencyLevel.ONE)
#execute_command(ind2)

# user -----------------------------------------

# insert
u_query1 = SimpleStatement("INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills) VALUES('Yevhenii', 'Moroziuk', 1800, 5000,toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'Kiev', [{name:'programming'}, {name:'troubleshooting'}]);",  consistency_level = ConsistencyLevel.ANY)
u_query2 = SimpleStatement("INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills) VALUES('Amid', 'Promod', 58, 50, toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'New Delhi', [{name:'programming'}, {name:'youtube'}, {name:'roof riding'}]);",  consistency_level = ConsistencyLevel.ANY)
u_query3 = SimpleStatement("INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills) VALUES('Aaid', 'Mahachkala', 600, 78, toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'New Delhi', [{name:'programming'}, {name:'cooking'}]);",  consistency_level =ConsistencyLevel.ANY)
execute_command(u_query1)
execute_command(u_query2)
execute_command(u_query3)

print_result('users')

# update
u_query4 = SimpleStatement("UPDATE vacancybot.users SET skills = skills+[{name:'strong body'}] WHERE city = 'Kiev' AND first_name = 'Yevhenii' and birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ANY)
u_query5 = SimpleStatement("UPDATE vacancybot.users SET last_name = 'Mahaharacachkala' WHERE city='New Delhi' AND first_name = 'Aaid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ANY)
u_query6 = SimpleStatement("UPDATE vacancybot.users SET living_wage = 100 WHERE city='New Delhi';", consistency_level = ConsistencyLevel.ANY)
execute_command(u_query4)
execute_command(u_query5)
execute_command(u_query6)

print_result('users')

#delete
u_query7 = SimpleStatement("DELETE FROM vacancybot.users WHERE city = 'Kiev' AND first_name = 'Yevhenii' and birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ONE)
u_query8 = SimpleStatement("DELETE FROM vacancybot.users WHERE city='New Delhi' AND first_name = 'Aaid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ONE)
u_query9 = SimpleStatement("DELETE FROM vacancybot.users WHERE city='New Delhi' AND first_name = 'Amid' AND birthday = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ONE)
execute_command(u_query7)
execute_command(u_query8)
execute_command(u_query9)

print_result('users')

# vacancy -----------------------------------------

# insert
v_query1 = SimpleStatement("INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company) VALUES('Dancing teacher', 'Dancing teacher', 23000.00, 'teach children', 'work with children', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Rica', company_logo:'https://i.pinimg.com/originals/b5/8d/c0/b58dc07f4d2cb7918fb24edecae846d7.jpg'});",  consistency_level = ConsistencyLevel.ANY)
v_query2 = SimpleStatement("INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company) VALUES('Middle JS Developer', 'JS Developer', 53000.00, 'create web applications ', 'NodeJS, React', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Google', company_logo:'https://imgclf.112.ua/original/2015/12/15/199925.PNG?timestamp=1450192509'});", consistency_level = ConsistencyLevel.ANY)
v_query3 = SimpleStatement("INSERT INTO vacancybot.vacancy(name, profession, salary, duties, description, created_at, company) VALUES('Uber driver', 'driver', 23000.00, 'carry people in your car', 'drive a car', toTimeStamp(toDate('2019-09-29 00:00:00+0000')), {company_name:'Uber', company_logo:'https://atr.ua/uploads_images/cache/Post/Post181612/8d3d020314-1_895x595.jpg'});",  consistency_level = ConsistencyLevel.ANY)
execute_command(v_query1)
execute_command(v_query2)
execute_command(v_query3)

print_result('vacancy')

# update
v_query4 = SimpleStatement("UPDATE vacancybot.vacancy SET salary = 26000 WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher' and created_at = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ANY)
v_query5 = SimpleStatement("UPDATE vacancybot.vacancy SET company = {company_name:'Abba', company_logo:'https://i.pinimg.com/originals/b5/8d/c0/b58dc07f4d2cb7918fb24edecae846d7.jpg'} WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher'and created_at = toTimeStamp(toDate('2019-09-29 00:00:00+0000'));", consistency_level = ConsistencyLevel.ANY)
v_query6 = SimpleStatement("UPDATE vacancybot.vacancy SET duties = 'drive a car' WHERE profession = 'driver' ;", consistency_level = ConsistencyLevel.ANY)
execute_command(v_query4)
execute_command(v_query5)
execute_command(v_query6)

print_result('vacancy')

#delete
v_query7 = SimpleStatement("DELETE FROM vacancybot.vacancy WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher';", consistency_level = ConsistencyLevel.ONE)
v_query8 = SimpleStatement("DELETE FROM vacancybot.vacancy WHERE profession = 'driver' AND name = 'Uber driver';", consistency_level = ConsistencyLevel.ONE)
v_query9 = SimpleStatement("DELETE FROM vacancybot.vacancy WHERE profession = 'JS Developer' AND name = 'Middle JS Developer';", consistency_level = ConsistencyLevel.ONE)
execute_command(v_query7)
execute_command(v_query8)
execute_command(v_query9)

print_result('vacancy')

# profession -----------------------------------------

# insert
p_query1 = SimpleStatement("INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills) VALUES('.NET Developer', 'IT', 1, 'university',[{name:'C#'}, {name:'OOP and SOLID'}, {name:'english'}, {name:'google using'}]);",  consistency_level = ConsistencyLevel.ANY)
p_query2 = SimpleStatement("INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills) VALUES('Memology professor', 'Modern', 2, 'university',[{name:'thinking'}, {name:'sense of humor'}, {name:'english'}, {name:'google using'}, {name:'teaching'}]);",  consistency_level = ConsistencyLevel.ANY)
p_query3 = SimpleStatement("INSERT INTO vacancybot.professions(name, category, minimal_work_expirience, minimal_education, skills) VALUES('Builder', 'Construction', 0, 'college',[{name:'work with stone'}, {name:'no alcho'}]); ",  consistency_level = ConsistencyLevel.ANY)
execute_command(p_query1)
execute_command(p_query2)
execute_command(p_query3)

print_result('professions')

# update
p_query4 = SimpleStatement("UPDATE vacancybot.professions SET skills = skills+[{name:'strong body'}] WHERE name = 'Builder' AND category = 'Construction';", consistency_level = ConsistencyLevel.ANY)
p_query5 = SimpleStatement("UPDATE vacancybot.professions SET minimal_work_expirience = 0 WHERE category =  'IT'; ", consistency_level = ConsistencyLevel.ANY)
p_query6 = SimpleStatement("UPDATE vacancybot.professions SET minimal_education = 'school' WHERE name = 'Builder' AND category = 'Construction';", consistency_level = ConsistencyLevel.ANY)
execute_command(p_query4)
execute_command(p_query5)
execute_command(p_query6)

print_result('professions')

#delete
p_query7 = SimpleStatement("DELETE FROM vacancybot.professions WHERE name = 'Builder' AND category = 'Construction';", consistency_level = ConsistencyLevel.ONE)
p_query8 = SimpleStatement("DELETE FROM vacancybot.professions WHERE name = '.NET Developer' AND category = 'IT';", consistency_level = ConsistencyLevel.ONE)
p_query9 = SimpleStatement("DELETE FROM vacancybot.professions WHERE name = 'Memology professor' AND category = 'Modern';", consistency_level = ConsistencyLevel.ONE)
execute_command(p_query7)
execute_command(p_query8)
execute_command(p_query9)

print_result('professions')

# 4 commands

#get list of users who has [name] skill
query1 = SimpleStatement("SELECT * FROM vacancybot.users WHERE skills CONTAINS {name:'programming'};")
execute_command(query1)

#get list of professions which require [name] skill
query2 = SimpleStatement("SELECT * FROM vacancybot.professions WHERE skills CONTAINS {name:'english'};")
execute_command(query2)

#get list of vacancy which has [name] profession
query3 = SimpleStatement("SELECT * FROM vacancybot.vacancy WHERE profession = 'driver';")
execute_command(query3)

#get count of vacancy which has [name] profession
query4 = SimpleStatement("SELECT COUNT(name) FROM vacancybot.vacancy WHERE profession = 'driver';")
execute_command(query4)

