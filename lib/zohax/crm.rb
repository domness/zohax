module Zohax
  require 'httparty'
  require 'json'
  require 'xmlsimple'

  class Crm
    include HTTParty

    def initialize(username, password, token)
      @api = Zohax::Api.new(username, password, token)
    end

    def add_lead(data)
      
    end
  end

end
