# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it 'returns the page code status 200' do
    get :about
    expect(response.status).to eq(200)
  end
end

RSpec.describe PagesController, type: :controller do
  it 'returns the page code status 200' do
    get :contacts
    expect(response.status).to eq(200)
  end
end
