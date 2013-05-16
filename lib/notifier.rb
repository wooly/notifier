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
      notify(green)
    end

    def error(message)
      notify(red)
    end

    def debug(message)
      notify(yellow)
    end

    def notify(color)
      unless configured and env_ok
        # Notifier.warn "No API key configured, couldn't notify"
        return
      end

      client = HipChat::Client.new(configuration.api_key)
      client[room].send(@configuration.room_name, @configuration.user_name, message, :color => color)
    end
    
    def configuration
      @configuration ||= Notifier::Configuration.new
    end

    def configured
      unless @configuration.api_key.nil? || @configuration.room_name.nil? || @configuration.user_name.nil?
    end

    def env_ok
      return @configuration.environments.include? Rails.env.to_sym
    end
  end
end
