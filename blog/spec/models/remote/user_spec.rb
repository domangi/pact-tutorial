require 'rails_helper'
require 'support/service_providers/user_profile_provider_helper'

RSpec.describe Remote::User, pact: true do
  describe 'find' do
    subject { Remote::User.find(100) }

    let(:response_body) do
      {
        'name': 'John Doe',
        'email': 'john.DOE@example.com'
      }
    end

    before do
      user_profile.given('a user with id 100 exists')
                  .upon_receiving('a request for user 100')
                  .with(method: :get, path: '/users/100', query: '')
                  .will_respond_with(
                    status: 200,
                    headers: { 'Content-Type' => 'application/json; charset=utf-8' },
                    body: response_body
                  )
    end

    it { is_expected.to be_kind_of Remote::User }
    its(:name) { is_expected.to eq('john doe') }
    its(:email) { is_expected.to eq('john.doe@example.com') }
  end
end
