class ApiController < ActionController::Base
  respond_to :json
  before_action :authenticate_user!
  attr_accessor :current_user
  prepend_around_filter ApiAuthorizedFilter.new
end

# app/models/api_authorized_filter.rb

class ApiAuthorizedFilter
  def before(controller)
    return true unless controller.params[:api_key]
    controller.current_user =
        User.find_by_api_key(controller.params[:api_key])
  end

  def after(controller)
    controller.current_user = nil
  end
end