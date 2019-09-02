class JoinsController < ApplicationController
  def create
    join = Join.create(
      user_id: params[:user_id], 
      host_id: params[:host_id], 
      joined: params[:joined], 
      declined: params[:declined]
    )
    render json: join
  end
end
