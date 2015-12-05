class Api::V1::OrganizationsController < Api::V1::BaseController
  before_action :authenticate_with_token!, only: :create
  respond_to :json
  def index
    # localhost:3000/v1/organizations?q[name_cont]=Z
    q = Organization.ransack(params[:q])
    organizations = q.result(distinct: true).page(params[:page]).per(params[:per_page])
    paginate json: organizations
  end

  def create
    organization = Organization.new(organization_params)
    if organization.save
      render json: organization, status: 201
    else
      render json: { errors: organization.errors }, status: 422
    end
  end

  private
    def organization_params
      params.permit(:name, :organization_url, :description)
    end
end
