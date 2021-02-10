require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    let(:request) { -> { get "/users/#{user.id}" } }
    let(:user) do
      create(:user, name: 'Bruce Lee', email: 'bruce.lee@example.com')
    end

    it 'returns http success' do
      request.call
      expect(response).to have_http_status(:success)
    end

    it 'returns the expected values' do
      request.call

      parsed_response = JSON.parse response.body
      expect(parsed_response['name']).to eq 'Bruce Lee'
    end
  end
end
