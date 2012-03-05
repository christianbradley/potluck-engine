module Validators

  class PresenceValidator

    def initialize value
      @value = value
    end

    def invalid?
      @value.nil? || @value.strip == '' 
    end

    def valid?
      !invalid?
    end

  end

end
