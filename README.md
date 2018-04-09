# Week 4: Bookmark Manager

### Day 1: Jihin and Shih Han

#### Create user stories and domain model.

First user story:

- As a user, I would like to be able to see a list of bookmarks.
  So I can make a decision on which bookmark to click on.

  Objects | Messages
  -----------|-----------
  Person |
  Bookmark Manager | list bookmarks

#### Setting up a web project

In a new git repo, run `bundle init` to create a new Gemfile. Inside the Gemfile, we entered a bunch of core gems that we usually use on top of Capybara, Rspec and Sinatra.
`bundle install` will install the gems.
`rspec --init` creates the base RSpec files.
We filled in the spec_helper file with the relevant `require`s.
We created a `config.ru` file and required our `app.rb`, as well as running the the app.
We created a `.gitignore` to ignore the coverage data.
We created a `app.rb` file and created app class.
We created `bookmark_spec.rb` for `all` method, and implemented into `bookmark.rb`.
We fixed the `spec_helper.rb`, because it couldn't reach the `app.rb` file.
