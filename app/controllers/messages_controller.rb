class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @new_message = Message.new
    @messages = Message.where(friendship_id: params[:id])
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to :back
    else
      redirect_to :back, alert: 'Nope not speaking with you'
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :friendship_id, :user_id)
    end
end
