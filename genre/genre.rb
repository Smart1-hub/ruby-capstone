class Genre
  attr_accessor :items, :name, :id

  def initialize(name, id = nil)
    @name = name
    @id = id || Random.rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
