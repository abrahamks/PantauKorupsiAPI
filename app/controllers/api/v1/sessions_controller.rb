class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user_password = params[:password]
    user_email = params[:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in (:user)
      # logger.info (:user)
      # logger.info (user)
      user.generate_authentication_token!
      user.save
      render json: user
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
