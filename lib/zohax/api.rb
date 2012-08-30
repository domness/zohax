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
      ticket_info = self.class.get(auth_url).parsed_response 
      @auth_token = ticket_info.match(/\sAUTHTOKEN=(.*)\s/)[1]
    end

  end

end
