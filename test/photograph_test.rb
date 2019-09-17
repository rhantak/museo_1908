require './lib/photograph'
require 'minitest/autorun'
require 'minitest/pride'

class PhotographTest < Minitest::Test
  def setup
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    @photo_1 = Photograph.new(attributes)
  end

  def test_it_exists
    assert_instance_of Photograph, @photo_1
  end

  def test_initialize
    assert_equal "1", @photo_1.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @photo_1.name
    assert_equal "4", @photo_1.artist_id
    assert_equal "1954", @photo_1.year
  end
end
