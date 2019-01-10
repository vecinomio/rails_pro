require 'rails_helper'

#Hello from spec test
#again and again
#fhjkslknfkshdjkf
#mlkjd;fldf;lgdkfjg;ldfgk

RSpec.describe StatsController, type: :controller do
  describe '#bark' do
    it 'returns the "Woof!"' do
      test1 = StatsController.new
      expect(test1.bark).to eql('Woof!')
    end
  end
end
