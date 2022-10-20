require_relative '../Team-1/book'

describe Book do
  context 'Test the Book class' do
    before :each do
      @book = Book.new('Test Author', '2022/10/13', 'good')
    end

    it 'should be an instance of the Book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'from the input data for book return its publisher' do
      expect(@book.publisher).to eq 'Test Author'
    end

    it 'from the input data for book return the state of its cover ' do
      expect(@book.cover_state).to eq 'good'
    end
  end
end
