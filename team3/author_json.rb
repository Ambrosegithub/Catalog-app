# rubocop: disable all

require 'json'

module StoreAuthor
    def storeauthors
        author_array = []
        @authors.each do |author|
            author_array << {
                first_name: author.first_name,
                last_name: author.last_name,
                id: author.id
         }
        end
        write_json(author_array, './storage/author.json')
    end
    def read_author
        authors = []
        file = read_json('./storage/author.json')
        #p file
        file.each do |author| 
            author = Author.new(file['first-name'], file['last-name'], file['id'])
            authors.push(author)
           
        end
        authors
    end
end

