# frozen_string_literal: true

class Robot
  RANDOM_NAMES = ('AA000'..'ZZ999').to_a

  @@robot_names = []

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = generate_random_name

    if @@robot_names.include?(@name)
      @name = @name.pred
    else
      @@robot_names << @name
    end
  end

  def self.forget
    @@robot_names.clear
  end

  private

  def generate_random_name
    RANDOM_NAMES.pop
  end
end
