class BeerSong
  # Special cases
  # Replace 0 with "no more"
  # 0 bottles (buy more)
  # 1 bottle (take IT down)

  def verse(num)
    song = ''

    line1 = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n"
    line2 = "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"

    case 
    when num == 0
      song << "No more bottles of beer on the wall, no more bottles of beer.\n"
      song << "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when num == 1
      song << "1 bottle of beer on the wall, 1 bottle of beer.\n"
      song << "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      song << line1
      if num == 2
        song << line2.gsub('bottles', 'bottle')
      else
        song << line2
      end
    end

    song
  end
  
  def verses(num, last)
    song = ''
    verses_count = (num - last) + 1

    loop do
      song << verse(num)
      num -= 1
      break if num < last
      song << "\n"
    end

    song
  end

  def lyrics
    verses(99, 0)
  end
end

# puts BeerSong.new.verse(99)
puts BeerSong.new.verses(2, 0)