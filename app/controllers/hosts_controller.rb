require "pry"
class HostsController < ApplicationController
  def index
    current_reataurant_id = request.headers['restaurantid']
    hosts = Host.all 
    hosts = hosts.select {|host| host.restaurant_id == current_reataurant_id.to_i}
    # binding.pry
    hosts_json = hosts.map{|host| {host: host, event_user: host.user, join_users: host.joins.select{|join| join.joined == true}.map{|join| join.user}, joins: host.joins.select{|join| join.joined == true}}}
    # binding.pry
    render json: hosts_json
  end

  def hostevents
    hosts = Host.all
    hosts = hosts.map{|host| {host: host, restaurant: host.restaurant, hoster: host.user}}
    render json: hosts
  end

  def create
    host = Host.create(
      user_id: params[:user_id], 
      restaurant_id: params[:restaurant_id], 
      date: params[:date], 
      time: params[:time], 
      party: params[:party]
    )
    if host.valid?
      host_json = {host: host, event_user: host.user, join_users: host.users}
      render json: host_json
    else
      render json: { errors: "failed to create"}
    end
  end

  def notification
    current_user_id = request.headers['userid']
    hosts = Host.all
    hosts = hosts.select{|host| host.user_id == current_user_id.to_i}
    hosts_json = hosts.map{|host| {joins: host.joins.map{|join| {join: join, user: join.user}}, host: host, restaurant_name: host.restaurant.name}}
    # binding.pry
    render json: hosts_json
  end

  def getmessages
    host_id = request.headers['hostid']
    host = Host.find(host_id)
    messages = host.messages.map{|message| {message: message, created_at: message.created_at}}
    # binding.pry
    render json: messages
  end

  def show
    host = Host.find(params[:id])
    render json: host
  end

  def update
    host = Host.find(params[:id])
    host.update(cancelled: params[:cancelled])
    render json: host
  end
end


