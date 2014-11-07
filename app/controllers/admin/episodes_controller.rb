class Admin::EpisodesController < ApplicationController
  include Pundit
  
  before_action :set_episode, only: [:show, :edit, :update, :destroy]
  
  after_action :verify_authorized

  # GET /episodes
  # GET /episodes.json
  def index
    authorize Episode, :index?
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = Episode.find(params[:id])
    authorize @episode, :show?
  end

  # GET /episodes/new
  def new
    authorize Episode, :create?
    @episode = Episode.new
  end

  # GET /episodes/1/edit
  def edit
    authorize Episode, :edit?
  end

  # POST /episodes
  # POST /episodes.json
  def create
    authorize Episode, :create?
    @episode = Episode.new(episode_params)

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @episode }
      else
        format.html { render :new }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    authorize @episode, :update?
    respond_to do |format|
      if @episode.update(episode_params)
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { render :show, status: :ok, location: @episode }
      else
        format.html { render :edit }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    authorize @episode, :destroy?
    @episode.destroy
    respond_to do |format|
      format.html { redirect_to episodes_url, notice: 'Episode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:name, :description, :notes, :published_at, :seconds, :published, :tag_list)
    end
end
