## Week 1 Notes

Going to try and do from TF from the beginning again. Will be a challenge since I haven't done either of these manually before (unlike previous steps). 

## Database

As per the challenge I will use the Table API of Azure’s CosmosDB for this using serverless capacity mode. 

## API

Building the new RG / App Service Plan, and Function App was pretty straightforward using Terraform. 

## Python

Notes


## Week 2: Building The API [ ]
  - [ ] Database
  - [ ] API
  - [ ] Python for Azure Function
  - [X] Source Control

  * **DevOps Mod:**
    - [ ] Establishing Metrics
    - [ ] Setup Azure Monitor alert
    - [ ] Create action group for handling alerts
    - [ ] Set email alerts
    - [ ] Test
    - [ ] Connect alert to Slack

**Goal 1: Get Azure Function Talking to Database:**
  - [X] New RG for API 
  - [X] Setup Python Azure Function
  - [X] Setup CosmoDB Table (Table API - Serverless Mode)
  - [ ] Setup Bindings between table and function
  - [ ] write the Python code in your Azure Function that will save a value to the CosmosDB table
  - [ ] Set up your output bindings so that the updated value is returned from the function
	
**Goal 2: Trigger Azure Function From Outside:**
  - [ ] Set up the HTTP trigger for your Azure
	Function, 
  - [ ] Grab the public URL for your function and test it using
	an external API testing service
	
**Goal 3: Trigger your Azure Function from your static site**
  - [ ] Check 