require_relative '../team2/music_album'

describe MusicAlbum do
  music = MusicAlbum.new('2020-01-01', true)

  it 'music to be an instaance of MusicAlbum' do
    expect(music).to be_an_instance_of MusicAlbum
  end

  it 'check if he had a date' do
    expect(music.published_date).to_not be_nil
  end

  it 'check the on_spotify' do
    expect(music.on_spotify).to eq true
  end
end
