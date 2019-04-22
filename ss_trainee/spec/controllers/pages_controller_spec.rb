# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  it 'Test returns the page code status 200 from page: About us' do
    get :about
    expect(response.status).to eq(200)
  end
end

RSpec.describe PagesController, type: :controller do
  it 'Test returns the page code status 200 from Contacts page' do
    get :contacts
    expect(response.status).to eq(200)
  end
end
