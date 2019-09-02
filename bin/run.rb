require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require 'pry'

#here we will put all of our methods to run

ApiUtils.get_restaurants_by_city

# cli = CliInterface.new
# cli.get_data