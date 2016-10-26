# perfect: Sum of factors = number
# abundant: Sum of factors > number
# deficient: Sum of factors < number

class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'invalid number' if number < 0

    factors = (1...number).select { |divisor| number % divisor == 0 }

    if factors.inject(:+) == number
      'perfect'
    elsif factors.inject(:+) > number
      'abundant'
    else
      'deficient'
    end
  end
end

puts PerfectNumber.classify(13)


# Top Answer

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0

    factors = (1...number).select { |num| number % num == 0 }

    result = factors.reduce(:+)

    case
      when result < number then 'deficient'
      when result > number then 'abundant'
      when result == number then 'perfect'
    end
  end
end