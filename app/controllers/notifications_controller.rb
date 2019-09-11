class NotificationsController < ApplicationController
  def index
    notifications = Notification.all
    render json: notifications
  end

  def create
    notifications = Notification.all
    notification = notifications.select{|notification| notification.user_id == params[:user_id] && notification.host_id == params[:host_id]}
    # binding.pry
    if notification.length > 0
      notification[0].update(new: params[:new])
      render json: notification
    else
      notification = Notification.create(
        user_id: params[:user_id], 
        host_id: params[:host_id], 
        new: params[:new]
      )
      if notification.valid?
        render json: notification
      else
        render json: { errors: "failed to create join"}
      end
    end
  end

  def update
    notification = Notification.find(params[:id])
    notification.update(new: params[:new])
    render json: notification
  end

end
