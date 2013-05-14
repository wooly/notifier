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
  
    def notify(room, username, message, color = nil)

      if @configuration.api_key.nil?
        # Notifier.warn "No API key configured, couldn't notify"
        return
      end
      
      client = HipChat::Client.new(configuration.api_key)
      client[room].send(username, message, :color => color)
    end
    
    def configuration
      @configuration ||= Notifier::Configuration.new
    end
  end
end
