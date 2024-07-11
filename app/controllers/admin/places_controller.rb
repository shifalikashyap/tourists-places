class Admin::PlacesController < ApplicationController

  def index
    @q = Place.includes(:likes).ransack(params[:q])
    @places = @q.result(distinct: true)
  end

  def show
    @place = Place.find(params[:id])
    @places_from_same_state = Place.where(state: @place.state).where.not(id: @place.id)
    @hotels_from_same_place = Hotel.where(city: @place.city)
  end

  def new
    @place = Place.new
  end

  def create 
    @place = Place.new(place_params)
    if @place.save
      redirect_to admin_places_path
    else 
      render :new
    end
  end


  def edit
    @place = Place.find(params[:id])
  end


  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to admin_places_path
    else
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to admin_places_path
  end

  def load_place_images
    @place = Place.find(params[:id])
    if params[:image_limit].present?
      @images = @place.images.last(params[:image_limit])
    else
      @images = @place.images
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("image-list-#{@place.id}" , 
        partial: "admin/places/load_place_images", 
        locals: { place: @place, images: @images }) } 
    end
  end

  # def load_min_images
  #   respond_to do |format|
  #     format.turbo_stream { render turbo_stream: turbo_stream.replace("image-list-#{@place.id}" , 
  #       partial: "admin/places/load_min_images", 
  #       locals: { place: @place }) } 
  #   end
  # end


  private

  def place_params
    params.require(:place).permit(:name, :state, :city, :image_url, :latitude, :longitude, :description, :image_url, images: [])
  end
end
