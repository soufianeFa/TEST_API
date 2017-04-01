require 'rails_helper'

RSpec.describe "api/participations/index", type: :view do
  before(:each) do
    assign(:participations, [
      Participation.create!(),
      Participation.create!()
    ])
  end

  it "renders a list of api/participations" do
    render
  end
end
