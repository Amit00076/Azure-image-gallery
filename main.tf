resource "azurerm_shared_image_gallery" "sig" {

  name                = ${module.naming-convention.short_resource.azurerm_shared_image_gallery}-${var.short_location}-${var.short_env}-${var.ait}-${var.short_name}

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  description         = "Shared image gallery for App L2"
  disk_encryption_set_id = "${var.disk_encryption_set_id}"
  soft_delete_enabled = true
  sharing {
    permission = "Private"
  }
  publishing_profile {
   end_of_life_date {
      days = 15
   }
  }
}

  tags                         = local.tags
  
   lifecycle {
    ignore_changes = [
      tags["CreatedDate"],
      tags["Environment"],
      tags["AIT"],
      tags["CostCenter"],
      tags["RunID"],
      ]
  }
}
