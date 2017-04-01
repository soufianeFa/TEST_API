require 'rails_helper'

RSpec.describe "api/participations/edit", type: :view do
  before(:each) do
    @api_participation = assign(:api_participation, Participation.create!())
  end

  it "renders the edit api_participation form" do
    render

    assert_select "form[action=?][method=?]", api_participation_path(@api_participation), "post" do
    end
  end
end
