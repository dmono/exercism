class Trinary
  BASE = 3
  INVALID_VALUES = /\D|[3-9]/
  
  attr_reader :trinary_string
  
  def initialize(str)
    @trinary_string = str
  end
  
  def to_decimal
    trinary_string =~ INVALID_VALUES ? 0 : calculate
  end
  
  def calculate
    result = 0
    trinary_string.reverse.each_char.with_index do |num, idx|
      result += num * (BASE ** idx)
    end
    
    result
  end
end

