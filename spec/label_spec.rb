require_relative '../Team-1/label'
require_relative '../item'

describe Label do
  context 'When testing the Label class' do
    it 'The initialize method should return create new Label object' do
      label = Label.new('Gift', 'Blue')
      expect(label.title).to eq 'Gift'
    end

    it 'The add_item method should add one item' do
      label = Label.new('New', 'Red')
      item = Item.new('1998/4/6', true)
      label.add_item(item)
      expect(label.items.length).to be 1
    end
  end
end
