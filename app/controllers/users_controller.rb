class UsersController < ApplicationController
  respond_to :json

  def index
    users = User.all
    respond_with users
  end

  def show
    user = User.find params[:id]
    respond_with user
  end

  def create
    user = User.create user_params
    respond_with user, location: nil
  end

  def update
    user = User.find params[:id]
    user.update_attributes user_params

    respond_with user
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    respond_with user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :birthday, :color)
  end
end
