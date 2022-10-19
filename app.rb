# rubocop: disable all
require 'json'
require './team2/genre'
require './team2/music_album'

class App

    attr_accessor :app

    def initialize(app)
        @app = app
        @music_albums = []
        @genres = []
    end

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
        genre.add_item(item)
        store_genre(genre)
    end

    def list_all_genres
        puts 'List of genres'
        genres = File.size('./storage/genre.json').zero? ? [] : JSON.parse(File.read('./storage/genre.json'))
        genres.each do |genre|
          puts "Genre: #{genre['id']} ---  #{genre['name']}"
        end
    end

    def add_game()
        print "Enter the published date of the game"
        published_date = gets.chomp
        print "Enter the multiplayer of the game"
        multiplayer = gets.chomp
        print "Enter the last played date of the game"
        last_played_at = gets.chomp
        game = Game.new(published_date, multiplayer, last_played_at)
        @app.add_game(game)
        puts "Game added successfully"
    end

    def add_author()
        print "Enter the first name of the author"
        first_name = gets.chomp
        print "Enter the last name of the author"
        last_name = gets.chomp
        author = Author.new(first_name, last_name)
        @app.add_author(author)
        puts "Author added successfully"
    end

    def list_games()
        puts "No games found" if @app.games.empty?
        @games.each do |game, index|
            puts "#{index + 1} multiplayer: #{game.multiplayer} last played at: #{game.last_played_at}"
        end        
      end
    end

    def list_authors()
        puts "No authors found" if @app.authors.empty?
        @authors.each do |author, index|
            puts "#{index + 1} first_name: #{author.first_name} last_name: #{author.last_name}"
        end        
    end
end
end
