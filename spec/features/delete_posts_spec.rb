require 'rails_helper'

feature 'only current_user destroys a post', %Q(
As a user
I want to remove a post from the site
So that I can hide my shame from the world
) do

  scenario 'user deletes a post' do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "delete-post-#{@post.id}"

    expect(page).to have_content('Post deleted!')
    expect(page).to_not have_content(post.title)
  end
end
