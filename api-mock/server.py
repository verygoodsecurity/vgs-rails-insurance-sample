from flask_restful import Resource, Api
from flask import Flask, request
import random

app = Flask(__name__)
api = Api(app)


class Account(Resource):
    def post(self):
        print("API request: " + str(request.json))
        name = request.json.get('name')
        address = request.json.get('address')
        ssn = request.json.get('ssn')
        income = request.json.get('income')
        return int(income) + (len(ssn) - random.randint(1, 9)) * len(address) - 100 * len(name) + 2000


api.add_resource(Account, '/quote')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
