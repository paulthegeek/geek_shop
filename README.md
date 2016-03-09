[![Circle
CI](https://circleci.com/gh/paulthegeek/geek_shop.svg?style=svg&circle-token=9b905c17e10dd7dfc993e5f3149037317e66471e)](https://circleci.com/gh/paulthegeek/geek_shop)

# Geek shop
The Geek Shop is playground online store for me to play with and learn.

## Features and Technology

- [x] Clearance gem for authentication
- [ ] Stripe for the payment system
- [ ] Importing products via CSV that runs on a background job

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local
