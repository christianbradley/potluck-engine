require 'test_helper'
require 'validators/presence_validator'

class TestPresenceValidator < MiniTest::Unit::TestCase

  def validator value
    Validators::PresenceValidator.new value
  end

  def test_valid_values
    assert validator("Foo").valid?
    assert validator("\nFoo Bar").valid?
  end

  def test_invalid_values
    assert validator("").invalid?
    assert validator("\n").invalid?
    assert validator(" \n  ").invalid?
  end

end
