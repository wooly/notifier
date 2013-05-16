require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'Notifier' do
  before :each do
    HipChat::Room.any_instance.stub(:send).and_return(true)
  end

  it "fails when configuration params aren't set" do
    Notifier.stub(:env_ok).and_return(true)

    Notifier::configure do |config|
      config.api_key = "1234"
    end
    Notifier::success("Test").should be_false

    Notifier.configuration.room_name = "Test room"
    Notifier::success("Test").should be_false

    Notifier.configuration.user_name = "Test user"
    Notifier::success("Test").should be_true
  end

  it "correctly scopes to environment" do
    Notifier::configure do |config|
      config.api_key = "1234"
      config.room_name = "Test name"
      config.user_name = "User name"
      config.environments = [:production]
    end

    Rails.stub(env: ActiveSupport::StringInquirer.new("production"))
    Notifier::success("Test").should be_true
    
    Rails.stub(env: ActiveSupport::StringInquirer.new("test"))
    Notifier::success("Test").should be_false
  end
end