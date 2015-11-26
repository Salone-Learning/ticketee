require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

feature 'Deleting Tickets' do

  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project)}

  before do
    visit '/'
    click_link project.name
    click_link ticket.title
  end

  scenario 'can delete ticket' do
    click_link 'Delete Ticket'

    expect(page).to have_content('Ticket has been deleted.')
    expect(page.current_url).to eql(project_url(project))
  end

end