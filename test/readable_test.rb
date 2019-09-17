require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'minitest/autorun'
require 'minitest/pride'

class ReadableTest < Minitest::Test
  def setup
    @curator = Curator.new
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    @photo_1 = Photograph.new(attributes)
    @artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    })
  end

  def test_it_can_load_photographs_from_a_csv
    # I could figure out a better way to test equality without object id
    @curator.load_photographs("./data/photographs.csv")
    assert_equal @photo_1.id, @curator.photographs[0].id
    assert_equal @photo_1.name, @curator.photographs[0].name
    assert_equal @photo_1.artist_id, @curator.photographs[0].artist_id
    assert_equal @photo_1.year, @curator.photographs[0].year
  end

  def test_it_can_load_artists_from_a_csv
    @curator.load_artists("./data/artists.csv")
    assert_equal @artist_1.id, @curator.artists[0].id
    assert_equal @artist_1.name, @curator.artists[0].name
    assert_equal @artist_1.born, @curator.artists[0].born
    assert_equal @artist_1.died, @curator.artists[0].died
    assert_equal @artist_1.country, @curator.artists[0].country
  end
end
