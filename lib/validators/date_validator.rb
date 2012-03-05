require 'validators/explicit_date_validator'
require 'validators/numeric_date_validator'

module Validators

  class DateValidator

    def initialize value
      @value = value
    end

    def invalid?
      !valid?
    end

    def valid?
      Validators::ExplicitDateValidator.new(@value).valid? || Validators::NumericDateValidator.new(@value).valid?
    end

  end

end
