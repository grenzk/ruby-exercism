# frozen_string_literal: true

class LogLineParser
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def message
    line.gsub(/.*?:/, '').strip
  end

  def log_level
    line.match(/\[(.*?)\]/)[1].downcase
  end

  def reformat
    status = "(#{log_level})"

    "#{message} #{status}"
  end
end
