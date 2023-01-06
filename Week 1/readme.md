## Week 1 Notes

## Azure Environment Setup

The Azure environment was very straightforward, with the only hiccup being moving subscriptions to the new management groups as I needed to enable elevated privilages first. See b elow for the very basic setup structure I used. 

## Write Resume in HTML

I fully admit I cheated a bit here. I exported my current resume in Word to html format and used that as my baseline. While this makes for a consistant look between my docx/pdf versions, it does make it a bit harder to edit. I will most likely change this in the future to be more edit friendly. 

I did have to play around and make many edits for formatting.

## Style Resume using CSS

With the help of codepen.io I was able to quickly modify a CSS file to fit the syling I needed. I plan to modify this in the future as well, add some coloured side bars and such.

## Deploy On Static Website (+DevOps Mod)

I have decided to use Terraform from the beginning of this challenge to tackle any IaC needs. My TF file will need to do the following:
  - [ ] Create Resource Group
  - [ ] Create Blob Storage 
  - [ ] Create CDN Endpoint 

## Week 1: Building The Front End [ ]
  - [X] Azure environment setup 
  - [X] Write resume in HTML
  - [X] Style resume using CSS
  - [X] Deploy on static website
  - [X] HTTPS configuration 
  - [X] DNS configuration 

  * **DevOps Mod:**
    - [X] GitHub Repo
    - [ ] Convert resources to IaC
      - [X] Azure Storage
      - [X] CDN endpoint 
      - [ ] Etc.
    - [ ] GitHub Actions (Build, Deploy, Smoke Test)

