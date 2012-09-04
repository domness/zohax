require "zohax"

@username = "test@terracoding.com"
@password = "zohotest"
@token = "c9515d642d1557bf354f082c23e86a5f"

crm = Zohax::Crm.new(@username, @password, @token)
data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "Some Company"}
record_id = crm.add_lead(data)
# record_id = "661735000000055001"
data = { "First Name" => "John", "Last Name" => "Doe", "Company" => "New Company"}
crm.update_lead(data, record_id)

puts record_id
