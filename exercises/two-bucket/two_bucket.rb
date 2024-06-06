class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(b1_capacity, b2_capacity, target_liters, start_bucket)
    @b1_capacity = b1_capacity
    @b2_capacity = b2_capacity
    @target_liters = target_liters
    @start_bucket = start_bucket
    @current_move = []
    @moves, @goal_bucket, @other_bucket = solve
  end

  def solve
    filled_bucket = @start_bucket == 'one' ? @b1_capacity : @b2_capacity
    @b1_capacity, @b2_capacity = @b2_capacity, @b1_capacity if @start_bucket == 'two'

    steps = 1
    @current_move = [filled_bucket, 0]

    until bucket_goal?
      b1, b2 = @current_move

      if b1.zero?
        b1 = filled_bucket
      elsif @b2_capacity == @target_liters
        b2 = @b2_capacity
      elsif b2 == @b2_capacity
        b2 = 0
      else
        liters = [b1, @b2_capacity - b2].min
        b1 -= liters
        b2 += liters
      end
      @current_move = [b1, b2]
      steps += 1
    end
    [steps, bucket_with_desired_liters, water_left]
  end

  private

  def bucket_goal?
    @current_move.any?(@target_liters)
  end

  def bucket_with_desired_liters
    if @start_bucket == 'one'
      @current_move.first == @target_liters ? 'one' : 'two'
    else
      @current_move.first == @target_liters ? 'two' : 'one'
    end
  end

  def water_left
    @current_move.find { |val| val != @target_liters }
  end
end
