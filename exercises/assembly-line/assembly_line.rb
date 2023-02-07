class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed >= 1 && @speed <= 4
      @speed * 221
    elsif @speed >= 5 && @speed <= 8
      @speed * 221 * 0.90
    elsif @speed == 9
      @speed * 221 * 0.80
    elsif @speed == 10
      @speed * 221 * 0.77
    else
      puts 'ERROR: The number is out of bounds.'
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
