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
