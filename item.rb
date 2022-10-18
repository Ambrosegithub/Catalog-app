# frozen_string_literal: true

require 'date'

# class for Item
class Item
  attr_accessor :genre, :author, :publisher
  attr_reader :id, :published_date, :archived_at, :items

  def initialize(date)
    @id = id
    @published_date = date
    @archived_at = false
    @items = []
  end

  def can_be_archived?
    @published_date.year < (Date.today - 10).year
  end

  def move_to_archive
    return unless can_be_archived?
  end

  def add_author(author)
    @items << author unless @items.include?(author)
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_label(label)
    @label = label
  end
end
