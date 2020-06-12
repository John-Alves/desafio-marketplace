require 'rails_helper'

RSpec.describe "API", type: :request do
  context 'Valid URL' do
    before(:each) { @url = 'https://www.fossil.com.br/api/catalog_system/pub/products/search' }

    it 'should return success response' do
      uri = URI(@url)
      response = Net::HTTP.get(uri)

      expect(response).to be_an_instance_of(String)
    end

    it 'should return a Array of products' do
      uri = URI(@url)
      response = Net::HTTP.get(uri)
      expect(JSON.parse(response)).to be_an_instance_of(Array)
    end

    it 'should paginate results' do
      uri = URI("#{@url}?_from=0&_to=9")
      response = Net::HTTP.get(uri)
      expect(JSON.parse(response).size).to be(10)
    end
  end
end
