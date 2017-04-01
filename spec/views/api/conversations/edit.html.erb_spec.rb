require 'rails_helper'

RSpec.describe "api/conversations/edit", type: :view do
  before(:each) do
    @api_conversation = assign(:api_conversation, Conversation.create!())
  end

  it "renders the edit api_conversation form" do
    render

    assert_select "form[action=?][method=?]", api_conversation_path(@api_conversation), "post" do
    end
  end
end
