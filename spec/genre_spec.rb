require_relative '../genre'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
  end

  describe '#new' do
    it 'takes two parameters and returns an Author object' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'check the id' do
      expect(@genre.id).to_not be_nil
    end

    it 'check the genre' do
      expect(@genre.name).to eq('Comedy')
    end
  end
end
