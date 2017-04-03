class Api::MessagesController < ApiController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    message = Message.new(message_params)
    participation = Participation.find_by(conversation_id: message.conversation_id)
    user = participation.users.where(id: current_user.id)
    if !user.empty?
      if message.save!
        message.update(user_id: current_user.id)
        render json: message, status: 201
      else
        render json: { errors: message.errors}, status: 422
      end
    else
      render json: { errors: message.errors}, status: 422
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    message = Message.find(params[:id])
    participation = Participation.find_by(conversation_id: message.conversation_id)
    user = participation.users.where(id: current_user.id)
    if !user.empty?
      if message.user == current_user and message.update!(message_params)
        render json: message, status: 200
      else
        render json: {message: "Vous n'avez pas le droit de modifier ce message."}, status: 422
      end
    end
  end

  def destroy
    message = Message.find(params[:id])
    participation = Participation.find_by(conversation_id: message.conversation_id)
    user = participation.users.where(id: current_user.id)
    if !user.empty?
      if message.user == current_user
        message.destroy
        head 204
      else
        render json: {message: "Vous n'avez pas le droit de supprimer ce message."}, status: 422
      end
    else
      render json: {message: "Vous n'avez pas le droit de supprimer ce message."}, status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params
        .require(:message)
        .permit(:conversation_id, :content)
    end
  end
