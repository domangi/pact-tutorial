# PACT Tutorial

This repo contains the code used to investigate how to do api contract testing
using [pact.io](http://pact.io/)

It will contain 2 applications:

- UserProfile - responsible for managing user related data, like name and email
- Blog - responsible for managing articles, which belong to a user

The blog application will access the UserProfile application to get the user
profile data of the article author.
