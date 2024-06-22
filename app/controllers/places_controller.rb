class PlacesController < ApplicationController
  def index
    @q = Place.includes(:likes).ransack(params[:q])
    @places = @q.result(distinct: true)
  end

  def show
    @place = Place.find(params[:id])
    @places_from_same_state = Place.where(state: @place.state).where.not(id: @place.id)
    @hotels_from_same_place = Hotel.where(city: @place.city)
  end
end