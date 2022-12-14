require './app'

APP = App.new

class Main
  def actions
    puts 'Welcome to Catalog of my things application'
    puts 'Please choose an option from the list by entering a number:'
    puts '------------------'
    puts '1 - Add book'
    puts '2 - List all books'
    puts '3 - Add a game'
    puts '4 - List all games'
    puts '5 - Add music album'
    puts '6 - List all music albums'
    puts '7 - List all genres'
    puts '8 - List all labels'
    puts '9 - Add author'
    puts '10 - List all authors'
    puts '11 - Exit'
  end

  def run
    actions
    print 'Please choose a number:'
    action = gets.chomp.to_i
    choice(action)
    choice2(action)
    exit if action == 11
  end

  def choice(action)
    case action
    when 1
      APP.create_book
      run
    when 2
      APP.display_books
      run
    when 3
      APP.add_game
      run
    when 4
      APP.list_games
      run
    when 5
      APP.add_music
      run
    end
  end

  def choice2(action)
    case action
    when 6
      APP.list_all_music
      run
    when 7
      APP.list_all_genres
      run
    when 8
      APP.list_all_labels
      run
    when 9
      APP.add_author
      run
    when 10
      APP.list_authors
      run
    end
  end
end

catalog = Main.new
catalog.run
