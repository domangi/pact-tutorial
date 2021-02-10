require 'pact/consumer/rspec'

Pact.service_consumer 'Blog' do
  has_pact_with 'UserProfile' do
    mock_service :user_profile do
      port 1234
    end
  end
end
