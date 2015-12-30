class TracksController < ApplicationController
  def new
    # @track = Track.find(params[:id])
    @album = Album.find(params[:album_id])
    @track = Track.new
    @track.album_id = @album.id
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      # redirect_to user_url()
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :lyrics, :track_type, :name)
  end
end
