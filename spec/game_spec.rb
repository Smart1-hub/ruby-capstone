require './classes/game'
require 'date'

describe Game do
  before(:all) do
    @game = Game.new('17-08-2000', 'Yes', '17-08-2013')
  end

  context 'When new Game is created' do
    it 'Should be of Game instance' do
      expect(@game).to be_instance_of Game
    end
    it 'Should be archived when older than 10 years and last_played > 2 years' do
      expect(@game.can_be_archived?).to be_truthy
    end
  end
end
