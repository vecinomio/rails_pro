require 'rails_helper'

#Hello
#kjdjfkljdjf
#1w23344y783475874

RSpec.describe StatsController, type: :controller do
  describe '#bark' do
    it 'returns the "Woof!"' do
      test1 = StatsController.new
      expect(test1.bark).to eql('Woof!')
    end
  end
end
