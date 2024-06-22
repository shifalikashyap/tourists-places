class HotelsController < ApplicationController
  def index
    @hotels = Hotel.where(city: params[:city])
  end

  def show
    @hotel = Hotel.find(params[:id])
    @hotels = Hotel.where(city: params[:city])
    @places_in_same_city = Place.where(city: @hotel.city).where.not(id: @hotel.id)
  end
end
