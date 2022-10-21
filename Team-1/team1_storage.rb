# rubocop: disable all

require_relative './book'
require_relative './label'
require 'json'

module DataStorage
  def read_books
    file = '../storage/book-data.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['published_date'], element['archived'], element['publisher'], element['cover_state'],
                           id: element['id'].to_i))
      end
    end
    data
  end

  def save_books(books)
    data = []
    books.each do |book|
      data.push({ id: book.id, publisher: book.publisher, published_date: book.published_date, cover_state: book.cover_state })
    end
    File.write('../storage/book-data.json', JSON.generate(data))
  end

  def read_labels
    file = '../storage/labels-data.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['title'], element['color']))
      end
    end
    data
  end

  def save_labels(labels)
    data = []
    labels.each do |label|
      data.push({ title: label.title, color: label.color })
    end
    File.write('../storage/label-data.json', JSON.generate(data))
  end
end
