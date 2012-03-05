module Validation

  class Validation

    attr_reader :message
    attr_reader :attribute

    def initialize object, attribute, validator, message
      @object = object
      @attribute = attribute
      @validator = validator
      @message = message
    end

    def value
      @object.send attribute
    end

    def validator
      @validator.new value
    end
    
    def invalid?
      !valid?
    end

    def valid?
      validator.valid?
    end

  end

end
