require 'rest-client'
require 'json'
require 'pry'

class ApiUtils

  def self.get_restaurants_by_city
    puts "Here are the job results that returned"
    city_array = ["seattle", "boston", "sf", "la", "portland", "miami"]
    city_array.each do |city|
      url = "https://api.yelp.com/v3/businesses/search?location=" + city 
      resp = RestClient.get(url, headers={authorization: "Bearer 6d-T3xU_kI8nHO9NA7pssd8R98ptNV8KA61wRX3a74Oir-cL_D8VwRsIAcTSW3vIVG8onFO71bRPZF84MvySKLhlabYl4GNOWKRIO_B9MMn4A51KVWsgh7m6qbBmXXYx"})
      restaurant_info = JSON.parse(resp)
      # puts restaurant_info["businesses"].first
      list_of_restaurants = []
      restaurant_info["businesses"].each do |restaurant_data|
        puts restaurant_data["name"]
        name = restaurant_data["name"]
        location = restaurant_data["location"]["city"]
        image_url = restaurant_data["image_url"]
        category = restaurant_data["categories"][0]["alias"]
        list_of_restaurants << Restaurant.create(name: name, location: location, image_url: image_url, category: category )
        puts list_of_restaurants
      end
    end
  end

end

  # response = RestClient.post "https://api.themoviedb.org/4/list", '{"name": "NEW_NAME12323","iso_639_1": "en"}', {content_type: "application/json;charset=utf-8", authorization: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1MTk4NDYyNzYsInN1YiI6IjVhOGNhNDBmOTI1MTQxMGIwMTA4ZjUzNiIsImp0aSI6IjY5OTkxOCIsImF1ZCI6IjEyMDgyMWY2ZDIxOTE4Y2Y1NzA1MGNmOWU4Y2Q0ZDBhIiwic2NvcGVzIjpbImFwaV9yZWFkIiwiYXBpX3dyaXRlIl0sInZlcnNpb24iOjF9.4B-StWrStNmjIUI7f4BBKej4dGJCIW6oK3lR-W-5o8A"}
  # response = RestClient.post "https://api.themoviedb.org/4/list", request, {content_type: "application/json;charset=utf-8", authorization: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1MTk4NDYyNzYsInN1YiI6IjVhOGNhNDBmOTI1MTQxMGIwMTA4ZjUzNiIsImp0aSI6IjY5OTkxOCIsImF1ZCI6IjEyMDgyMWY2ZDIxOTE4Y2Y1NzA1MGNmOWU4Y2Q0ZDBhIiwic2NvcGVzIjpbImFwaV9yZWFkIiwiYXBpX3dyaXRlIl0sInZlcnNpb24iOjF9.4B-StWrStNmjIUI7f4BBKej4dGJCIW6oK3lR-W-5o8A"}
