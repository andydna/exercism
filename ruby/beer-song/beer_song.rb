class BeerSong
  def verses from, to
    (to..from).to_a.reverse.map do |beers|
      verse beers
    end.join("\n")
  end

  def verse beers
    case
    when beers > 2
      generic_verse beers
    when beers == 2
      two_beers_verse
    when beers == 1
      one_beer_verse
    when beers.zero?
      no_beer_verse
    end
  end

  def generic_verse(beers)
    <<-VERSE
#{beers} bottles of beer on the wall, #{beers} bottles of beer.
Take one down and pass it around, #{beers-1} bottles of beer on the wall.
    VERSE
  end

  def two_beers_verse
    <<-VERSE
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
    VERSE
  end

  def one_beer_verse
    <<-VERSE
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
  end

  def no_beer_verse
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end
end

module BookKeeping
  VERSION = 3
end
