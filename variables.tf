variable "project_name" {  
  description = "FSC Cloud"  
  type        = string 
  default     = "MyWebApp"
}

variable "location" {  
  description = "The Azure region to deploy resources"  
  type        = string 
  default     = "East Europe"
}

variable "tags" {  
  description = "A map of tags to apply to resources"  
  type        = string 
  default     = "MyWebApp"
}

variable "subscription_id" {  
  description = "The Azure Subscription ID"  
  type        = string 
}

variable "tenant_id" {  
  description = "The Azure Tenant ID"  
  type        = string 
}

variable "environment" {
  type        = string
  description = "Environment (dev/test/prod)"
}

variable "resource_group_suffix" {
  type        = string
  description = "Suffix for RG name"
}

variable "static_web_app_sku_tier" {
  type        = string
  default     = "Free"
}

variable "static_web_app_sku_size" {
  type        = string
  default     = "Free"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "budget_amount" {
  type        = number
  default     = 50.0
}

variable "budget_contact_email" {
  type        = list(string)
  description = "List of email addresses for budget alerts"
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}