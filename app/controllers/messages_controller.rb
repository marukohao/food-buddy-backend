class MessagesController < ApplicationController
  def index
    messages = Message.all 
    render json: messages
  end

  def create
    message = Message.create(
      user_name: params[:user_name], 
      host_id: params[:host_id], 
      message: params[:message],
      user_avatar: params[:user_avatar]
    )
    if message.valid?
      render json: message
    else
      render json: { errors: "failed to create join"}
    end
  end
end
