terraform {  
  required_version = ">= 1.0.0"  
  
  required_providers {    
    azurerm = {      
      source  = "hashicorp/azurerm"      
      version = "~> 3.0" 
  }
 }
}

resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.resource_group_suffix}"
  location = var.location
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "budget-${var.environment}"
  amount          = var.budget_amount
  time_grain      = "Monthly"
  subscription_id = var.subscription_id

  time_period {
    start_date = formatdate("YYYY-MM-DD", timestamp())
    end_date   = "2099-12-31"
  }

  notification {
    enabled        = true
    operator       = "GreaterThan"
    threshold      = 90.0
    contact_emails = var.budget_contact_email
  }
}


#provider "azurerm" {
  features{}  
# Authenticate with Azure CLI for simplicity in demo  # In production, it is recommended to use Service Principal or Managed Identity for authentication.
#}
