class UsersController < ApplicationController
  def index
    users = User.all
    respond_with users
  end

  def show
    user = find_user
    respond_with user
  end

  def create
    user = User.create user_params
    respond_with user, location: nil
  end

  def update
    user = find_user
    user.update_attributes user_params

    respond_with user
  end

  def destroy
    user = find_user
    user.destroy

    respond_with user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :birthday, :color)
  end

  def find_user
    User.find params[:id]
  end
end
