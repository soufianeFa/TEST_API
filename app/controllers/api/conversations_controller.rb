class Api::ConversationsController < ApiController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save!
      conversation.update(user_id: current_user.id)
      render json: conversation, status: 201
    else
      render json: { errors: conversation.errors}, status: 422
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    conversation = Conversation.find(params[:id])
    if conversation.user == current_user and conversation.update!(conversation_params)
      render json: conversation, status: 200
    else
      render json: { errors: conversation.errors}, status: 422
    end
  end

  def destroy
    conversation = Conversation.find(params[:id])
    if conversation.user == current_user
      Message.where(conversation_id: conversation.id).destroy_all
      Participation.where(conversation_id: conversation.id).destroy_all
      conversation.destroy
      head 204
    else
      render json: {message: "Vous n'avez pas le droit de supprimer la conversation."}, status: 422
    end
  end

  private

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

  def conversation_params
    params
        .require(:conversation)
        .permit(:subject)
  end

end
