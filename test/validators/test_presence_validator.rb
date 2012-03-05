require 'test_helper'
require 'validators/presence_validator'

class TestPresenceValidator < MiniTest::Unit::TestCase

  def validator value
    Validators::PresenceValidator.new value
  end

  def test_valid_values
    assert_equal true, validator("Foo").valid?
    assert_equal true, validator("\nFoo Bar").valid?
  end

  def test_invalid_values
    assert_equal true, validator("").invalid?
    assert_equal true, validator("\n").invalid?
    assert_equal true, validator(" \n  ").invalid?
  end

end
