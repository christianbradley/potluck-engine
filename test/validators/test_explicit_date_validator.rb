require 'test_helper'
require 'validators/explicit_date_validator'

class TestExplicitDateValidator < MiniTest::Unit::TestCase

  def validator value
    Validators::ExplicitDateValidator.new value
  end

  def test_valid_dates
    assert validator("March 30th 1950").valid?
    assert validator("Jan 1st, 2012").valid?
    assert validator("Sep 2, 2000").valid?
  end

  def test_invalid_dates
    assert validator("1/2/3").invalid?
    assert validator("Jonuary 2 2012").invalid?
    assert validator("Jan 32nd 2012").invalid?
  end

end
