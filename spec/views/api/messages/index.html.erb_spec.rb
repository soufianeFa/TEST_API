require 'rails_helper'

RSpec.describe "api/messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(),
      Message.create!()
    ])
  end

  it "renders a list of api/messages" do
    render
  end
end
