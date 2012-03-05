require 'test_helper'
require 'validators/time_validator'

class TestTimeValidator < MiniTest::Unit::TestCase

  def validator value 
    Validators::TimeValidator.new(value)
  end

  def test_valid_times
    assert_equal true, validator("1:00 PM").valid? 
    assert_equal true, validator("12:59 am").valid?
    assert_equal true, validator("3:33pm").valid?
  end

  def test_invalid_times
    assert_equal true, validator("1").invalid?
    assert_equal true, validator("1:00").invalid?
    assert_equal true, validator("13:00 am").invalid?
    assert_equal true, validator("3:60 pm").invalid?
  end

end
