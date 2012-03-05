require 'test_helper'
require 'command/organize'

class TestOrganize < MiniTest::Unit::TestCase

  def build overrides = {}
    Organize.build command_data(overrides)
  end

  def command_data overrides = {}
    { :title => "My Potluck",
      :description => "A potluck at my place for friends and family",
      :date => "March 1st, 2012",
      :time => "2:00 PM",
      :location_name => "My House",
      :location_address => "123 Foo Ave. Bar, BAZ 54321",
      :organizer_name => "John Doe",
      :organizer_email => "john.doe@example.net" 
    }.merge overrides
  end

  def test_building
    overrides = { :organizer_name => "Jack Black", :time => "3:00 PM" }
    command = build overrides

    assert_equal command.title, "My Potluck"
    assert_equal command.description, "A potluck at my place for friends and family"
    assert_equal command.date, "March 1st, 2012"
    assert_equal command.time, "3:00 PM"
    assert_equal command.location_name, "My House"
    assert_equal command.location_address, "123 Foo Ave. Bar, BAZ 54321"
    assert_equal command.organizer_name, "Jack Black"
    assert_equal command.organizer_email, "john.doe@example.net"
  end

  def test_validation
    command = build

    command.validate!
    assert command.valid?

    command = build :title => nil, :date => "foo"

    command.validate!
    assert_equal command.errors[:title], ["must be present"]
    assert_equal command.errors[:date], ["not a valid date"]
  end

end
