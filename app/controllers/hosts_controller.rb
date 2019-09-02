require "pry"
class HostsController < ApplicationController
  def index
    current_reataurant_id = request.headers['restaurantid']
    hosts = Host.all 
    hosts = hosts.select {|host| host.restaurant_id == current_reataurant_id.to_i}
    hosts_json = hosts.map{|host| {host: host, event_user: host.user, join_users: host.users}}
    # binding.pry
    render json: hosts_json
  end

  def create
    host = Host.create(
      user_id: params[:user_id], 
      restaurant_id: params[:restaurant_id], 
      date: params[:date], 
      time: params[:time], 
      party: params[:party]
    )
    puts host
    render json: host
  end

  def show
    host = Host.find(params[:id])
    render json: host
  end
end
