from sqlalchemy import Column, String, Integer, Date, ForeignKey

from dal.db import Base


class Person(Base):

    __tablename__ = 'person'

    id = Column(Integer, primary_key=True)
    first_name = Column(String, nullable=False)
    second_name = Column(String)
    birthday = Column(Date)
    city = Column(String)

    def __init__(self,id, first_name, second_name, birthday, city):
        self.id = id
        self.first_name = first_name
        self.second_name = second_name
        self.birthday = birthday
        self.city = city

    def to_string(self):
        return "Name: " + self.first_name + " " + self.second_name + ", city: " + self.city

class Profession(Base):

    __tablename__ = 'profession'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    minimal_work_expirience = Column(Integer)
    minimal_education = Column(String)
    category = Column(String)

    def __init__(self, name, minimal_work_expirience, minimal_education, category):
        self.name = name
        self.minimal_work_expirience = minimal_work_expirience
        self.minimal_education = minimal_education
        self.category = category

    def to_string(self):
        return "Name: " + self.name + " (" + self.category + "), minimal education: " + self.minimal_education

class Skill(Base):

    __tablename__ = 'skill'

    id = Column(Integer, primary_key=True)
    name = Column(String)

    def __init__(self, id, name):
        self.id = id
        self.name = name

    def to_string(self):
        return "Name: " + self.name

class UserSkill(Base):

    __tablename__ = 'users_skills'

    id = Column(Integer, primary_key=True)
    user_id = Column(Integer, ForeignKey('person.id'))
    skill_id = Column(Integer, ForeignKey('skill.id'))

    def __init__(self, id, user_id, skill_id):
        self.id = id
        self.user_id = user_id
        self.skill_id = skill_id
