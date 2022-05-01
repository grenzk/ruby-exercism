# frozen_string_literal: true

require 'time'

class Clock
  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    hours_and_minutes
    negative_hour_and_minutes
    Time.parse("#{@hour}:#{@minute}").strftime('%H:%M')
  end

  def hours_and_minutes
    if @minute > 59 && @hour > 24
      @hour = (@hour % 24) + (@minute / 60 % 24)
    elsif @hour > 24
      @hour = @hour % 24
    elsif @minute > 59
      @hour += @minute / 60 % 24
    end
  end

  def negative_hour_and_minutes
    if @minute < -59 && @hour < -24
      @hour = ((-@hour % 24) - (@minute / 60 % 24)).abs
    elsif @hour.negative? && @hour > -24
      @hour = (24 + @hour).abs
    elsif @minute.negative? && @minute > -59
      @hour = @minute.abs / 60 % 24
    elsif @hour < -24
      @hour = @hour % 24
    elsif @minute == -60
      @hour += @minute / 60
    elsif @minute < -59
      @hour += @minute / 60 % 24
    end
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end
end
