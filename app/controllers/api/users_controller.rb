class Api::UsersController < ApiController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # POST /users
  # POST /users.json
  def show
    respond_with User.find(params[:id])
  end
end
