module Validation

  class Errors

    def initialize
      @messages = {}
    end

    def add key, message
      @messages[key] ||= []
      @messages[key] << message
    end

    def [] key
      @messages[key]
    end

    def clear!
      @messages = {}
    end

    def empty?
      !any?
    end

    def any?
      @messages.any?
    end

    def messages
      @messages.dup
    end

  end

end
