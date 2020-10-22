# [Viewing Party](https://viewing-party13.herokuapp.com/)

Viewing party is the app that lets users explore movies and create viewing party events with their friends!

### CI & Deployment

Builds are run by [Travis CI](https://travis-ci.org/)

Deployment is handled by Heroku and can be accessed here: [Viewing Party](https://viewing-party13.herokuapp.com/)

You can create an account OR use this already made account with friends and parties:

`username: user`
`password: password`

## About Viewing Party
Viewing party is a web application that allows the user to discover movies and create movie parties to watch with friends. Users can register with their names, email, username, and password. Returning users can also log in using their credentials. Once the returning users are authenticated, they have access to all the features. All movie data was obtained by [The Movie Database API](https://developers.themoviedb.org/3/getting-started/introduction)

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Install the Figaro gem: `bundle exec figaro install`
5. Acquire an API KEY from [The Movie Database](https://developers.themoviedb.org/3/getting-started/introduction) and add the following to the config/application.yml file: `TMDB_API_KEY: <YOUR API KEY>`



## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

## Testing

RSpec, Capybara, Shoulda-matchers, FactoryBot, Webmock, and VCR were used for testing.
