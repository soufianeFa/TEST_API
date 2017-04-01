require 'rails_helper'

RSpec.describe "api/messages/new", type: :view do
  before(:each) do
    assign(:api_message, Message.new())
  end

  it "renders new api_message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do
    end
  end
end
