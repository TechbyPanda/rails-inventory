# Gems

## what is gems in ruby on rails?
RubyGems (commonly known as gems) are pre-packaged libraries or programs written in Ruby that extend the functionality of a Ruby on Rails application. Instead of writing complex features from scratch—such as user authentication, payment processing, or file uploading—you can install a gem to handle it instantly.

## How Gems Works
- The Repository: Gems are hosted on a centralized, open-source repository called RubyGems.org.
- The Gemfile: In a Rails project, all the gems your application needs are listed in a file named Gemfile located in the root directory.
- The Bundler: Rails uses a tool called Bundler to read your Gemfile, automatically download the correct versions of those gems, and manage their dependencies so they don't conflict with each other.

## Basic commands
- gem install [gem_name]: Installs a specific gem globally on your machine.
- bundle install: Reads your project's Gemfile and installs all listed gems simultaneously.