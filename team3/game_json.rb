require 'json'

module GameStorage
  def storegames
    game_array = []
    @games.each do |game|
      game_array << {
        name: game.name,
        published_date: game.published_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    write_json(game_array, './storage/game.json')
  end

  def read_game
    games = []
    file = read_json('./storage/game.json')
    file.each do |game|
      g = Game.new(game['name'], game['published_date'], game['multiplayer'], game['last_played_at'])
      games.push(g)
    end
    games
  end
end
