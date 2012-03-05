module Validators

  class TimeValidator

    PATTERN = /^(\d{1,2}):(\d{2}) ?(am|pm)$/i 

    def initialize value
      @value = value
    end

    def valid? 
      matches? && valid_hour? && valid_minute? && valid_meridian?
    end

    def matches?
      @value =~ PATTERN
    end

    def matches
      @value.match PATTERN
    end

    def parts
      matches.to_a
    end

    def hour
      parts[1]
    end

    def minute
      parts[2]
    end

    def meridian
      parts[3]
    end

    def invalid? 
      !valid? 
    end

    def valid_hour? 
      hour && (1..12).include?(hour.to_i)
    end

    def valid_minute?
      minute && minute.to_i < 60
    end

    def valid_meridian?
      ["AM","am","PM","pm"].include?(meridian)
    end

  end

end
