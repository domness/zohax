module Zohax
  require 'httparty'
  require 'json'

  class Api
    include HTTParty

    attr_reader :auth_token

    def initialize(username, password)
      @username = username
      @password = password
    end

    def auth_url
      "https://accounts.zoho.com/apiauthtoken/nb/create?SCOPE=ZohoCRM/crmapi&EMAIL_ID=#{@username}&PASSWORD=#{@password}"
    end

    def get_token
      response = self.class.get(auth_url).parsed_response
      @auth_token = response.match(/\sAUTHTOKEN=(.*)\s/)[1] if response.match(/\sAUTHTOKEN=(.*)\s/)
    end

    def json_to_fl_hash(response)
      fl = response["response"]["result"]["Leads"]["row"]["FL"]
      data = {}
      fl.each { |column| data["#{column["val"].to_s}"] = column["content"] }
      return data
    end

    def get_record_by_id(record_id)
      url = "https://crm.zoho.com/crm/private/json/Leads/getRecordById?&authtoken=4bb51859d4fef47e40261da5b38a0dbb&scope=crmapi&id=612278000000056001"
      response =  JSON.parse(self.class.get(url).parsed_response)
      lead = json_to_fl_hash(response)
      return Zohax::Lead.new(lead)
    end

  end

end
