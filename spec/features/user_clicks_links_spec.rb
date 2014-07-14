require 'rails_helper'

feature 'User wants to visit all links of the website', %Q(
As a site visitor
I want to click on links
so that I can view all aspects of the website
 ) do

  scenario 'user clicks on Such Home' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit posts_path

    expect(page).to have_link 'Such Home'
    click_on 'Such Home'
    expect(current_path).to eql(static_pages_path)
  end
  scenario 'user clicks on Very Posts' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit posts_path

    expect(page).to have_link 'Very Posts'
    click_on 'Very Posts'
    expect(current_path).to eql(posts_path)
  end
   scenario 'user clicks on Much New Posts' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit posts_path

    expect(page).to have_link 'Much New Posts'
    click_on 'Much New Posts'
    expect(current_path).to eql(new_post_path)
  end
  scenario 'user clicks on Logout' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on 'Logout'
    expect(page).to have_link 'So Login'
    expect(page).to have_link 'Much Sign Up'
    expect(current_path).to eql("/")
  end
end
