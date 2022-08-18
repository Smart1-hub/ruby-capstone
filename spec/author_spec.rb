require './classes/item'
require './classes/author'
require 'date'

describe Author do
  before(:all) do
    @author = Author.new('Joseph', 'Kwentsir')
    @game = Game.new('17-08-2000', 'No', '18-08-2022')
  end

  context 'When Author is created' do
    it 'Should be and instance of Author class' do
      expect(@author).to be_instance_of Author
    end
    it 'Should have a correct name' do
      expect(@author.first_name).to eq 'Joseph'
    end
    it 'Should create an item' do
      @author.add_item(@game)
      expect(@author.items).to include @game
    end
  end
end
