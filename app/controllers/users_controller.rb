class UsersController < ApplicationController
  def index
    @user = UserDecorator.find current_user
  end

  def show
    @user = UserDecorator.find_by_slug params[:id]
  end
end