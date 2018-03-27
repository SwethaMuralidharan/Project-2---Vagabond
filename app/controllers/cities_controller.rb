class CitiesController < ApplicationController
  def index
    @cities=City.all
    # @city.posts = @city.posts.sort_by { |obj| obj.created_at }
  end
  def new
    @city=City.new
  end
  def show
    @city = City.find_by_id(params[:city_id])
  end
end
