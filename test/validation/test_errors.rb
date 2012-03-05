require 'test_helper'
require 'validation/errors'

class TestErrors < MiniTest::Unit::TestCase

  def setup
    @errors = Validation::Errors.new
  end

  def test_adding
    refute @errors.any?
    @errors.add :foo, "bar"
    assert @errors.any?
  end

  def test_accessing
    @errors.add :foo, "bar"
    assert_equal @errors[:foo], ["bar"]
  end

  def test_clearing
    @errors.add :foo, "bar"
    @errors.clear!
    assert @errors.empty?
  end

end

