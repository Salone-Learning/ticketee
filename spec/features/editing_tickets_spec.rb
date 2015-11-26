require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Editing Tickets' do

  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project)}

  before do
    visit '/'
    click_link project.name
    click_link ticket.title
    click_link 'Edit Ticket'
  end

  scenario 'should can edit ticket' do
    fill_in 'Title', with: 'Make it really shiny!'
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket has been updated.')

    within('#ticket h2') do
      expect(page).to have_content('Make it really shiny!')
    end

    expect(page).to_not have_content(ticket.title)
  end

  scenario 'can not update ticket with invalid attributes' do
    fill_in 'Title', with: ''
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket has not been updated.')
  end
end