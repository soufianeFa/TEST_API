require 'rails_helper'

RSpec.describe "api/messages/show", type: :view do
  before(:each) do
    @api_message = assign(:api_message, Message.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
