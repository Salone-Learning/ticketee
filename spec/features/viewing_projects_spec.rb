require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Viewing Projects' do

  scenario 'can view all projects' do
    project = FactoryGirl.create(:project, name: "TextMate2")

    visit '/'
    click_link 'TextMate2'
    expect(page.current_url).to eql(project_url(project))
  end
end