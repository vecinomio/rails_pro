# frozen_string_literal: true

require 'rails_helper'

# Hello12345
# 9860809569857

RSpec.describe StatsController, type: :controller do
  describe '#bark' do
    it 'returns the "Woof!"' do
      test1 = StatsController.new
      expect(test1.bark).to eql('Woof!')
    end
  end
end
