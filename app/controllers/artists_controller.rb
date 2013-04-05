class ArtistsController < ApplicationController

  def index
    @artists =  case params[:order]
    when "name" then Artist.order("name").all
    when "newest" then Artist.order("created_at DESC").all
    else Artist.all
    end
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
    if (@artist.save)
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

end
