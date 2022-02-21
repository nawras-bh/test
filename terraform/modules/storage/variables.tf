# Project variables
variable "location" {
  type = string
  description = "The location for the deployment"
}

variable "rgname" {
  type        = string
  description = "RG name in Azure"
}


variable "saname" {
  type = string
  description = "Storage Account name"
}
