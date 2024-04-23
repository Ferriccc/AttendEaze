from flask_restful import Resource
from flask import request
from Model import db,Class_details,Class_detailsschema

class_schema = Class_detailsschema(many=True)

class Insertclass(Resource):

    

    def get(self):
        args = request.args
        classname1 = args.get('classname')
        
        check = Class_details.query.filter_by(classname=classname1).first()
        return {"data":[check.data]}
        


    def patch(self):
            json_data=request.get_json(force=True)
            check = Class_details.query.filter_by(classname=json_data['classname']).first()
            print(json_data['classcode'])
            print(check.classcode)

            if check.classcode == json_data['classcode']:
                print("yes")

                check.data.append(json_data['en'])
                db.session.merge(check)
                db.session.commit()

                return {"data":"true"}
            
            else:
                return {"data":"false"}



    def post(self):
            json_check=request.get_json(force=True)
            class_=Class_details(classname=json_check['classname'],classcode=json_check['classcode'],room=json_check['room'],data=[])
            db.session.add(class_)
            db.session.commit()

        

        
    def delete(self):
        json_check = request.get_json(force=True)
        class_=json_check['classname']
        db.session.execute(f"DELETE FROM classes WHERE classname = '{class_}'")
        db.session.commit()


        