require 'rails_helper'

feature 'user adds a new post', %Q(
As a user
I want to add a new post.
) do

  scenario 'user can add a post' do

    user = FactoryGirl.build(:user)
    post = FactoryGirl.build(:post)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    visit new_post_path

    fill_in 'post_title', with: post.title
    fill_in 'post_body', with: post.body
    click_on 'Submit'
    expect(page).to have_content(post.title)
  end
  scenario 'user cant add a new post without a body' do

    user = FactoryGirl.build(:user)
    post = FactoryGirl.build(:post)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    visit new_post_path

    fill_in 'post_title', with: post.title
    click_on 'Submit'
    expect(page).to have_content('Body can\'t be blank')
  end
    scenario 'user cant add a new post without a title' do

    user = FactoryGirl.build(:user)
    post = FactoryGirl.build(:post)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    visit new_post_path

    fill_in 'post_body', with: post.body
    click_on 'Submit'
    expect(page).to have_content('Title can\'t be blank')
  end
end
