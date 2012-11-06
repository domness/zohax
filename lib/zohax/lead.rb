module Zohax

  class Lead
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    def lead_id
      @data["LEADID"]
    end

    def lead_owner
      @data["Lead Owner"]
    end

    def company
      @data["Company"]
    end

    def first_name
      @data["First Name"]
    end

    def last_name
      @data["Last Name"]
    end

    def email
      @data["Email"]
    end

    def phone
      @data["Phone"]
    end

    def fax
      @data["Fax"]
    end

    def mobile
      @data["mobile"]
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end

end
