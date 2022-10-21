require './app'

APP = App.new

class Main
  def actions
    puts 'Welcome to Catalog of my things application'
    puts "Please choose an option from the list by entering a number:"
    puts "------------------"
    puts '1 - Add book'
    puts '2 - List all books'
    puts ' - Add a game'
    puts ' - List all games'
    puts '5 - Add music album'
    puts '6 - List all music albums'
    puts '7 - List all genres'
    puts '8 - List all labels'
    puts ''
    puts ''
    puts ''
    puts ''
    puts '15 - Exit'
  end

  def run
    actions
    print "Please choose a number:"
    action = gets.chomp.to_i
    choice(action)
    exit if action == 15
  end

  def choice(action)
    case action
    when 1
      App.create_book
      run
    when 2
      App.display_books
      run
    when 5
      APP.add_music
      run
    when 6
      APP.list_all_music
      run
    when 7
      APP.list_all_genres
      run
    end
  end
end

catalog = Main.new
catalog.run