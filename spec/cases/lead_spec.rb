require 'spec_helper'

describe "Zohax::Lead" do
  it "has a lead ID" do
    lead = Zohax::Lead.new({ "LEADID" => "1234" })
    lead.lead_id.should == "1234"
  end

  it "has a lead owner" do
    lead = Zohax::Lead.new({ "Lead Owner" => "Jane Doe" })
    lead.lead_owner.should == "Jane Doe"
  end

  it "has a company" do
    lead = Zohax::Lead.new({ "Company" => "EI" })
    lead.company.should == "EI"
  end

  it "has a first name" do
    lead = Zohax::Lead.new({ "First Name" => "John" })
    lead.first_name.should == "John"
  end

  it "has a last name" do
    lead = Zohax::Lead.new({ "Last Name" => "Doe" })
    lead.last_name.should == "Doe"
  end

  it "has a full name" do
    lead = Zohax::Lead.new({ "First Name" => "John", "Last Name" => "Doe" })
    lead.full_name.should == "John Doe"
  end
end
