require 'pact_broker/client/tasks'

PactBroker::Client::PublicationTask.new do |task|
  task.consumer_version = '0.0.0'.freeze
  task.pattern = 'spec/pacts/*.json' # optional, default value is 'spec/pacts/*.json'
  task.pact_broker_base_url = ENV['PACT_BROKER_BASE_URL'] 
  task.tag_with_git_branch = false # Optional but STRONGLY RECOMMENDED as it will greatly assist with your pact workflow. Result will be merged with other specified task.tags
  task.tags = ['dev'] # optional
  task.pact_broker_token = ENV['PACT_BROKER_TOKEN'] # Bearer token
  task.write_method = :merge # optional, this will merge the published pact into an existing pact rather than overwriting it if one exists. Not recommended, as it makes a mulch of the workflow on the broker.
end
