require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Creating Tickets' do

  before do
    FactoryGirl.create(:project, name: 'TextMate 2')

    visit '/'
    click_link 'TextMate 2'
    click_link 'New Ticket'
  end

  scenario 'can create ticket' do
    fill_in 'Title', with: 'Non-standard compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
  end

  scenario 'can not create ticket without valid attributes' do
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Description can\'t be blank')
  end

  scenario 'can not create ticket with description less than 10 characters' do
    fill_in 'Title', with: 'Non-standard compliance'
    fill_in 'Description', with: 'it sucks'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content('Description is too short')
  end
end