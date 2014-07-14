require 'rails_helper'

feature 'only current_user destroys a reply', %Q(
As a user
I want to remove a reply from the site
So that I can hide my shame from the world
) do

  scenario 'user deletes a reply' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post, user: user)
    reply = FactoryGirl.create(:reply, post: post, user: user)
    sign_in_as(user)
    visit post_path(post)
    click_on "delete-reply-#{reply.id}"

    expect(page).to have_content('Reply deleted!')
    expect(page).to_not have_content(reply.body)
  end
  scenario 'user tries deletes a reply that is not theirs' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post)
    reply = FactoryGirl.create(:reply, post: post)
    sign_in_as(user)
    visit post_path(post)

    expect(page).to_not have_content('delete-reply-#{reply.id}')
  end
end
