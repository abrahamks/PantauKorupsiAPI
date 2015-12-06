class Api::V1::ActorsController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  before_action :set_actor, only: [:show, :update]
  respond_to :json
  def index
    # localhost:3000/v1/actors?q[name_cont]=Z
    q = Actor.ransack(params[:q])
    actors = q.result(distinct: true).page(params[:page]).per(params[:per_page])
    paginate json: actors
  end

  def update
    @actor.update(actor_params)
    respond_with(@actor)
  end

  def show
  end

  def create
    actor = Actor.new(actor_params)
    if actor.save
      render json: actor, status: 201
    else
      render json: { errors: actor.errors }, status: 422
    end
  end

  private
    def set_actor
      @actor = Actor.find(params[:id])
    end
    def actor_params
      params.permit(:name, :profile_url, :description)
    end
end
