from flask import Blueprint
from flask_restful import Api
from resources.Login import Login
from resources.List_classes import List_classes
from resources.Insertclass import Insertclass
from resources.AuthorizeTutor import AuthorizeTutor

api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Login, '/Login')
api.add_resource(List_classes, '/Listclasses')
api.add_resource(Insertclass, '/Insert')
api.add_resource(AuthorizeTutor, '/Auth')
