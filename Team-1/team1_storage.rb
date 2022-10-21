# rubocop: disable all

require_relative './book'
require_relative './label'
require 'json'

class Savedata
  attr_accessor :labels, :books
  def initialize
    @labels = []
    @books = []
  end
  def save_labels(item)
    hash = { id: item.id, title: item.title, color: item.color }

    file = File.size('./storage/labels-data.json').zero? ? [] : JSON.parse(File.read('./storage/labels-data.json'))
    file.push(hash)
    File.write('./storage/labels-data.json', JSON.pretty_generate(file))
  end

  def save_books(book)
    new_books = { id: book.id, publisher: book.publisher, cover_state: book.cover_state,
                  published_date: book.published_date }

    if File.exist?('./storage/book-data.json')
      file = File.size('./storage/book-data.json').zero? ? [] : JSON.parse(File.read('./storage/book-data.json'))
      file.push(new_books)
      File.write('./storage/book-data.json', JSON.pretty_generate(file))
    else
      File.write('./storage/book-data.json', JSON.pretty_generate([new_books]))
    end
  end
end
