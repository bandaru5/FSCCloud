terraform {  
  required_version = ">= 1.0.0"  
  
  required_providers {    
    azurerm = {      
      source  = "hashicorp/azurerm"      
      version = "~> 3.0" 
  }
 }
}

terraform import azurerm_resource_group.main /subscriptions/<subscription_id>/resourceGroups/rg-MyWebApp-dev

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "budget-${var.environment}"
  amount          = var.budget_amount
  time_grain      = "Monthly"
  subscription_id = "/subscriptions/${var.subscription_id}"

time_period {
  start_date = "2025-07-01T00:00:00Z"
  end_date   = "2099-12-31T00:00:00Z"
}

  notification {
    enabled        = true
    operator       = "GreaterThan"
    threshold      = 90.0
    contact_emails = var.budget_contact_email
  }
}


provider "azurerm" {
  features{}  
# Authenticate with Azure CLI for simplicity in demo  # In production, it is recommended to use Service Principal or Managed Identity for authentication.
}