require 'test_helper'
require 'validators/email_validator'

class TestEmailValidator < MiniTest::Unit::TestCase

  def validator value
    Validators::EmailValidator.new value
  end

  def test_valid_emails
    assert_equal true, validator("john.doe@example.net").valid?
    assert_equal true, validator("john.doe-foo@example.n").valid?
    assert_equal true, validator("JohnDoe@example.something").valid?
  end

  def test_invalid_emails
    assert_equal true, validator("john.doe").invalid?
    assert_equal true, validator("john doe@example.net").invalid?
  end
end

