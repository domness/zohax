Gem::Specification.new do |s|
  s.name = 'zohax'
  s.version = '0.0.2'
  s.date = '2012-08-30'
  s.summary = "Zoho Ruby Gem"
  s.description = "Zoho ruby gem allowing to make changes to a Zoho CRM."
  s.authors = ["Dominic Wroblewski"]
  s.email = "domness@gmail.com"
  s.files = ["lib/zohax.rb"]
  s.homepage = "https://github.com/domness/zohax"
  s.add_dependency('json')
  s.add_dependency('httparty')
  s.add_dependency('xml-simple')
end
