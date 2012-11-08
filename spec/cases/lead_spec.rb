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
    can_change_its("lead_owner")
  end

  it "has a company" do
    test_has_a("Company", "company")
  end

  it "can change its company" do
    can_change_its("company")
  end

  it "has a website" do
    test_has_a("Website", "website")
  end

  it "can change its website" do
    can_change_its("website")
  end

  it "has a first name" do
    test_has_a("First Name", "first_name")
  end

  it "can change its first name" do
    can_change_its("first_name")
  end

  it "has a last name" do
    test_has_a("Last Name", "last_name")
  end

  it "can change its last name" do
    can_change_its("last_name")
  end

  it "has a title" do
    test_has_a("Title", "title")
  end

  it "can change its title" do
    can_change_its("title")
  end

  it "has an email" do
    test_has_a("Email", "email")
  end

  it "can change its email" do
    can_change_its("email")
  end

  it "has a phone" do
    test_has_a("Phone", "phone")
  end

  it "can change its phone" do
    can_change_its("phone")
  end

  it "has a fax" do
    test_has_a("Fax", "fax")
  end

  it "can change its fax" do
    can_change_its("fax")
  end

  it "has a mobile" do
    test_has_a("Mobile", "mobile")
  end

  it "can change its mobile" do
    can_change_its("mobile")
  end

  it "has a country" do
    test_has_a("Country", "country")
  end

  it "can change its country" do
    can_change_its("country")
  end

  it "has a street" do
    test_has_a("Street", "street")
  end

  it "can change its street" do
    can_change_its("street")
  end

  it "has a city" do
    test_has_a("City", "city")
  end

  it "can change its city" do
    can_change_its("city")
  end

  it "has a state" do
    test_has_a("State", "state")
  end

  it "can change its state" do
    can_change_its("state")
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

  def can_change_its(field)
    lead = Zohax::Lead.new
    lead.send(field + "=", "Booyan")
    lead.send(field).should == "Booyan"
  end
end
