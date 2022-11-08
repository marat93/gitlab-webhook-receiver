class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.new

    if @user.authenticate(login_params[:password])
      time = Time.now + 1.hour.to_i
      token = JsonWebToken.encode(expires_at: time)

      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M") }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def info
    render json: @current_user
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
