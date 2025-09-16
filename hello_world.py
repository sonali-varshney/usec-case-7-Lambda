def lambda_handler(event, context):

    return {
        'statusCode': 200,
        'body': 'Hello World!'
    }
# Then zip it using zip helloworld.zip hello_world.py 