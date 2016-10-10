class Sieve
  attr_reader :number

  def initialize(number)
    @number = number
  end
  
  def is_prime?(num)
    (2...num).each do |number|
      return false if num % number == 0
    end
    
    true
  end
  
  def primes
    # take the next available unmarked number in your list (it is prime)
    # mark all the multiples of that number (they are not prime)
    num_list = {}
    (2..number).each { |i| num_list[i] = "" }
    
    num_list.each do |num, status|
      if is_prime?(num) && status == ""
        multiple = num * 2
        while multiple <= num_list.keys.last
          num_list[multiple] = "marked"
          multiple += num
        end
      end
    end

    num_list.select { |_, v| v == "" }.keys 
  end
end

primes = Sieve.new(15)
p primes.primes