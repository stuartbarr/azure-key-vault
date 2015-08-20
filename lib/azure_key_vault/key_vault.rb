module Azure
  class KeyVault
    def initialize(vault_name, api_version, bearer_token)
      @vault_name = vault_name
      @api_version = api_version || KeyVaultApiVersion::DEFAULT_API_VERSION
      @bearer_token = bearer_token
      @vault_url = KeyVaultUrl.new(@bearer_token, @vault_name)
    end
    
    def get_secret(secret_name, secret_version, api_version = @api_version)
      response = RestClient.get(@vault_url.get_url(secret_name, secret_version, api_version), {:Authorization => @bearer_token})
      JSON.parse(response)['value']
    end
      
    def create_secret(secret_name, secret_value)
      RestClient.put(get_url(secret_name), :headers => get_headers, :body => @vault_url.get_body(secret_value))
    end
  end
end
