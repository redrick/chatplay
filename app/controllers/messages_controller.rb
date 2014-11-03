class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @new_message = Message.new
    @messages = Message.where(friendship_id: params[:id])
    @friendship = Friendship.find params[:id]
  end

  def create
    @message = Message.create(message_params)
  end

  private

    def message_params
      params.require(:message).
        permit(:content, :friendship_id, :user_id, :receiver_id)
    end
end
