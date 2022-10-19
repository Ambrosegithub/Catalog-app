require './item'

class Label
  attr_accessor :title, :color, :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    raise ArgumentError, 'item must be of Item class' unless item.instance_of?(Item)

    @items.push(item)
    item.add_label = self
  end
end
