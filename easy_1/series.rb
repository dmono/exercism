# :nodoc:
class Series
  attr_accessor :slices
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def slices(num)
    raise ArgumentError, 'slice larger than number length' if num > number.size
    result = []
    start_index = 0
    end_index = num	- 1

    while end_index < number.size
      slice = []
      num.times { |i| slice << number[start_index + i].to_i }
      result << slice

      start_index += 1
      end_index += 1
    end

    result
  end
end


# Another solution

class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(series_length)
    raise ArgumentError if series_length > @digits.size

    result = []
    num_of_series = (@digits.size - series_length) + 1

    num_of_series.times do |num|
      result << @digits.slice(num, series_length).split('').map(&:to_i)
    end

    result
  end
end