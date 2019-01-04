require 'rails_helper'
require 'capybara/rspec'

RSpec.describe PostsController, :type => :controller do
  it 'returns the page code status 200' do
    get :index
    expect(response).to have_http_status(:success) #200
  end
end


RSpec.describe "Redirecting to the page: About us", :type => :feature do
  scenario "User clicks on the link: About us" do
    visit '/'


    #fill_in 'form-control', :with => "My Fuc.....ing post"
    click_link "About us"

    expect(page).to have_text("About us")
  end
end

RSpec.describe "Redirecting to the page: Add post", :type => :feature do
  scenario "User clicks on the link: Add post" do
    visit '/'


    #fill_in 'form-control', :with => "My Fuc.....ing post"
    click_link "Add post"

    expect(page).to have_text("Add new post")
  end
end

RSpec.describe "Redirecting to the page: View post", :type => :feature do
  scenario "User clicks on the button: Read more" do
    visit '/'


    #fill_in 'form-control', :with => "My Fuc.....ing post"
    click_on "Read more"

    expect(page).to have_text("Your post")
  end
end
