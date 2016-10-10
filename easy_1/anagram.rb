class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end
  
  def match(options)
    options.select do |option|
      word.downcase.chars.sort == option.downcase.chars.sort &&
        word.downcase != option.downcase
    end
  end
end