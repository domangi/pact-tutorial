# Blog

This application manages blog articles.
Since the only goal of this application is to demonstrate the usage of
contract testing with pact.io, only a show endpoint will be implemented.

An article belongs to a user, but the user data is stored on the user profile
application. In order to show the user name and email, this application makes
a rest call to the user profile application.
