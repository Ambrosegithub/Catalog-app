# rubocop: disable all

class App
    attr_accessor :app
    def initialize(app)
        @app = app
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
    def
        list_games()
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
