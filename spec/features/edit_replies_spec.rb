require 'rails_helper'

feature 'only current_user edits a reply', %Q(
As a user
I want to remove a reply from the site
So that I can hide my shame from the world
) do

scenario 'user edits a reply' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post, user: user)
    reply = FactoryGirl.create(:reply, post: post, user: user)
    sign_in_as(user)
    visit post_path(post)
    within "#editing-reply-#{reply.id}" do
      fill_in 'reply_body', with: 'such wowzors'
    end
    click_on 'Save changes'

    expect(page).to have_content('Changes saved!')
    expect(page).to have_content('such wowzors')
  end
  scenario 'user tries edits a reply that is not theirs' do
    user = FactoryGirl.create(:user)

    post = FactoryGirl.create(:post)
    reply = FactoryGirl.create(:reply, post: post)
    sign_in_as(user)
    visit post_path(post)

    expect(page).to have_content(reply.body)
    expect(page).to_not have_button('Save changes')
  end
end
