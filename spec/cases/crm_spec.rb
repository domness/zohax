require 'spec_helper'

describe "Zohax::Crm" do

  before :each do
    @username = "test@terracoding.com"
    @password = "zohotest"
    @api = Zohax::Api.new(@username, @password, "c9515d642d1557bf354f082c23e86a5f")
    Zohax::Api.stub(:new).and_return(@api)
    @crm = Zohax::Crm.new(@username, @password, "c9515d642d1557bf354f082c23e86a5f")
  end

  it "adds a new lead" do
    data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "SomeCompany"}
    @api.stub(:call).and_return({"Id" => "1234"})
    record_id = @crm.add_lead(data)
    record_id.should_not be_nil
  end

end
