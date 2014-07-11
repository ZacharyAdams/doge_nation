require 'rails_helper'

feature 'only current_user destroys a post', %Q(
As a user
I want to remove a post from the site
So that I can hide my shame from the world
) do

  scenario 'user deletes a post' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post, user: user)
    sign_in_as(user)
    visit post_path(post)
    click_on "edit-post-#{post.id}"
    fill_in 'post_title', with: 'New Title'
    click_on 'So Save'

    expect(page).to have_content('New Title')
  end
    scenario 'user tries deletes a post that is not theirs' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post)
    sign_in_as(user)
    visit post_path(post)

    expect(page).to_not have_content('edit-post-#{post.id}')
  end
end
