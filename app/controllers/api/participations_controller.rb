class Api::ParticipationsController < ApiController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  # GET /participations
  # GET /participations.json
  def index
    @participations = Participation.all
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end

  # GET /participations/new
  def new
    @participation = Participation.new
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  # POST /participations.json
  def create
    participation = Participation.new(participation_params)
    conversation = Conversation.find(participation.conversation_id)
    if conversation.user == current_user
      if  participation.save!
        render json: participation, status: 201
      else
        render json: { errors: participation.errors}, status: 422
      end
    else
      render json: {message: "Vous n'avez pas le droit de créer une participation dans cette conversation."}, status: 422
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    participation = Participation.find(params[:id])
    conversation = Conversation.find(participation.conversation_id)
    user = participation.users.where(id: current_user.id)
    if !user.empty? or conversation.user == current_user
      if participation.update!(participation_params)
        render json: participation, status: 200
      else
        render json: { errors: participation.errors}, status: 422
      end
    else
      render json: {message: "Vous n'avez pas le droit de modifier la participation de cette conversation."}, status: 422
    end
  end

  def destroy
    participation = Participation.find(params[:id])
    conversation = Conversation.find(participation.conversation_id)
    if conversation.user == current_user
      participation.destroy
      head 204
    else
      render json: {message: "Vous n'avez pas le droit de supprimer la participation."}, status: 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

  def participation_params
    params
        .require(:participation)
        .permit(:conversation_id, :user_ids =>[])
  end

end
