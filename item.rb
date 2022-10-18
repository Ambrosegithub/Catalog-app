# rubocop:disable all
require 'date'

# class for Item
class Item
  attr_accessor :genre, :author, :publisher
  attr_reader :id, :published_date, :archived, :items

  def initialize(date)
    @id = id
    @published_date = date
    @archived = false
  end

  def can_be_archived?
    @published_date.year < (Date.today - 10).year
  end

  def move_to_archive
    return unless can_be_archived?
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_label(label)
    @label = label
  end
end
