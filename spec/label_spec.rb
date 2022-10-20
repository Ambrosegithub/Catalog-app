require_relative '../Team-1/label'
require_relative '../item'

describe Label do
  context 'When testing the Label class' do
    it 'The initialize method should return create new Label object' do
      label = Label.new('Gift', 'Blue')
      expect(label.title).to eq 'Gift'
    end
  end
end
