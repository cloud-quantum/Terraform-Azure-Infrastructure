variable "resource_group_name" {
  description = "Name of resource group where resources will be created."
}

variable "resource_group_location" {
  description = "Location of resource group where resources will be created."
}

variable "acr_configuration" {
  description = "The list objects for creating vnet."
}

variable "index" {
  description = "Database subtnet id index"
  type        = number
  default     = 0 
}