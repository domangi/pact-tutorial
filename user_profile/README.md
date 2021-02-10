# User Profile

This application manages user profiles.
Since the only goal of this application is to demonstrate the usage of
contract testing with pact.io, only a show endpoint will be implemented.

# Verify contract using pact

This application should compy to a contract with the blog application, for
providing user data. To verify that a change does not break the contract run.
You could link the contract directly as a file if you have it on your local machine.
In my example I used pactflow as a remote pact broker.
If you want to do the same you need to set your pactflow bearer token in .env

```
bundle exec rails pact:verify
```
