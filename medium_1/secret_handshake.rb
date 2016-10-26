class SecretHandshake
  CODES = ["wink", "double blink", "close your eyes", "jump"]
  
  attr_reader :binary
  
  def initialize(value)
    @binary = to_binary(value)
  end
  
  def commands
    signs = []
    digits = binary.reverse.chars
    digits.each_with_index do |num, idx|
      signs << CODES[idx] if num == '1' && idx < 4
    end
    
    digits[4] == '1' ? signs.reverse : signs
  end
  
  private
  
  def to_binary(num)
    num.is_a?(Integer) ? num.to_s(2) : num
  end
end

handshake = SecretHandshake.new(31)
p handshake.commands # => ['jump', 'close your eyes', 'double blink', 'wink']