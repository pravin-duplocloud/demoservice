#!/usr/bin/env python
import os
import sys
import requests

def update_lambda():

    API_TOKEN = os.getenv('DUPLO_API_TOKEN')
    S3_BUCKET_LAMBDA = os.getenv('S3_BUCKET_LAMBDA')
    TENANTID = os.getenv('TENANTID')
    CI_TENANT_NAME = os.getenv('CI_TENANT_NAME')
    DUPLO_URL = os.getenv('DUPLO_URL')
    s3_file = 'mysite-zappa.zip'

    #UpdateLambdaFunctionConfiguration
    headers = {"Authorization": "Bearer {0}".format( API_TOKEN ),
                "Content-Type":"application/json; charset=utf-8",
                "Accept":"application/json, text/plain, */*"}
    request = {}
    request["FunctionName"]="duploservices-dev01-helloworld-128329325849"
    request["Timeout"]=20
    request["MemorySize"]=128
    request["Handler"]="handler.lambda_handler"
    request["Description"]="api gateway demo"
    request["Runtime"]="python3.7"
    print("UpdateLambdaFunctionConfiguration start ", request)
    #https://msp.duplocloud.net/subscriptions/3369e68e-2bf7-415e-b78b-6cb6aef327ec/UpdateLambdaFunctionConfiguration
    endpoint = "{0}/subscriptions/{1}/UpdateLambdaFunctionConfiguration".format(DUPLO_URL, TENANTID)
    response = requests.post(endpoint, headers=headers , data=request)
    print("UpdateLambdaFunctionConfiguration response ", endpoint, response)

    #UpdateLambdaFunction
    request = {}
    request["FunctionName"]="duploservices-dev01-helloworld-128329325849"
    request["S3Bucket"]=S3_BUCKET_LAMBDA
    request["S3Key"]=s3_file
    print("UpdateLambdaFunction start ", request)
    endpoint = "{0}/subscriptions/{1}/UpdateLambdaFunction".format(DUPLO_URL, TENANTID)
    response = requests.post(endpoint, headers=headers , data=request)
    print("UpdateLambdaFunction response ", endpoint, response)

if __name__ == "__main__":
    update_lambda()
