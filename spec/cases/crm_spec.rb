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
    @api.stub(:call).with('Leads', 'insertRecords', {:xmlData => an_instance_of(String), :newFormat => 1}, :post).and_return({"Id" => "1234"})
    record_id = @crm.add_lead(data)
    record_id.should_not be_nil
  end

  it "updates a current lead" do
    data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "NewCompany"}
    @api.stub(:call).with("Leads", "updateRecords", { xmlData: an_instance_of(String), newFormat: 1, id: "1234" }, :post).and_return({"Id"=>"1234", "Created Time"=>"2012-08-31 10:42:14", "Modified Time"=>"2012-08-31 10:42:19", "Created By"=>"test", "Modified By"=>"test"} )
    record = @crm.update_lead(data, "1234")
    record["Id"].should == "1234"
  end
end
