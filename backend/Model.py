from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy import create_engine

con = "postgresql://postgres:1234@localhost/postgres"
engine = create_engine(con)
db_session = scoped_session(sessionmaker(
    autocommit=False, autoflush=False, bind=engine))
ma = Marshmallow()
db = SQLAlchemy()


Base = declarative_base()
Base.query = db_session.query_property()


class tutor(Base):
    __tablename__ = 'tutor'
    id = Column(Integer, primary_key=True)
    email = Column(String)
    _pass = Column(String)

    def __init__(self, email, _pass):
        self.email = email
        self._pass = _pass


class ST(Base):
    __tablename__ = 'stdata'
    id = Column(Integer, primary_key=True)
    Name = Column(String)
    EN = Column(String)
    email = Column(String)


class Class_details(Base):
    __tablename__ = 'classes'
    id = Column(Integer, primary_key=True)
    classname = Column(String)
    classcode = Column(String)
    room = Column(String)
    data = Column(default=list)

    def __init__(self, classname, classcode, room, data):
        self.classname = classname
        self.classcode = classcode
        self.room = room
        self.data = data


class STschema(ma.Schema):
    id = fields.Integer()
    Name = fields.String(required=True)
    EN = fields.String(required=True)
    email = fields.String()


class Class_detailsschema(ma.Schema):
    id = fields.Integer()
    classname = fields.String(required=True)
    classcode = fields.String(required=True)
    room = fields.String(required=True)
    data = fields.String(cls_or_instance=list)


class tutorschema(ma.Schema):
    id = fields.Integer()
    email = fields.String(required=True)
    _pass = fields.String(required=True)
