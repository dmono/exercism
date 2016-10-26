class Fixnum
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman
    roman_numeral = ""
    number = self
    # 1990
    ROMAN_NUMERALS.each do |roman_number, value|
      num_of_letters = number / value
      roman_numeral += roman_number * num_of_letters
      number -= num_of_letters * value
    end

    roman_numeral
  end

end
