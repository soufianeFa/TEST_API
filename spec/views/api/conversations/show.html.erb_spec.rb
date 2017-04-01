require 'rails_helper'

RSpec.describe "api/conversations/show", type: :view do
  before(:each) do
    @api_conversation = assign(:api_conversation, Conversation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
