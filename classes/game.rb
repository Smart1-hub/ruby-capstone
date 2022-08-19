require_relative '../item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    Time.now.year - Date.parse(@publish_date).year > 10 && Time.now.year - Date.parse(@last_played_at).year > 2
  end
end
