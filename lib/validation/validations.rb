module Validation

  class Validations

    def initialize *validations
      @validations = validations
    end

    def invalid
      @validations.select &:invalid?
    end

  end

end
