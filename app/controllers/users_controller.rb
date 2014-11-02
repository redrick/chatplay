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
    user_ids = Friendship.where('friend_to_id = ? OR friend_id = ?', current_user.id, current_user.id).pluck(:friend_id)
    user_ids << Friendship.where('friend_to_id = ? OR friend_id = ?', current_user.id, current_user.id).pluck(:friend_to_id)
    user_ids = user_ids.flatten.reject{|id| id == current_user.id}
    @users = user_ids.empty? ? [] : User.find(user_ids) 
    render 'index'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
