# Notifier

This gem provides a (very) light wrapper around the HipChat gem, to make it easier to send notifications to HipChat rooms from Rails.

## Installation

Add this line to your application's Gemfile:

    gem 'notifier'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notifier

## Usage

Add the following to config/initializers/notifier.rb:

    Notifier.configure do |config|
        config.api_key = "<hipchat-api-key>"
    end

Notify HipChat from within your app:

    Notifier::notify('My Room', 'Notifier', "Hello from Notifier!", :red)
