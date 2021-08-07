variable "subscription_id" {
  description = "ID of the subscription in which the resources should be deployed"
  type        = string
  default     = "133541e5-74f7-443e-9608-b5a6bf7e575e"
}

variable "subscription_name" {
  description = "Name of the subscription in which the resources should be deployed"
  type        = string
  default     = "amapolis-root-subscription"
}

# For other locations see here: https://azure.microsoft.com/en-us/global-infrastructure/geographies/#overview
variable "datacenter_location" {
  description = "In which location the resource should be deployed"
  type        = string
  default     = "West Europe"
}