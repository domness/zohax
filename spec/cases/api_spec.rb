require 'spec_helper'

describe "Zohax::Api" do
  it "should say hello world" do
    api = Zohax::Api.new
    api.test.should == "Hello world!"
  end
end
