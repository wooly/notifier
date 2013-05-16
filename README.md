# Notifier

This gem provides a (very) light wrapper around the HipChat gem, to make it easier to send notifications to HipChat rooms from Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'notifier'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install notifier
```

## Usage

Add the following to config/initializers/notifier.rb:

```ruby
Notifier.configure do |config|
    config.api_key = "<hipchat-api-key>"
    config.room_name = "My Room"
    config.user_name = "RoomBot"
    config.environments = [:production]
end
```

Notify HipChat from within your app:

```ruby
Notifier::success("This is a success message!")
Notifier::warning("This is a warning message!")
Notifier::success("This is an error message!")
```
