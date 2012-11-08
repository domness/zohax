require 'spec_helper'

describe "Zohax::Lead" do
  it "has a lead ID" do
    lead = Zohax::Lead.new({ "LEADID" => "1234" })
    lead.lead_id.should == "1234"
  end

  it "has a lead owner" do
    test_has_a("Lead Owner", "lead_owner")
  end

  it "can change its lead owner" do
    lead = Zohax::Lead.new
    lead.lead_owner = "Jane Doe"
    lead.lead_owner.should == "Jane Doe"
  end

  it "has a company" do
    test_has_a("Company", "company")
  end

  it "can change its company" do
    lead = Zohax::Lead.new
    lead.company = "EI"
    lead.company.should == "EI"
  end

  it "has a website" do
    test_has_a("Website", "website")
  end

  it "can change its website" do
    lead = Zohax::Lead.new
    lead.website = "http://google.com"
    lead.website.should == "http://google.com"
  end

  it "has a first name" do
    test_has_a("First Name", "first_name")
  end

  it "can change its first name" do
    lead = Zohax::Lead.new
    lead.first_name = "John"
    lead.first_name.should == "John"
  end

  it "has a last name" do
    test_has_a("Last Name", "last_name")
  end

  it "can change its last name" do
    lead = Zohax::Lead.new
    lead.last_name = "Doe"
    lead.last_name.should == "Doe"
  end

  it "has a title" do
    test_has_a("Title", "title")
  end

  it "can change its title" do
    lead = Zohax::Lead.new
    lead.title = "Director"
    lead.title.should == "Director"
  end

  it "has an email" do
    test_has_a("Email", "email")
  end

  it "can change its email" do
    lead = Zohax::Lead.new
    lead.email = "test@test.com"
    lead.email.should == "test@test.com"
  end

  it "has a phone" do
    test_has_a("Phone", "phone")
  end

  it "can change its phone" do
    lead = Zohax::Lead.new
    lead.phone = "1234567"
    lead.phone.should == "1234567"
  end

  it "has a fax" do
    test_has_a("Fax", "fax")
  end

  it "can change its fax" do
    lead = Zohax::Lead.new
    lead.fax = "1234567"
    lead.fax.should == "1234567"
  end

  it "has a mobile" do
    test_has_a("Mobile", "mobile")
  end

  it "can change its mobile" do
    lead = Zohax::Lead.new
    lead.mobile = "1234567"
    lead.mobile.should == "1234567"
  end

  it "has a country" do
    test_has_a("Country", "country")
  end

  it "can change its country" do
    lead = Zohax::Lead.new
    lead.country = "USA"
    lead.country.should == "USA"
  end

  it "has a street" do
    test_has_a("Street", "street")
  end

  it "can change its street" do
    lead = Zohax::Lead.new
    lead.street = "123 Easy St"
    lead.street.should == "123 Easy St"
  end

  it "has a city" do
    test_has_a("City", "city")
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

  private

  def test_has_a(xml_name, field)
    lead = Zohax::Lead.new({ xml_name => "Booyan" })
    lead.send(field).should == "Booyan"
  end
end
