require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Deleting Projects' do

  scenario 'can delete a project' do
    FactoryGirl.create(:project, name: "TextMate2")

    visit '/'
    click_link 'TextMate2'
    click_link 'Delete Project'

    expect(page).to have_content("Project has been deleted.")

    visit '/'
    expect(page).to have_no_content("TextMate2")
  end
end