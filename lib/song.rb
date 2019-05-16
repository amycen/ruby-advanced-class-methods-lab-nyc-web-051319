require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    new_song = Song.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
    song
  end

  def self.find_by_name(name)
    song = self.all.find {|song| song.name == name}
    song
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) || self.create_by_name(name)
    song
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_name, name = filename.split(" - ")
    name = name.split(".")[0]
    new_song = self.create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
