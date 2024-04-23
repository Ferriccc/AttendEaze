from flask_restful import Resource
from flask import request
from Model import db, ST, STschema

st_schema = STschema(many=True)


class Login(Resource):

    def post(self):
        json_data = request.get_json(force=True)
        student_data = ST.query.filter_by(email=json_data['en']).first()

        if not student_data:
            return {"message": "User not registered"}, 400

        else:

            student_data = ST.query.filter_by(email=json_data['en'])
            student_data = st_schema.dump(student_data)
            std = student_data[0]
            print(student_data)
            return std, 200

    def get(self):
        return {"hello": "user"}
