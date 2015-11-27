require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Signing Up' do

  scenario 'successful sign up' do
    visit '/'

    click_link 'Sign up'
    fill_in 'Email', with: 'steve@example.com'
    fill_in 'Password', with: 'hunter'
    fill_in 'Password confirmation', with: 'hunter'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
  end
end