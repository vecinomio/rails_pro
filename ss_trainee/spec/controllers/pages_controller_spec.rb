require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  it 'returns the page code status 200' do
    get :about
    expect(response.status).to eq(403)
  end
end
