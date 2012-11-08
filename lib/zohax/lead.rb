module Zohax

  class Lead
    attr_accessor :data

    def initialize(*data)
      if data.size == 0
        @data = {}
      else
        @data = data[0]
      end
    end

    def lead_id
      @data["LEADID"]
    end

    def lead_owner
      @data["Lead Owner"]
    end

    def lead_owner=(str)
      @data["Lead Owner"] = str
    end

    def company
      @data["Company"]
    end

    def company=(str)
      @data["Company"] = str
    end

    def website
      @data["Website"]
    end

    def website=(str)
      @data["Website"] = str
    end

    def first_name
      @data["First Name"]
    end

    def first_name=(str)
      @data["First Name"] = str
    end

    def last_name
      @data["Last Name"]
    end

    def last_name=(str)
      @data["Last Name"] = str
    end

    def title
      @data["Title"]
    end

    def title=(str)
      @data["Title"] = str
    end

    def email
      @data["Email"]
    end

    def email=(str)
      @data["Email"] = str
    end

    def phone
      @data["Phone"]
    end

    def phone=(str)
      @data["Phone"] = str
    end

    def fax
      @data["Fax"]
    end

    def fax=(str)
      @data["Fax"] = str
    end

    def mobile
      @data["Mobile"]
    end

    def mobile=(str)
      @data["Mobile"] = str
    end

    def country
      @data["Country"]
    end

    def country=(str)
      @data["Country"] = str
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end

end
