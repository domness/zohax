require "zohax"

@username = "test@terracoding.com"
@password = "zohotest"
@token = "c9515d642d1557bf354f082c23e86a5f"

crm = Zohax::Crm.new(@username, @password, @token)
data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "SomeCompany"}
record_id = crm.add_lead(data)
puts record_id
