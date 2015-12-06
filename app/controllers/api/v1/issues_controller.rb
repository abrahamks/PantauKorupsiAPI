class Api::V1::IssuesController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  before_action :authenticate_moderator!, only: :verify
  before_action :set_issue, only: [:show, :update, :verify]
  respond_to :json

  def index
    q = Issue.ransack(params[:q])
    @issues = paginate q.result(distinct: true).page(params[:page]).per(params[:per_page])
  end

  def update
    @issue.update(issue_params)
    respond_with(@issue)
  end

  def show
  end

  def create
    issue = Issue.new(issue_params)
    issue.user_id = current_user.id
    if issue.save
      if params.has_key?(:actor)
        create_involvement(issue, params[:actor])
      end
      @issue = issue
      respond_with @issue
    else
      render json: { errors: issue.errors }, status:422
    end
  end

  def create_involvement(issue, params_actor)
    actor_ids = params_actor[:id].split(",").map(&:to_i)
    actor_ids.each do |actor_id|
      involvement = Involvement.new
      Involvement.create!(
        issue_id: issue.id, 
        actor_id: actor_id, 
        actor_status_id: 1
      )
    end
  end

  def verify
    logger.debug params
    logger.debug params[:issue_id]
    logger.debug params['issue_id']
    @issue = Issue.find(params[:issue_id])
    @issue.update(verifier_id: current_user.id)
    @issue.update(verified_at: Time.now)
    if @issue.save
      respond_with @issue
    else
      render json: { errors: @issue.errors }, status: 422
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.permit(
        :title, 
        :description, 
        :started_at, 
        :status_id, 
        :financial_cost, 
        actor_attributes: [:id])
      #   time_group_attributes: [:start_time, :end_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
      #   actor_attributes )
    end  
end
