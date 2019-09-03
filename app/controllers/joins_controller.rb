class JoinsController < ApplicationController
  def create
    join = Join.create(
      user_id: params[:user_id], 
      host_id: params[:host_id], 
      joined: params[:joined], 
      declined: params[:declined]
    )
    if join.valid?
      render json: host
    else
      render json: { errors: "failed to create join"}
    end
  end

  def notification
    current_user_id = request.headers['userid']
    joins = Join.all
    joins = joins.select{|join| join.user_id == current_user_id.to_i}
    joins_json = joins.map{|join| {join: join, host: join.host, restaurant_name: join.host.restaurant.name}}
    # binding.pry
    render json: joins_json
  end

  def update
    join = Join.find(params[:id])
    join.update(joined: params[:joined], declined: params[:declined])
    render json: join
  end
end
