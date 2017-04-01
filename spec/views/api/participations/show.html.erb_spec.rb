require 'rails_helper'

RSpec.describe "api/participations/show", type: :view do
  before(:each) do
    @api_participation = assign(:api_participation, Participation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
