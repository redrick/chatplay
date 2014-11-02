class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def friends
    user_ids = Friendship.where(friend_to: current_user).pluck(:friend_id)
    @users = User.find(user_ids)
    render 'index'
  end

end
