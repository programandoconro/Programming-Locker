#!/usr/bin/python3

import boto3

# Get item: 
client = boto3.client("dynamodb")
response = client.get_item(TableName='testo', Key={'documents':{'S':str('hola')}})

print(response)

# Get all items: 

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('testo')
items = table.scan()['Items']

for item in items:
    print (item)

