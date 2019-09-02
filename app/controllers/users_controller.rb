class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
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

  def show 
    current_user_id = request.headers['userid']
    user = User.find(current_user_id)
    hosts = Host.all
    joins = user.joins.map{|join| hosts.find(join.host_id)}
    # binding.pry
    render json: { user: user, hosts: user.hosts, joins: joins}
  end

end

