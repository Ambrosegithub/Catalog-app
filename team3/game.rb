# rubocop: disable all

require_relative '../item'
require 'date'
class Game  < Item
    attr_reader :multiplayer, :last_played_at, :name
    attr_accessor :author
    def initialize(name, published_date, multiplayer, last_played_at)
        super(published_date)
        @name = name
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end
      def can_be_archived?
        super && Date.today - Date.parse(@last_played_at) > 730
     end 
end
