# rubocop: disable all
require 'json'
require './team2/genre'
require './team2/music_album'
require './Team-1/team1_storage'
require_relative './team3/game'
require_relative './team3/author'
require_relative './team3/author_json'
require_relative './team3/game_json'
require_relative './team3/handle_json'

SAVE = Savedata.new

class App

    attr_accessor :app, :books, :labels

    include FileHandler
    include StoreAuthor
    include GameStorage

  def initialize()
        @app = app
        @music_albums = []
        @genres = []
        @games = read_game
        @authors = read_author
        @books = []
        @labels = []
    end

    # Genre Part

    def store_genre(genre)
        hash = { id: genre.id, name: genre.name }

        file = File.size('./storage/genre.json').zero? ? [] : JSON.parse(File.read('./storage/genre.json'))
        file.push(hash)
        File.write('./storage/genre.json', JSON.pretty_generate(file))
    end

    def add_genre(type)
        print 'Enter genre name: '
        name = gets.chomp
        genre = Genre.new(name)
        genre.add_item(type)
        store_genre(genre)
    end

    def list_all_genres
        puts '**** List of genres ****'
        genres = File.size('./storage/genre.json').zero? ? [] : JSON.parse(File.read('./storage/genre.json'))
        genres.each do |genre|
          puts "- #{genre['id']} ---  Genre: #{genre['name']}"
        end
    end

    # Music Part

    def store_music(music)
        new_music = { id: music.id, publish_date: music.published_date, sportify: music.on_spotify,
                      genre_id: music.genre.name }
        if File.exist?('./storage/music.json')
          file = File.size('./storage/music.json').zero? ? [] : JSON.parse(File.read('./storage/music.json'))
          file.push(new_music)
          File.write('./storage/music.json', JSON.pretty_generate(file))
        else
          File.write('./storage/music.json', JSON.pretty_generate([new_music]))
        end
      end

    def add_music
        puts 'Is the music on sportify? (Y/N): '
        sportify_value = gets.chomp
        puts 'Enter publish date (YYYY-MM-DD): '
        publish_date = gets.chomp
        music = MusicAlbum.new(publish_date, sportify_value)
        add_genre(music)
        puts 'Album added successfully'
        store_music(music)
        music
    end

    def list_all_music
        puts "**** Album list ****"
        musics = File.size('./storage/music.json').zero? ? [] : JSON.parse(File.read('./storage/music.json'))
        musics.each do |music|
          puts "Genre: #{music['genre_id']}, On sportify: #{music['sportify']}, Published date: #{music['publish_date']}"
        end
    end

    # Music part End

    def add_game()
        print "Enter the name of the game "
        name = gets.chomp
        print "Enter the published date of the game (YYYY-MM-DD) "
        published_date = gets.chomp
        print "Enter the multiplayer of the game (Y/N) "
        multiplayer = gets.chomp
        print "Enter the last played date of the game (YYYY-MM-DD) "
        last_played_at = gets.chomp
        @games.push(Game.new(name, published_date, multiplayer, last_played_at))
        storegames
        puts "Game added successfully"
    end

    def add_author()
        print "Enter the first name of the author "
        first_name = gets.chomp
        print "Enter the last name of the author "
        last_name = gets.chomp
        @authors.push(Author.new(first_name, last_name))
        storeauthors
        puts "Author added successfully"
    end

    def list_games()
        puts "No games found" if @games.empty?
        @games.each_with_index do |game, index|
            puts "#{(index + 1)}name: #{game.name} multiplayer: #{game.multiplayer} last played at: #{game.last_played_at}"
        end
      end

    def list_authors()
        puts "No authors found" if @authors.empty?
        @authors.each_with_index do |author, index|
            puts "#{(index + 1)} first_name: #{author.first_name} last_name: #{author.last_name}"
        end
    end
    # Books
def create_book
  print 'Book publisher:'
  publisher = gets.chomp
  print 'Cover state:'
  cover_state = gets.chomp
  print 'Published date (format: YYYY-MM-DD): '
  publish_date = gets.chomp
  book = Book.new(publisher, cover_state, publish_date)
  add_label(book)
  @books << book
  SAVE.save_books(book)
  puts "Book #{book.publisher} was added"
end

def display_books
  books = File.size('./data/books.json').zero? ? [] : JSON.parse(File.read('./data/books.json'))
  books.each do |b|
    puts "Publisher: #{b['publisher']}, Cover State: #{b['cover_state']}, Publish Date: #{b['publish_date']}"
  end
end
# Labels
def add_label(item)
  puts 'Label title:'
  title = gets.chomp
  puts 'Label color:'
  color = gets.chomp
  label = Label.new(title, color)
  label.add_item(item)
  @labels << label
  puts "Label #{label.title} was added"
  SAVE.save_labels(label)
end

def list_all_labels
  puts 'List of all labels:'
  labels = File.size('./data/labels.json').zero? ? [] : JSON.parse(File.read('./data/labels.json'))
  labels.each do |l|
    puts "Label id: #{l['id']}, title: #{l['title']}, color: #{l['color']}"
  end
end
end
