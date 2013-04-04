class RecordingsController < ApplicationController

  def index
    @recordings = Recording.all
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
