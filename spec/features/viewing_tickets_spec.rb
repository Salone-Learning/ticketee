require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Viewing Tickets' do

  before do
    project = FactoryGirl.create(:project, name: 'TextMate 2')

    FactoryGirl.create(:ticket,
      project: project,
      title: 'Make it shiny!',
      description: 'Gradients! Starbursts!')

    project2 = FactoryGirl.create(:project, name: 'Internet Explorer')

    FactoryGirl.create(:ticket,
      project: project2,
      title: 'Standard compliance',
      description: 'Isn\'t a joke.')

    visit '/'
  end

  scenario 'should can view ticket' do
    click_link 'TextMate 2'

    expect(page).to have_content('Make it shiny!')
    expect(page).to_not have_content('Standard compliance')

    click_link 'Make it shiny!'
    within('#ticket h2') do
      expect(page).to have_content('Make it shiny!')
    end

    expect(page).to have_content('Gradients! Starbursts!')
  end
end