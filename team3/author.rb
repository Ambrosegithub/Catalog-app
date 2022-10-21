# rubocop: disable all

require 'date'

class Author
    attr_accessor :first_name, :last_name, :items
    attr_reader :id 
    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
        @items = []
        @id = Random.rand(1..1000)
    end
    def add_item(game)
        @items << game
        game.add_author = self unless game.author == self
    end
end
 author = Author.new("ALIx", "Amos")
 puts author.first_name
puts author.last_name
puts author.id