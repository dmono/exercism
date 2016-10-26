class OddWords
  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def reverse_odd_words
    words = input_text.delete('.').split
    words.map!.with_index { |word, index| index.odd? ? word.reverse : word }
    words.join(' ') + '.'
  end
end

puts OddWords.new("whats the matter with kansas.").reverse_odd_words
puts OddWords.new("this is a test string.").reverse_odd_words
puts OddWords.new("i have extra spaces   .").reverse_odd_words
puts OddWords.new("hello   world   .").reverse_odd_words
puts OddWords.new("   how now brown cow    meow       .").reverse_odd_words
