require 'spec_helper'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
end

describe ProjectsController do
  it "displays an error for a missing project" do
    get :show, id: "not-here"
    expect(response).to redirect_to(projects_path)

    message = "Project you are looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end
