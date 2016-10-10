class SumOfMultiples
  attr_reader :multiples
  
  def self.to(limit, multiples=[3, 5])
    (0...limit).select do |number|
      multiples.any? { |multiple| number % multiple == 0 }
    end.reduce(:+)
  end
  
  def initialize(*multiples)
    @multiples = multiples
  end
  
  def to(limit)
    self.class.to(limit, multiples)
  end
  
end

new = SumOfMultiples.new(7, 13, 17)
puts new.to(20) # 51


puts SumOfMultiples.to(10) # 23