class SinglesController < ApplicationController

  def index
    cond = (params[:search] ? [:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"]] : [:all])
    @singles = case params[:order]
    when "name" then Single.order("title").find(*cond)
    when "writer" then Single.joins(:writer).order("artists.name").find(*cond)
      when "newest" then Single.order("created_at DESC").find(*cond)
    else Single.find(*cond)
    end
  end

  def new
    p = {}
    params.select do |k, v| 
      p[k] = v if  Single.column_names.include?(k)
      p["writer_id"] = v if k == "artist_id"
    end 
    @single = Single.new(p)
    @writers = Artist.all
  end

  def create
    @single = Single.new(params[:single])
    if @single.save
      redirect_to single_path(@single)
    else
      @writers = Artist.all
      render :new
    end
  end

  def show
    @single = Single.find(params[:id])
  end

  def edit
    @single = Single.find(params[:id])
    @writers = Artist.all
  end

  def update
    @single = Single.find(params[:id])
    if @single.update_attributes(params[:single])
      redirect_to single_path(@single)
    else
      @writers = Artist.all
      render :edit
    end
  end

end
