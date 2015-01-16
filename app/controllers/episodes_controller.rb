class EpisodesController < ApplicationController
  include Pundit

  before_action :set_episode, only: [:show]
  after_action :verify_authorized, except: :index

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all.published
    @tags = ActsAsTaggableOn::Tag.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = set_episode
    authorize @episode, :show?
  end

  def feed
    @episodes = Episode.all.published
    authorize @episode, :feed?
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.friendly.find(params[:id])
    end
end
