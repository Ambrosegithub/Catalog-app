require 'date'
class Item
    attr_accessor :genre, :author, :publisher
    attr_reader :id, :published_date, :archived_at, :items
    def initialize(id, published_date, archived_at)
        @id = id
        @published_date = published_date
        @archived_at = archived_at 
        @items = []
    end
    def can_be_archived?() 
      @published_date.year < (Date.today - 10).year
    end
    def move_to_archive() 
        return unless can_be_archived?
    end
    def add_author(author)
        @items << author unless @items.include?(author)
        
    end
end