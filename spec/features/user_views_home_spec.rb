require 'spec_helper'

feature 'User wants to view the home page', %Q(
As a site visitor
I want to view the home page
so that I can witness shibe greatness
 ) do

    scenario 'user visits home page' do

    visit home_posts_path

    expect(page).to have_content('Welcome Fellow Shibes!')
  end
end
