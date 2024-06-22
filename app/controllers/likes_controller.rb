class LikesController < ApplicationController
  before_action :authenticate_admin_user!

  def create
    if params[:likeable_type] == 'place'
      @likeable = Place.find(params[:likeable])
    elsif params[:likeable_type] == 'hotel'
      @likeable = Hotel.find(params[:likeable])
    end 
    @likeable.likes.create(like_by_id: current_admin_user.id)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("#{params[:likeable_type]}_#{@likeable.id}" , 
        partial: "likes/create", 
        locals: { likeable: @likeable }) } 
    end
  end
  
  def destroy?
  end

end 
