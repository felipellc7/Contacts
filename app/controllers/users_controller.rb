class UsersController < ApplicationController
  before_action :authenticate_user_by_token, except: [:sign_in, :sign_up]
  def sign_in
    set_token
    @user = User.find_by_email(u_params[:email])
    if @token
      @user.update_columns access_token: @token
      render json: set_response, status: 200
    else
      render json: { error: 'Invalid user.' }, status: 401
    end
  end
  def sign_up
    if user_exists?
      render json: {error: "Email already taken"}, status: 401
    else
      ## Create New User
      @user = User.create(u_params)
      ## Save to access_token column in Spree::User
      set_token
      @user.access_token = @token
      if @user.save
        render json: set_response, status: 201
      else
        render json: @user.errors, status: 422
      end
    end
  end
  def sign_out
    if @current_user.access_token.present?
      @current_user.update_columns access_token: nil
      render json: {}, status: 200
    else
      render json: { error: 'Invalid Action.' }, status: 401
    end
  end

  def profile
    data = open(File.join('./public', @current_user.photo.url))
    send_data data.read, type: @current_user.photo.content_type, disposition: 'inline'
  end
  private
  def user_exists?
    User.exists?(email: u_params[:email])
  end
  def u_params
    # params.require(:user).permit(:email, :password, :name, :address, :phone, :photo)
    params.permit(:email, :password, :name, :address, :phone, :photo)
  end
  def set_response
    response = {
      id: @user.id,
      name: @user.name,
      email: @user.email,
      address: @user.address,
      phone: @user.phone,
      photo_url: @user.photo.url,
      access_token: @user.access_token
    }
  end
end
