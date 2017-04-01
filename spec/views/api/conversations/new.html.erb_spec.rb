require 'rails_helper'

RSpec.describe "api/conversations/new", type: :view do
  before(:each) do
    assign(:api_conversation, Conversation.new())
  end

  it "renders new api_conversation form" do
    render

    assert_select "form[action=?][method=?]", conversations_path, "post" do
    end
  end
end
