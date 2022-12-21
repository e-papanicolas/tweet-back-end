# TweetStream

This app was created to be able to stream tweets in real time using Twitter's Streaming API endpoint instead of a REST API. Users can log in and create a profile. Users are able to upload a profile picture which uses Active Storage to attach and Cloudinary to store the images. Images are not stored in the PostgreSQL database.

This app uses the Figaro gem to hide API keys with a config/master.key file and a config/application.yml which are both added to .gitignore. The Cloudinary API keys are stored similarly in a config/cloudinary.yml file which is also hidden. If you wanted to try out the app you will need to sign up for [Twitter Developer Credentials](https://developer.twitter.com/en/apply-for-access) and then create those files on your own.

To run this app, after starting the PostgreSQL server, run `bundle install`, `rails db:create`, `rails db:migrate`, and `rails s`.

## Teachnologies/Features

- Ruby/Ruby on Rails as an API
- PostgreSQL database
- Active Storage for uploading image attachments
- Action Cable web sockets
- JWT/BCrypt for Auth
- Twitter Streaming API

Watch a demo of this project [on youtube](https://www.youtube.com/watch?v=urTOZf8Z2A4)

Take a look at the [front end here](https://github.com/e-papanicolas/tweet-front-end).
