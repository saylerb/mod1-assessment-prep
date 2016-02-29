require "date"

class Appointment
  attr_reader :description, :time, :duration
  def initialize(desc, time, duration)
    @description = desc
    @time = time
    @duration = duration
  end

  def hour
    time.hour
  end

  def minute
    time.min
  end

  def day_of_week
    time.strftime("%A")
  end

  def end_time
    time + duration * 60
  end

  def overlaps?(other_time)
    time < other_time && other_time < end_time
  end
end
