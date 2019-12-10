require 'rails_helper'

# teste de classe comece com #
# Teste de instancia comece com .

describe Client do
  describe 'description' do
    it 'must return mane and document' do
      client = Client.create(name: 'Roberson Miguel', document: '284.042.408-84', email: 'roberson@milguel.com')
    
      expect(client.description).to eq 'Roberson Miguel - 284.042.408-84'
    end
  end
end
