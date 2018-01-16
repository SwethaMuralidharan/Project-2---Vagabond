class CitiesController < ApplicationController

  def index
    @city=City.all
  end
  def show
   @city = City.find_by_id(params[:city_id])
  end
  def new
    @city=City.new
  end
end
