require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Editing Projects' do

  before do
    FactoryGirl.create(:project, name: "TextMate 2")

    visit '/'
    click_link 'TextMate 2'
    click_link 'Edit Project'
  end

  scenario 'can edit a project' do
    fill_in "Name", with: "TextMate 2 beta"
    click_button "Update Project"

    expect(page).to have_content("Project has been updated.")
  end

  scenario 'can not edit a project' do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content("Project has not been updated.")
  end
end