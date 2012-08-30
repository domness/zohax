module Zohax

  class Lead
    attr_accessor :first_name, :last_name, :data

    def initialize(data)
      @data = data
    end

    def full_name
      "#{@first_name} #{@last_name}"
    end

  end

end
