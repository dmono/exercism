class Scrabble
  POINTS = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  attr_reader :word

  def self.score(word)
    return 0 if !word

    total = 0
    word.chars.each do |char|
      POINTS.each do |points, letters|
        total += points if letters.include? char.upcase
      end
    end

    total
  end

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(word)
  end
end

puts Scrabble.new('street').score
p Scrabble.new('').score
puts Scrabble.score('alacrity')
Scrabble.new(nil).score