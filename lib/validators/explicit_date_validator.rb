require 'date'

module Validators

  class ExplicitDateValidator

    PATTERN = /^([a-z]+) +(\d{1,2})(?:st|nd|rd|th)?,? +(\d{4})$/i

    def initialize value
      @value = value
    end

    def invalid?
      !valid?
    end

    def valid?
      matches? && valid_date?
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

    def month
      parts[1]
    end

    def day
      parts[2]
    end

    def year
      parts[3]
    end

    def parsed
      "#{month} #{day}, #{year}"
    end

    def date
      begin
        Date.strptime parsed, "%B %d, %y" 
      rescue ArgumentError => e
        raise e unless e.message == "invalid date"
        nil
      end
    end

    def valid_date?
      date.is_a? Date
    end

  end

end
