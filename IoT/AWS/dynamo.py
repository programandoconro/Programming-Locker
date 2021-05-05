#!/usr/bin/python3

import boto3

client = boto3.client("dynamodb")

response = client.get_item(TableName='testo', Key={'documents':{'S':str('hola')}})

print(response)

