  module Azure
  class KeyVaultAuth
    def initialize(tenant_id, client_id, client_secret)
      @tenant_id = tenant_id
      @client_id = client_id
      @client_secret = client_secret
    end
    
    def get_bearer_token
      result = RestClient::Request.execute(method: :post, url: auth_url, payload: auth_body(@client_id, @client_secret), headers: get_headers)
      token_resp = JSON.parse(result)
      "Bearer #{token_resp['access_token']}"
    end
    
    private 
    
    def auth_url
      "https://login.windows.net/#{@tenant_id}/oauth2/token"
    end
    
    def auth_body(client_id, client_secret)
      {"grant_type" => "client_credentials", "client_id" => client_id, "client_secret" => client_secret, "resource" => 'https://vault.azure.net'}
    end
    
    def get_headers
      {"Content-Type" => "application/x-www-form-urlencoded"}
    end
  end
end