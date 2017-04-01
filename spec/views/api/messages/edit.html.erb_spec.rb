require 'rails_helper'

RSpec.describe "api/messages/edit", type: :view do
  before(:each) do
    @api_message = assign(:api_message, Message.create!())
  end

  it "renders the edit api_message form" do
    render

    assert_select "form[action=?][method=?]", api_message_path(@api_message), "post" do
    end
  end
end
