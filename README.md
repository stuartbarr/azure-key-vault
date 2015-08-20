# azure-key-vault
Ruby wrapper for Azure Key Vault REST API

## Examples

### Get an access token
`bearer_token = Azure::KeyVaultAuth.new(<tenant id>, <client id>, <client secret>).get_bearer_token`

### Get an existing key vault

`vault = Azure::KeyVault.new(<vault name>, <api version>, bearer_token)`

### Get the most recent version of a secret

`vault.get_secret(<secret name>)`

### Get a specific version of a secret

`vault.get_secret(<secret name>, <secret version>)`
