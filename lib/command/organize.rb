require 'validation'
require 'validators'

class Organize

  attr_reader :title, :description
  attr_reader :date, :time
  attr_reader :location_name, :location_address
  attr_reader :organizer_name, :organizer_email
  attr_reader :errors

  def self.build data
    new \
      data[:title],
      data[:description],
      data[:date],
      data[:time],
      data[:location_name],
      data[:location_address],
      data[:organizer_name],
      data[:organizer_email]
  end

  def initialize title, description, date, time, location_name, location_address, organizer_name, organizer_email
    @title = title
    @description = description
    @date = date
    @time = time
    @location_name = location_name
    @location_address = location_address
    @organizer_name = organizer_name
    @organizer_email = organizer_email

    @errors = Validation::Errors.new
    @validations = Validation::Validations.new \
      Validation::Validation.new( self, :title, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :date, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :date, Validators::DateValidator, "not a valid date" ),
      Validation::Validation.new( self, :time, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :time, Validators::TimeValidator, "not a valid time" ),
      Validation::Validation.new( self, :location_name, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :organizer_name, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :organizer_email, Validators::PresenceValidator, "must be present" ),
      Validation::Validation.new( self, :organizer_email, Validators::EmailValidator, "not a valid email address" )
  end
  
  def validate!
    @errors.clear!
    @validations.invalid.each do |validation|
      @errors.add validation.attribute, validation.message
    end
  end

  def valid?
    validate!
    @errors.empty?
  end

end
