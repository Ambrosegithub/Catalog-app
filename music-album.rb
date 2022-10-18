require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(published_date, on_spotify)
    super(published_date)
    @on_spotify = on_spotify
  end
end
