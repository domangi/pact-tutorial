# Blog

This application manages blog articles.
Since the only goal of this application is to demonstrate the usage of
contract testing with pact.io, only a show endpoint will be implemented.

An article belongs to a user, but the user data is stored on the user profile
application. In order to show the user name and email, this application makes
a rest call to the user profile application.

# Create and publish Contract using Pact

This application relies on one contract with the user profile application to
retrieve the data related to a post author.

The contract is specified in a spec file, which is also used to stub the rest
call which would be made to the external service

```
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
```

After running your specs, a contract json will be automatically generated, based
on your spec, and it will be stored in `spec/pacts`

## Publishing the contract to a pact broker

At this point you want to publish the new contract to a pact broker, so that the
provider can use it to verify that his API complies to it. In this example I am
using pactflow.io as a pact broker, but you could also run your own, or using the
contract json directly as a file from the provider.

If you want to use pactflow as a broker you will first have to signup on pactflow.io
to get generate your bearer token, which you need to set in .env, together with
the broker base url.

To publish the contract run

```
bundle exec rails pact:publish
```
