class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = {}
    @phrase.downcase.scan(/\b[\w']+\b/).each do |word|
      words.keys.include?(word) ? words[word] += 1 : words[word] = 1
    end
    
    words
  end
end
