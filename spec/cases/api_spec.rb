require 'spec_helper'

describe "Zohax::Api" do
  before :all do
    @username = "test@terracoding.com"
    @password = "zohotest"
  end

  describe "without auth token" do
    before :all do
      @api = Zohax::Api.new(@username, @password, "4bb51859d4fef47e40261da5b38a0dbb")
    end
    it "should store the auth URL" do
      @api.auth_url.should == "https://accounts.zoho.com/apiauthtoken/nb/create?SCOPE=ZohoCRM/crmapi&EMAIL_ID=test@terracoding.com&PASSWORD=zohotest"
    end

    it "should get the auth token" do
      @api.class.stub_chain(:get, :parsed_response).and_return("\nAUTHTOKEN=0123456789\n")
      @api.get_token
      @api.auth_token.should_not be_nil
    end
  end

  describe "with auth token" do
    before :all do
      @api = Zohax::Api.new(@username, @password, "4bb51859d4fef47e40261da5b38a0dbb")
    end
    describe :json_to_fl_hash do
      it "turns the data into an FL hash" do
        data = { "response" => { "result" => { "Leads" => { "row" => { "FL" => [ {"val" => "foo", "content" => "bar" }]}}}}}
        returned_data = @api.json_to_fl_hash(data)
        returned_data.class.should == Hash
        returned_data.should == { "foo" => "bar" }
      end
    end

    describe :get_record_by_id do
      it "gets a record" do
        record_id = "612278000000056001"
        @api.class.stub_chain(:get, :parsed_response)
        response = { "response" => { "result" => { "Leads" => { "row" => { "FL" => [{ "val" => "foo", "content" => "bar" }] }}}}}
        JSON.stub(:parse).and_return(response)
        record = @api.get_record_by_id(record_id)
        record.class.should == Zohax::Lead
      end
    end
  end


end
