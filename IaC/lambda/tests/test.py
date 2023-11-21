import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('mytable1')

def simulate_lambda_handler(event, context):
    response = table.get_item(Key={'id': '0'})
    views = response['Item']['Views']
    views += 1
    print(views)

    response = table.put_item(Item={'id': '0', 'Views': views})

    return views

# Simulate an event and context (modify as needed)
event = {"key1": "value1", "key2": "value2"}
context = {}

# Call the Lambda handler
result = simulate_lambda_handler(event, context)

# Print the result
print("Result:", result)
