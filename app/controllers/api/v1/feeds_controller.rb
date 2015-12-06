class Api::V1::FeedsController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  before_action :authenticate_moderator!, only: :verify
  before_action :set_feed, only: [:show, :update]
  respond_to :json
  def index
    paginate json: Feed.where(issue_id: params[:issue_id])
  end

  def show
    render json: @feed
  end

  def create
    feed = Feed.new(feed_params)
    feed.user_id = current_user.id
    if feed.save
      render json: feed, status: 201
    else
      render json: { errors: feed.errors }, status: 422
    end
  end

  def update

  end

  def verify
    feed = Feed.find(params[:feed_id])
    feed.update(verifier_id: current_user.id)
    feed.update(verified_at: Time.now)
    if feed.save
      render json: feed, status: 201
    else
      render json: { errors: feed.errors }, status: 422
    end
  end

  private
    def set_feed
      ap params[:id]
      @feed = Feed.find(params[:id])
    end
    def feed_params
      params.permit(:title, :summary, :url, :occured_at, :issue_id)
    end
end
