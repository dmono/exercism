# 011 => 9
# 0*8^2 + 1*8^1 + 1*8^0
# 0*64 + 1*8 + 1*1 = 9


class Octal
  attr_reader :number
  
  def initialize(number)
    @number = number
  end
  
  def valid_input?
    number.chars.each do |char|
      return false if char.to_i.to_s != char || (8..9).include?(char.to_i)
    end
  end
  
  def to_decimal
    return 0 unless valid_input?
    
    result = 0
    digits = number.chars.map(&:to_i)
    digits.reverse.each_with_index { |num, idx| result += num * (8 ** idx) }
    
    result
  end
  
end

octal = Octal.new('130')
puts octal.to_decimal


# Best submitted answer

class Octal
  BASE = 8
  INVALID_OCTAL = /\D|[8-9]/

  attr_reader :octal_string

  def initialize(octal_string)
    @octal_string = octal_string
  end

# =~ is a match operator
# sees if there is a match between the octal_string and INVALID_OCTAL constant
  def to_decimal
    octal_string =~ INVALID_OCTAL ? 0 : calculate
  end

  private

  def calculate
    decimal = 0
    octal_string.reverse.each_char.with_index do |char, index|
      decimal += char.to_i * (BASE ** index)
    end
    decimal
  end

end