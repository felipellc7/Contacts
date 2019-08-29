class ContactsController < ApplicationController
	before_action :authenticate_user_by_token
  before_action :current_contact, only: [:show, :update, :destroy]

  def index
		render json: @current_user.contacts, status: 200
  end

  def show
    if @contact
      render json: @contact, status: 200
    else
      render json: { status: 404, errors: [ { details: @contact.errors } ] }, status: 404
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.user = @current_user
    if @contact.save
      render json: @contact, status: 201
    else
      render json: { status: 422, errors: [ { details: @contact.errors } ] }, status: 422
    end
  end

  def update
    if @contact
      if @contact.update_attributes(contacts_params)
        render json: @contact, status: :ok
      else
        render json: { status: 422, errors: [ { details: @contact.errors } ] }, status: 422
      end
    else
      render json: { status: 404, errors: [ { details: @contact.errors } ] }, status: 404
    end
  end

  def destroy
    if @contact
      if @contact.destroy
        render json: {}, status: 200
      else
        render json: { status: 422, errors: [ { details: @contact.errors } ] }, status: 422
      end
    else
      render json: { status: 404, errors: [ { details: @contact.errors } ] }, status: 404
    end
  end

  private

  def contacts_params
    params.require(:contact).permit(
      :name,
      :email,
      :phone,
      :address,
      :social_networks
    )
  end

  def current_contact
    @contact = @current_user.contacts.find_by_id params[:id]
  end
end
