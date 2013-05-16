$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'hipchat'
require 'notifier'
require 'rails'
require 'rspec'
require 'rspec/autorun'
