# Snowflake native Git integration for one environment: 

#   <DATABASE>.INTEGRATIONS schema 

#     GITHUB_SECRET   - GitHub user name + read-only token (private repositories) 

#     GITHUB_REPO     - Git repository object (read-only clone of the GitHub repository) 

#   <PREFIX>_GITHUB_API_INTEGRATION (account level) - allows Snowflake to call GitHub 

 

locals { 

  use_token = var.private_repository 

} 

 

resource "snowflake_schema" "integrations" { 

  database = var.database_name 

  name     = "INTEGRATIONS" 

  comment  = "Native Git integration objects - managed by Terraform" 

} 

 

resource "snowflake_secret_with_basic_authentication" "github" { 

  count = local.use_token ? 1 : 0 

 

  database = var.database_name 

  schema   = snowflake_schema.integrations.name 

  name     = "GITHUB_SECRET" 

  username = var.github_username 

  password = var.github_token 

  comment  = "Read-only GitHub token for the native Git repository" 

} 

 

resource "snowflake_api_integration_git_repository_token" "github" { 

  name                 = "${var.name_prefix}_GITHUB_API_INTEGRATION" 

  api_allowed_prefixes = [var.github_owner_url] 

  enabled              = true 

  comment              = "GitHub access for ${var.database_name} - managed by Terraform" 

 

  allowed_authentication_secrets    = local.use_token ? [snowflake_secret_with_basic_authentication.github[0].fully_qualified_name] : null 

  no_allowed_authentication_secrets = local.use_token ? null : true 

} 

 

resource "snowflake_git_repository" "this" { 

  database        = var.database_name 

  schema          = snowflake_schema.integrations.name 

  name            = "GITHUB_REPO" 

  origin          = var.github_repository_url 

  api_integration = snowflake_api_integration_git_repository_token.github.name 

  git_credentials = local.use_token ? snowflake_secret_with_basic_authentication.github[0].fully_qualified_name : null 

  comment         = "Clone of ${var.github_repository_url} - managed by Terraform" 

} 
