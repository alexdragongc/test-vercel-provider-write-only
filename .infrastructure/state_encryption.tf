variable "passphrase" {
  type      = string
  sensitive = true

  validation {
    condition     = length(var.passphrase) >= 16
    error_message = "passphrase must be at least 16 characters long."
  }
}

terraform {
  encryption {
    key_provider "pbkdf2" "key_provider_block" {
      passphrase = var.passphrase
    }
    method "aes_gcm" "encryption_method_name" {
      keys = key_provider.pbkdf2.key_provider_block
    }

    state {
      method   = method.aes_gcm.encryption_method_name
      enforced = true
    }
  }
}
