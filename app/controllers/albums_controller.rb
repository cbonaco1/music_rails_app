class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @albums = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_url
    else
      render :new
    end
  end

  def edit
    @album = @album = Album.find(params[:id])
  end


  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
end
