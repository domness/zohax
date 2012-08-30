require 'spec_helper'

describe "Zohax::Lead" do
  before :all do

  end

  it "has a full name" do
    lead = Zohax::Lead.new("")
    lead.first_name = "John"
    lead.last_name = "Doe"
    lead.full_name.should == "John Doe"
  end
end
