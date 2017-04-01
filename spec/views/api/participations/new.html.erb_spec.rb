require 'rails_helper'

RSpec.describe "api/participations/new", type: :view do
  before(:each) do
    assign(:api_participation, Participation.new())
  end

  it "renders new api_participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do
    end
  end
end
