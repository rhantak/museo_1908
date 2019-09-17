require 'CSV'
require './lib/readable'
class Curator
  include Readable

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(artist_id)
    @artists.find{|artist| artist.id == artist_id}
  end

  def find_photograph_by_id(photo_id)
    @photographs.find{|photograph| photograph.id == photo_id}
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photograph|
      photograph.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    artist_ids = @photographs.map {|photo| photo.artist_id}.uniq
    artist_ids.map do |artist_id|
      if @photographs.count{|photo| photo.artist_id == artist_id} > 1
        find_artist_by_id(artist_id)
      end
    end.compact
  end

  def photographs_taken_by_artists_from(country)
    @photographs.find_all do |photograph|
      find_artist_by_id(photograph.artist_id).country == country
    end
  end

  def photographs_taken_between(range)
    @photographs.find_all do |photograph|
      range.include?(photograph.year.to_i)
    end
  end

  def artists_photographs_by_age(artist)
    photos_by_age = Hash.new
    artist_photos = @photographs.find_all {|photo| photo.artist_id == artist.id}
    artist_photos.each do |photo|
      key = photo.year.to_i - find_artist_by_id(photo.artist_id).born.to_i
      photos_by_age[key] = photo.name
    end
    photos_by_age
  end
end
