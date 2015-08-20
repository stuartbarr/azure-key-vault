require 'spec_helper'

describe Azure::KeyVaultUrl do
  let(:key_vault_url) { Azure::KeyVaultUrl.new('the_bearer_token', 'the_vault_name') }
  let(:correct_url) {'https://the_vault_name.vault.azure.net/secrets/the_secret_name/1234-1234-1234-1234?api-version=2015-08-20'}
  let(:correct_body) {{ "value" => 'the_secret_value'}.to_json}
  
  it 'gets the correct url' do 
    expect(key_vault_url.get_url('the_secret_name', '1234-1234-1234-1234', '2015-08-20')).to eq correct_url
  end
  
  it 'gets the correct body' do
    expect(key_vault_url.get_body('the_secret_value')).to eq correct_body    
  end
end
