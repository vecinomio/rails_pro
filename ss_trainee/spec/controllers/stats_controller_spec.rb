require 'rails_helper'
#Hello from test & again hello hello!!!

#Bla Bla Bla

=begin
;dlsfhkdffgkjdbfhfjkhbsf
fsfhksdhfksdhfkj
dosfhjkssdhjfl;sjdfiku
dfbkdjshfjksbdhnfsd
fsdfjsdhfkhsf
asdpfjsiuh
sfpsiufswf
dsfhsdfijas
dfbkdjshfjksbdhnfsdfsifus
\find { |e|  }
=end



RSpec.describe StatsController, type: :controller do
  describe '#bark' do
    it 'returns the "Woof!"' do
      test1 = StatsController.new
      expect(test1.bark).to eql('Woof!')
    end
  end
end
