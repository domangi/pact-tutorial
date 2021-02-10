require_relative 'provider_state_for_blog'
require 'pact/provider/rspec'

Pact.service_provider 'User Profile' do
  honours_pact_with 'Blog' do
    pact_uri 'https://domangi.pactflow.io/pacts/provider/UserProfile/consumer/Blog/version/0.0.0', token: ENV['PACT_BROKER_TOKEN']
  end
end
