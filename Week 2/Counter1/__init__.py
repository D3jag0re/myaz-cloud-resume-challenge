import logging

import azure.functions as func
from azure.cosmos import exceptions, CosmosClient, PartitionKey

def main(req: func.HttpRequest, inputDocument: func.DocumentList, outputDoc: func.Out[func.Document]) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    counter = NewCountValue(inputDocument[0]['count']) 
    inputDocument[0]['count'] = counter
    outputDoc.set(func.Document.from_json(inputDocument[0].to_json()))
    if counter:
        return func.HttpResponse(f"{counter}", status_code=200)
    else:
        return func.HttpResponse(
             "Error",
             status_code=500
        )

def NewCountValue(value: int):
    return value + 1
