class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protected
  attr_reader :current_user
  def authenticate_user_by_token
    @current_user ||= Authentication::TokenValidator.new(
      request.headers["Authorization"]
    ).execute
    unless current_user && (request.headers["Authorization"] == @current_user.access_token)
      render json: { error: 'Access Denied.' }, status: 401
    end
  end
  def set_token
    @token ||= Authentication::Login.new(
      params[:user][:email], params[:user][:password]
    ).execute
  end
end
