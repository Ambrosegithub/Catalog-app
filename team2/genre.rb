class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @item = []
  end

  def add_item(item)
    @item << item
    item.genre = self
  end
end
