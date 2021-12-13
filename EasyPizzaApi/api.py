from flask import Flask
from flask_restful import Resource, Api
import pandas as pd

app = Flask(__name__)
api = Api(app)

df = pd.read_csv("pizza_data.csv", sep="\t")

def get_category(cat_name):
    sub_df = df[df['category'] == cat_name]
    result = []
    for i in range(len(sub_df)):
        d = dict()
        item = sub_df.iloc[i]
        d["name"] = item["name"]
        d["price"] = str(item["price"])
        d["composition"] = item["composition"]
        d["img"] = item["img"]
        result.append(d)
    return result

class Pizza(Resource):
    def get(self):
        return get_category("pizza")

class Combo(Resource):
    def get(self):
        return get_category("combo")

class Desserts(Resource):
    def get(self):
        return get_category("desserts")

class Drinks(Resource):
    def get(self):
        return get_category("drinks")


api.add_resource(Pizza, '/pizza')
api.add_resource(Combo, '/combo')
api.add_resource(Desserts, '/desserts')
api.add_resource(Drinks, '/drinks')

if __name__ == '__main__':
    app.run(debug=True, port=8000)
