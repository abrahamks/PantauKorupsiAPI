module Authenticable

  # Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: auth_token)
  end

  def auth_token
    request.headers['Authorization'].split(' ')[1]
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end

  def authenticate_moderator!
    render json: { errors: "Not authenticated as a moderator" },
                status: :unauthorized unless current_user.moderator?
  end
end