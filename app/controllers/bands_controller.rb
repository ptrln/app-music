class BandsController < ApplicationController

  def index
    @bands =  case params[:order]
    when "name" then Band.order("name").all
    when "newest" then Band.order("created_at DESC").all
    else Band.all
    end
  end

  def new
    @band = Band.new
    @artists = Artist.all
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to band_path(@band)
    else
      @artists = Artist.all
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
    @artists = Artist.all
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(params[:band])
      redirect_to band_path(@band)
    else
      @artists = Artist.all
      render :edit
    end
  end

end
