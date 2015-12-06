class Api::V1::IssuesController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  before_action :authenticate_moderator!, only: :verify
  before_action :set_issue, only: [:show, :update]
  respond_to :json

  def index
    q = Issue.ransack(params[:q])
    issues = q.result(distinct: true).page(params[:page]).per(params[:per_page])
    paginate json: issues
  end

  def show
    render json: @issue
  end

  def create
    issue = Issue.new(issue_params)
    issue.user_id = current_user.id
    if issue.save
      render json: issue, status: 201
    else
      render json: { errors: issue.errors }, status:422
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end
    def issue_params
      params.permit(:title, :description, :started_at, :status_id)
    end  
end
