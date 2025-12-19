# resoure group
rgs = {
  "rg1" = {
    rg_name    = "anoopku1122"
    location   = "Korea Central"
    managed_by = "terraform"
    tags = {
      owner       = "anoopku"
      team        = "devopsg2"
      enviornment = "dev"
    }
  }
  
}

storage_account = {
  "stg1" = {
    name                     = "anoopkustg1234"
    resource_group_name      = "anoopku1122"
    location                 = "Korea Central"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  
  }
}

# Vnet
vnet = {
  "vnet1" = {
    vnet_name           = "anoopkuvnet"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    address_space       = ["10.0.0.0/16"]
  }
}

# Subnets
subnets = {
  "sub01" = {
    name                 = "frontend_subnet"
    resource_group_name  = "anoopku1122"
    virtual_network_name = "anoopkuvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "sub02" = {
    name                 = "backend_subnet"
    resource_group_name  = "anoopku1122"
    virtual_network_name = "anoopkuvnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

#NSG
nerwork_security_group = {
  nsg1 = {
    nsg_name            = "frontend_nsg"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    security_rule = {
      rule1 = {
        name                       = "anoopku11"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "8080", "10000-10010"] 
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }

  nsg2 = {
    nsg_name            = "backend_nsg"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    security_rule = {
      rule1 = {
        name                       = "anoopku22"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "8080", "10000-10010"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

# Public IP
public_ip = {
  "pip1" = {
    name                = "frontend_pip"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    allocation_method   = "Static"
  }

  "pip2" = {
    name                = "backend_pip"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    allocation_method   = "Static"
  }
}

# NIC
network_interface = {
  "nic1" = {
    name                = "frontend_nic"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    ip_configuration = [{
      name                          = "frontend_ip_config"
      private_ip_address_allocation = "Dynamic"
      subnet_name                   = "frontend_subnet"
      virtual_network_name          = "anoopkuvnet"
      pip_name                      = "frontend_pip"

    }]
  }

  "nic2" = {
    name                = "backend_nic"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    ip_configuration = [{
      name                          = "backend_ip_config"
      private_ip_address_allocation = "Dynamic"
      subnet_name                   = "backend_subnet"
      virtual_network_name          = "anoopkuvnet"
      pip_name                      = "backend_pip"

    }]
  }
}

vm = {
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    # admin_username                  = "adminuser"
    # admin_password                  = "anoopku@123456789"
    disable_password_authentication = "false"
    size                            = "Standard_D2s_v3"
    nic_name                        = "frontend_nic"
    kv_name                         = "anoopkuNeww01"
    secret_name                     = "vmuser"
    secret_password                 = "vmpassword"


    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    name                = "backendvm"
    resource_group_name = "anoopku1122"
    location            = "Korea Central"
    # admin_username                  = "adminuser"
    # admin_password                  = "anoopku@123456789"
    disable_password_authentication = "false"
    size                            = "Standard_D2s_v3"
    nic_name                        = "backend_nic"
    kv_name                         = "anoopkuNeww01"
    secret_name                     = "vmuser"
    secret_password                 = "vmpassword"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

keyvault = {
  "kv1" = {
    kv_name                     = "anoopkuNeww01"
    resource_group_name         = "anoopku1122"
    location                    = "Korea Central"
    enabled_for_disk_encryption = true
    sku_name                    = "standard"
    soft_delete_enabled         = 7
    purge_protection_enabled    = false
    secret_name                 = "vmuser"
    secret_user_value           = "adminuser"
    secret_password             = "vmpassword"
    secret_password_value       = "Password@12345"


  }
}

sql_servers = {
  "server1" = {
    server_name           = "anoopkuserver02"
    resource_group_name   = "anoopku1122"
    location              = "Korea Central"
    version               = "12.0"
    secret_name           = "vmuser"
    secret_password       = "vmpassword"
    secret_user_value     = "sqladminuser"
    secret_password_value = "SqlPassword@12345"
    kv_name               = "anoopkuNeww01"


  }
}

sql_databases = {
  "db1" = {
    databse_name        = "anoopkudb11"
    server_name         = "anoopkuserver02"
    resource_group_name = "anoopku1122"

  }
}
