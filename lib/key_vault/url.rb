module KeyVault
  class Url
    def initialize(bearer_token, vault_name)
      @bearer_token = bearer_token
      @vault_name = vault_name
    end
    
    def get_url(secret_name, version, api_version)
      base_url = base_secret_url % {:secret_name => secret_name}
      if (version)
        base_url << "/#{version}"
      end
      base_url << get_api_version_string(api_version)
    end
      
    def get_body(secret_value)
      { "value" => secret_value}.to_json
    end
    
    private
     
    def base_secret_url
      "https://#{@vault_name}.vault.azure.net/secrets/%{secret_name}"
    end
    
    def get_api_version_string(api_version)
      "?api-version=#{api_version}"
    end
  end
end