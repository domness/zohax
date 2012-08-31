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
      xmlData = parse_data(data, 'Leads')
      record = @api.call('Leads', 'insertRecords', {:xmlData => xmlData, :newFormat => 1}, :post)
      record['Id']
    end

    private

    def parse_data(data, entry)
      fl = data.map {|e| Hash['val', e[0], 'content', e[1]]}
      row = Hash['no', '1', 'FL', fl]
      data = Hash['row', row]
      XmlSimple.xml_out(data, :RootName => entry)    
    end
  end

end
