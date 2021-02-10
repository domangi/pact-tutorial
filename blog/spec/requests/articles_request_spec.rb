require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles/:id' do
    let(:request) { -> { get "/articles/#{article.id}" } }
    let(:article) { create(:article, title: 'Hello there', user_id: 1) }
    let(:user) { Remote::User.new('John Doe', 'john.doe@example.com') }

    before do
      allow(Remote::User).to receive(:find).with(1).and_return(user)
    end

    it 'returns http success' do
      request.call
      expect(response).to have_http_status(:success)
    end

    it 'returns the expected body' do
      request.call
      parsed_response = JSON.parse response.body
      expect(parsed_response['id']).to eq article.id
      expect(parsed_response['title']).to eq 'Hello there'
      expect(parsed_response['user']['name']).to eq 'John Doe'
      expect(parsed_response['user']['email']).to eq 'john.doe@example.com'
    end
  end
end
