# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe PostsController, type: :controller do
  it 'returns the page code status 200' do
    get :index
    expect(response).to have_http_status(:success) # 200
  end
end

RSpec.describe 'Redirecting to the page: About us', type: :feature do
  scenario 'User clicks on the link: About us' do
    visit '/'

    # fill_in 'form-control', :with => "My Fuc.....ing post"
    click_link 'About us'

    expect(page).to have_text('About us')
  end
end

RSpec.describe 'Creating a new post', type: :feature do
  scenario 'User clicks on "Add post" & create a new post with title: 
  Sometitle' do
    # 1. go to root where will be button to Add New Book:
    visit '/'
    # 2. click on Add New Book button
    click_link 'Add post'
    # 3. Fill form - add title
    fill_in 'post_title', with: 'Sometitle'
    # 4. Click on submit form button
    click_button 'Save Post'
    # 5. Than we should be redirected to show page with book details(book title)
    expect(page).to have_content('Sometitle')
  end
end
