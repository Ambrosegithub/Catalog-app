require './app'

APP = App.new

class Main
  def actions
    puts "Welcome to Catalog of my things application"
    puts "Please choose an option from the list by entering a number:"
    puts "1 - Add book"
    puts "2 - List all books"
    puts "3 - Add a game"
    puts "4 - List all games"
    puts "5 - Add music album"
    puts "6 - List all music albums"
    puts "7 - List all genres"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "0 - Exit"
  end

  def run
    actions
    action = gets.chomp.to_i
    choice(action)
    if action == 0
      exit
    end
  end

  def choice(action)
    case action
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