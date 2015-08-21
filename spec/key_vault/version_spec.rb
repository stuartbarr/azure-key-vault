require 'spec_helper'

describe KeyVault::Version do
  let(:version) { KeyVault::Version::VERSION }
  
  it 'gets the correct version' do 
    expect(version).to eq '0.0.3'
  end
end
