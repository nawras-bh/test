# Project variables
variable "location" {
  type        = string
  description = "The location for the deployment"
  default     = "eastus"
}

variable "rgname" {
  type        = string
  description = "RG name in Azure"
  default     =  "iotstorage001"
}


variable "saname" {
  type        = string
  description = "Storage Account name"
  default     = "edgepfe"
}
variable "containername" {
  type        = string
  description = "container name"
  default     = "edgeblob"
}
