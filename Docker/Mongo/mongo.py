#!/usr/bin/python3

import pymongo

myclient = pymongo.MongoClient("localhost:27017")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]
mydict = { "name": "John", "address": "Highway 37" }
mycol.insert_one(mydict)
x = mycol.find_one()
print(x)
