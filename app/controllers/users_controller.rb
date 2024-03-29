class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def index
    users = User.all
    render json: users
  end
 
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
 
  def create
    @user = User.create(username: params[:username], password: params[:password], avatar: params[:avatar], location: params[:location], bio: params[:bio])
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    user.update(username: params[:username], location: params[:location], bio: params[:bio])
    render json: user
  end

  def show 
    # current_user_id = request.headers['userid']
    user = User.find(params[:id])
    hosts = Host.all
    joins_json = user.joins.map{|join| 
      {joined: join.joined, 
        declined: join.declined, 
        host: hosts.find(join.host_id), 
        host_user: join.host.user,
        join_users: join.host.users.select{|user| user.joins.find_by(host_id: join.host_id).joined == true},
        restaurant_name: hosts.find(join.host_id).restaurant.name,
        restaurant_image: hosts.find(join.host_id).restaurant.image_url}}
    hosts_json = user.hosts.map{|host| {
      host: host, 
      restaurant_name: host.restaurant.name,
      restaurant_image: host.restaurant.image_url, 
      joined_users: host.joins.select{|join| join.joined == true}.map{|join| join.user}}}
    # binding.pry
    render json: { user: user, hosts: hosts_json, joins: joins_json}
  end

end

