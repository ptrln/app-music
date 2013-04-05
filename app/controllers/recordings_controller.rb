class RecordingsController < ApplicationController

  def index
    cond = (params[:search] ? [:all, :conditions => ['singles.title LIKE ?', "%#{params[:search]}%"]] : [:all])

    @recordings = case params[:order]
    when "name" then Recording.joins(:single).order("singles.title").find(*cond)
    when "band" then Recording.joins(:band, :single).order("bands.name").find(*cond) #REV: perhaps should move into the model
    when "newest" then Recording.joins(:single).order("created_at DESC").find(*cond)
    else Recording.joins(:single).find(*cond)
    end
  end

  def new
    p = params.select { |param| Recording.column_names.include?(param) }
    @recording = Recording.new(p)
    @singles = Single.order(:title).all
    @bands = Band.order(:name).all
  end

  def create
    @recording = Recording.new(params[:recording])
    if @recording.save
      redirect_to recording_path(@recording)
    else
      render :new
    end
  end

  def edit
    @recording = Recording.find(params[:id])
    @singles = Single.order(:title).all
    @bands = Band.order(:name).all
  end

  def update
    @recording = Recording.find(params[:id])
    if @recording.update_attributes(params[:recording])
      redirect_to recording_path(@recording)
    else
      render :edit
    end
  end

  def show
    @recording = Recording.find(params[:id])
  end

end
