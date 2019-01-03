require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  it 'returns the page code status 200' do
    get :index
    expect(response).to have_http_status(:success) #200
  end
end
