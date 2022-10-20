# rubocop: disable all

require 'json'

module StoreAuthor
    def storeauthors
        author_array = []
        @authors.each do |author|
            author_array << {
                first_name: author.first_name,
                last_name: author.last_name,
                
            #Games: author.items.map do |game| 
                #{
                    #name: game.multiplayer,
                   # last_played_at: game.last_played_at,
                   # published_date: game.published_date,
                #} 
            #end         
         }
        end
        write_json(author_array, './storage/author.json')
    end
    def read_author
        authors = []
        file = read_json('./storage/author.json')
        #p file
        file.each do |author| 
            author = Author.new(file['first-name'], file['last-name'])
            #author.last_name = author['last-name']
            authors.push(author)
            #author.items = author['games'].map do |game|
              #  Game.new(game['name'], game['last_played_at'], game['published_date'])
           # end
        end
        authors
    end
end

