require 'test_helper'
require 'validators/numeric_date_validator'

class TestNumericDateValidator < MiniTest::Unit::TestCase

  def validator value
    Validators::NumericDateValidator.new value
  end

  def test_valid_dates
    assert validator("1-1-2011").valid?
  end

end

