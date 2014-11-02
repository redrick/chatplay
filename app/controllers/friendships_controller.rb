class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @friendship = Friendship.new(friend_id: params[:user], friend_to_id: current_user.id)

    if @friendship.save
      redirect_to :back, notice: 'You got new friend now :)'
    else
      redirect_to :back, alert: 'Unable to create friendship, that is sad :O'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to :back, notice: 'The guy is not your friend anymore :('
  end
end
