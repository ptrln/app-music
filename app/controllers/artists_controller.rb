class ArtistsController < ApplicationController

  def index
    cond = (params[:search] ? [:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"]] : [:all])
    @artists =  case params[:order]
    when "name" then Artist.order("name").find(*cond)
    when "newest" then Artist.order("created_at DESC").find(*cond)
    else Artist.find(*cond)
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
