from flask_restful import Resource
from Model import db,Class_details,Class_detailsschema

class_detailsschema = Class_detailsschema(many=True)

class List_classes(Resource):


    def get(self):
        class_data = Class_details.query.all()
        
        if not class_data:
            return {'message': 'No classes found'}, 400
        
        else:

            class_data = class_detailsschema.dump(class_data)
            #print(class_data)

            return {'data': class_data}, 200
