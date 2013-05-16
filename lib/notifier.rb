require "hipchat"

require "notifier/version"
require "notifier/configuration"

module Notifier
  class << self
    def configure(config_hash=nil)
      if config_hash
        config_hash.each do |k,v|
          configuration.send("#{k}=", v) rescue nil if configuration.respond_to?("#{k}=")
        end
      end

      yield(configuration) if block_given?
    end

    def success(message)
      notify(message, "green")
    end

    def error(message)
      notify(message, "red")
    end

    def debug(message)
      notify(message, "yellow")
    end

    def notify(message, color)
      unless configured and env_ok
        # Notifier.warn "No API key configured, couldn't notify"
        return false
      end

      client = HipChat::Client.new(configuration.api_key)
      client[@configuration.room_name].send(@configuration.user_name, message, :color => color)
    end
    
    def configuration
      @configuration ||= Notifier::Configuration.new
    end

    def configured
      not (@configuration.api_key.nil? || @configuration.room_name.nil? || @configuration.user_name.nil?)
    end

    def env_ok
      return @configuration.environments.include? Rails.env.to_sym
    end
  end
end
