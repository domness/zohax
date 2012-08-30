require 'spec_helper'

describe "Zohax::Crm" do

  it "should" do
    @username = "test@terracoding.com"
    @password = "zohotest"
    @api = Zohax::Api.new(@username, @password, "4bb51859d4fef47e40261da5b38a0dbb")
  end

end
