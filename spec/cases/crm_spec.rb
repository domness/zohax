require 'spec_helper'

describe "Zohax::Crm" do

  before :each do
    @username = "test@terracoding.com"
    @password = "zohotest"
    @crm = Zohax::Crm.new(@username, @password, "4bb51859d4fef47e40261da5b38a0dbb")
  end

  it "adds a new lead" do
    data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "SomeCompany"}
    record_id = @crm.add_lead(data)
    record_id.should_not be_nil
  end

end
