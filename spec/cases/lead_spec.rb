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

  it "can change its lead owner" do
    lead = Zohax::Lead.new
    lead.lead_owner = "Jane Doe"
    lead.lead_owner.should == "Jane Doe"
  end

  it "has a company" do
    lead = Zohax::Lead.new({ "Company" => "EI" })
    lead.company.should == "EI"
  end

  it "can change its company" do
    lead = Zohax::Lead.new
    lead.company = "EI"
    lead.company.should == "EI"
  end

  it "has a website" do
    lead = Zohax::Lead.new({ "Website" => "http://google.com" })
    lead.website.should == "http://google.com"
  end

  it "can change its website" do
    lead = Zohax::Lead.new
    lead.website = "http://google.com"
    lead.website.should == "http://google.com"
  end

  it "has a first name" do
    lead = Zohax::Lead.new({ "First Name" => "John" })
    lead.first_name.should == "John"
  end

  it "can change its first name" do
    lead = Zohax::Lead.new
    lead.first_name = "John"
    lead.first_name.should == "John"
  end

  it "has a last name" do
    lead = Zohax::Lead.new({ "Last Name" => "Doe" })
    lead.last_name.should == "Doe"
  end

  it "can change its last name" do
    lead = Zohax::Lead.new
    lead.last_name = "Doe"
    lead.last_name.should == "Doe"
  end

  it "has a title" do
    lead = Zohax::Lead.new({ "Title" => "Director" })
    lead.title.should == "Director"
  end

  it "can change its title" do
    lead = Zohax::Lead.new
    lead.title = "Director"
    lead.title.should == "Director"
  end

  it "has an email" do
    lead = Zohax::Lead.new({ "Email" => "test@test.com" })
    lead.email.should == "test@test.com"
  end

  it "can change its email" do
    lead = Zohax::Lead.new
    lead.email = "test@test.com"
    lead.email.should == "test@test.com"
  end

  it "has a phone" do
    lead = Zohax::Lead.new({ "Phone" => "1234567" })
    lead.phone.should == "1234567"
  end

  it "can change its phone" do
    lead = Zohax::Lead.new
    lead.phone = "1234567"
    lead.phone.should == "1234567"
  end

  it "has a fax" do
    lead = Zohax::Lead.new({ "Fax" => "1234567" })
    lead.fax.should == "1234567"
  end

  it "can change its fax" do
    lead = Zohax::Lead.new
    lead.fax = "1234567"
    lead.fax.should == "1234567"
  end

  it "has a mobile" do
    lead = Zohax::Lead.new({ "Mobile" => "1234567" })
    lead.mobile.should == "1234567"
  end

  it "can change its mobile" do
    lead = Zohax::Lead.new
    lead.mobile = "1234567"
    lead.mobile.should == "1234567"
  end

  it "has a country" do
    lead = Zohax::Lead.new({ "Country" => "USA" })
    lead.country.should == "USA"
  end

  it "can change its country" do
    lead = Zohax::Lead.new
    lead.country = "USA"
    lead.country.should == "USA"
  end

  it "has a street" do
    lead = Zohax::Lead.new({ "Street" => "123 Easy St" })
    lead.street.should == "123 Easy St"
  end

  it "can change its street" do
    lead = Zohax::Lead.new
    lead.street = "123 Easy St"
    lead.street.should == "123 Easy St"
  end

  it "has a city" do
    lead = Zohax::Lead.new({ "City" => "Atlanta" })
    lead.city.should == "Atlanta"
  end

  it "can change its city" do
    lead = Zohax::Lead.new
    lead.city = "Atlanta"
    lead.city.should == "Atlanta"
  end

  it "has a full name" do
    lead = Zohax::Lead.new({ "First Name" => "John", "Last Name" => "Doe" })
    lead.full_name.should == "John Doe"
  end
end
