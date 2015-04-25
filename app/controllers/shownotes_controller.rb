class ShownotesController < ApplicationController
  include Pundit

  before_action :set_episode, only: [:show]
  after_action :verify_authorized, except: :index

  def index
    @episodes = Episode.all.published
  end

  # GET /shownotes/1
  # GET /shownotes/1.json
  def show
    @episode = set_episode
    authorize @episode, :show?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.friendly.find(params[:id])
    end
end
