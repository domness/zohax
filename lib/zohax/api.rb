module Zohax
  require 'httparty'
  require 'json'

  class AuthenticationFailedError < StandardError; end

  class Api
    include HTTParty

    attr_reader :auth_token

    def initialize(username, password, auth_token = nil)
      @username = username
      @password = password
      @auth_token = auth_token

      # If we aren't provided an auth_token then we should attempt
      # to authenticate.
      if auth_token.nil?
        self.get_token
      end
    end

    def auth_url
      "https://accounts.zoho.com/apiauthtoken/nb/create?SCOPE=ZohoCRM/crmapi&EMAIL_ID=#{@username}&PASSWORD=#{@password}"
    end

    def get_token
      response = self.class.get(auth_url).parsed_response

      if response.match(/\sAUTHTOKEN=(.*)\s/)
        @auth_token = response.match(/\sAUTHTOKEN=(.*)\s/)[1]
      else
        error = response.match(/\sCAUSE=(.*)\s/)[1]
        raise Zohax::AuthenticationFailedError.new(error)
      end
    end

    def json_to_fl_hash(response)
      fl = response["response"]["result"]["Leads"]["row"]["FL"]
      data = {}
      fl.each { |column| data["#{column["val"].to_s}"] = column["content"] }
      return data
    end

    def get_record_by_id(record_id)
      url = "https://crm.zoho.com/crm/private/json/Leads/getRecordById?&authtoken=#{@auth_token}&scope=crmapi&id=#{record_id}"
      response = JSON.parse(self.class.get(url).parsed_response)
      lead = json_to_fl_hash(response)
      return Zohax::Lead.new(lead)
    end

    def get_request(url)
      response = JSON.parse(self.class.get(url).parsed_response)
    end

    def zoho_uri
      zoho_uri = "https://crm.zoho.com/crm/private/json"
    end

    def call(entry, api_method, query = {}, http_method = :get)
      login = {
        :authtoken => @auth_token,
        :scope => "crmapi"
      }
      query.merge!(login)
      url = [zoho_uri, entry, api_method].join('/')
      case http_method
      when :get
        raw = JSON.parse(self.class.get(url, :query => query).parsed_response)
        parse_raw_get(raw, entry)
      when :post
        raw = JSON.parse(self.class.post(url, :body => query).parsed_response)
        parse_raw_post(raw)
      else
        raise "#{http_method} is not a recognized http method"
      end
    end

    private

    def parse_raw_get(raw, entry)
      return [] if raw['response']['result'].nil?
      rows = raw['response']['result'][entry]['row'] 
      rows = [rows] unless rows.class == Array
      rows.map {|i|
        raw_to_hash i['FL']
      }
    end

    def raw_to_hash(raw)
      raw.map! {|r| [r['val'], r['content']]}
      Hash[raw]
    end
    
    def parse_raw_post(raw)
      return [] if raw['response']['result'].nil?
      record = raw['response']['result']['recorddetail'] 
      raw_to_hash record['FL']
    end

    def parse_data(data, entry)
      fl = data.map {|e| Hash['val', e[0], 'content', e[1]]}
      row = Hash['no', '1', 'FL', fl]
      data = Hash['row', row]
      XmlSimple.xml_out(data, :RootName => entry)
    end
  end

end
