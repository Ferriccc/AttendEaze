from flask_restful import Resource
from Model import db,tutor,tutorschema
from flask import request

tutor_schema = tutorschema(many=True)

class AuthorizeTutor(Resource):


   def post(self):
        json_data=request.get_json(force=True)
        tutor_data = tutor.query.filter_by(email=json_data['email']).first()
        
        if not tutor_data:
            return {"out": "false"}, 400
        
        else:

            # tutor_data = tutor.query.filter_by(email=json_data['email'])
            
            # tutor_data = tutor_schema.dump(tutor_data)
            
            # ttd=tutor_data[0]

            # if ttd['_pass'] == json_data['_pass']:
                return {"out": "true"}, 200

            # else:
            #     return {"out": "false"}, 400

