require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'User Profile' do

  scenario 'viewing' do
    user = FactoryGirl.create(:user)

    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end

feature 'Editing User' do
  scenario 'updating project'do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    click_link 'Edit Profile'

    fill_in 'Username', with: 'new_username'
    click_button 'Update Profile'

    expect(page).to have_content('Profile has been updated.')
  end
end