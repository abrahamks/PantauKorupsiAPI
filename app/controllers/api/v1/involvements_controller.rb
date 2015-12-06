class Api::V1::InvolvementsController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  before_action :set_involvement, only: [:show, :update]
  def index
    involvements = Involvement.where(issue_id: params[:id])
    paginate json: involvements
  end

  def create
    if params.has_key?(:actor_id) && params.has_key?(:actor_status_id)
      @involvement = Involvement.new(involvement_params)
      if @involvement.save
        render json: @involvement
      else
        render json: { errors: involvement.errors }, status:422
      end
    else
      render json: { errors: 'No params actor nor issue' }, status:422
    end
  end

  def show
    render json: @involvement
  end

  private
    def set_involvement
      @involvement = Involvement.find(params[:id])
    end
    def involvement_params
      ap params
      params.permit(:actor_id,
                   :actor_status_id,
                   :issue_id)
    end
end
