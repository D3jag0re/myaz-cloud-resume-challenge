# 
variable "rgname" {
    type = string
    description = "Resource Group Name"
}

variable "location" {
    type = string
    description = "Azure Location"
}

variable "saname" {
    type = string
    description = "Storage Account Name"
}

variable "origin" {
    type = string
    description = "Origin for CDN"
}

variable "domain" {
    type = string
    description = "Custom domain"
}
   
   
   