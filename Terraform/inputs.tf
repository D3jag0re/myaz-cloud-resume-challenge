# 
variable "rgname" {
  type        = string
  description = "Resource Group Name"
}

variable "location" {
  type        = string
  description = "Azure Location"
}

variable "saname" {
  type        = string
  description = "Storage Account Name"
}

variable "origin" {
  type        = string
  description = "Origin for CDN"
}

variable "domain" {
  type        = string
  description = "Custom domain"
}

variable "rgnameAPI" {
  type        = string
  description = "Resource Group Name"
}

variable "faname" {
  type        = string
  description = "Function App Name"
}

variable "dbaccount" {
  type        = string
  description = "DB Name"
}

variable "dbname" {
  type        = string
  description = "DB Name"
}

variable "dbcontainer" {
  type        = string
  description = "DB Name"
}

   