require 'test_helper'
require 'validators/time_validator'

class TestTimeValidator < MiniTest::Unit::TestCase

  def validator value 
    Validators::TimeValidator.new(value)
  end

  def test_valid_times
    assert validator("1:00 PM").valid? 
    assert validator("12:59 am").valid?
    assert validator("3:33pm").valid?
  end

  def test_invalid_times
    assert validator("1").invalid?
    assert validator("1:00").invalid?
    assert validator("13:00 am").invalid?
    assert validator("3:60 pm").invalid?
  end

end
