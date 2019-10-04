from cassandra import ConsistencyLevel
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement

transaction2 = SimpleStatement("BEGIN BATCH INSERT INTO vacancybot.users(first_name, last_name, balance, living_wage, birthday, city, skills) VALUES('Ioan', 'Petrov', 1800, 5000,toTimeStamp(toDate('2019-09-29 00:00:00+0000')), 'Kiev', [{name:'potions'}]) UPDATE vacancybot.vacancy SET salary = 24000 WHERE profession = 'Dancing teacher' AND name = 'Dancing teacher' and created_at = toTimeStamp(toDate('2019-09-29 00:00:00+0000')) APPLY BATCH", consistency_level=ConsistencyLevel.ANY)

cluster = Cluster()

session = cluster.connect('vacancybot')

session.execute(transaction2)
