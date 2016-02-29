require_relative '../lib/appointment'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class AppointmentTest < Minitest::Test
  # Useful http://www.foragoodstrftime.com/

  # Time Cheat Sheet -- Create new Time
  # Time.new(year, month, day, hour, minute)
  # Time.new(2016, 3, 7, 9, 30) (Monday March 7 9:30 AM)

  def test_creates_with_name_time_and_duration
    appt_time = Time.new(2016, 3, 7, 9, 00)
    duration = 60 # (minutes)
    a = Appointment.new("Go to class", appt_time, 60)
    assert_equal "Go to class", a.description
    assert_equal appt_time, a.time
    assert_equal 60, a.duration
  end

  def test_knows_hour_and_day_of_week
    appt_time = Time.new(2016, 3, 7, 9, 30)
    a = Appointment.new("Go to class", appt_time, 60)
    assert_equal "Monday", a.day_of_week
    assert_equal 9, a.hour
    assert_equal 30, a.minute
  end

  def test_can_tell_if_it_overlaps_with_a_given_time
    appt_time = Time.new(2016, 3, 7, 9, 30)
    a = Appointment.new("Go to class", appt_time, 60)

    check_time = Time.new(2016, 3, 7, 9, 45)
    assert a.overlaps?(check_time), "Hour-long appointment will overlap with a time 15 minutes after its start"

    check_time = Time.new(2016, 3, 7, 10, 45)
    refute a.overlaps?(check_time), "Hour-long appointment will not overlap with a time 75 minutes after its start"
  end
end
