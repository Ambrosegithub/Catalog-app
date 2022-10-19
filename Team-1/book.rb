require './item'

class Book < Item
  def initialize(publisher, cover_state, *args)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if @publish_date < 2012 || @cover_state == 'bad'
    return false if @publish_date > 2012
  end
end
