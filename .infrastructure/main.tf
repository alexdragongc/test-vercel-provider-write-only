terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    vercel = {
      source  = "vercel/vercel"
      version = "~> 4.6"
    }
  }

}

resource "vercel_project" "my_project" {
  name                         = var.project_name
  node_version                 = "22.x"
  auto_assign_custom_domains   = true
  preview_deployments_disabled = true
  git_repository = {
    production_branch = "main"
    repo              = "alexdragongc/test-vercel-provider-write-only"
    type              = "github"
    deploy_hooks      = null
  }
}



resource "vercel_project_environment_variable" "public_value" {
  project_id = vercel_project.my_project.id
  key        = "PUBLIC_VALUE"
  value      = "Some public value"
  target     = ["production"]
  comment    = "a production variable"
}
