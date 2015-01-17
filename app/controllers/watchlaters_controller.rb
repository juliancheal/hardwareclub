class WatchlatersController < ApplicationController
  before_action :set_watchlater, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @watchlaters = Watchlater.all.where(user: current_user.id)
    # @episodes = Episode.all.where(id: @watchlaters.map{|episode| episode.id})
  end

  def show
    respond_with(@watchlater)
  end

  # Nasty code, why are we creating here. Yuck
  def new
    @watchlater = Watchlater.new(watchlater_params)
    if Watchlater.where(user: @watchlater.user.id,
                    episode: @watchlater.episode.id) == nil
      @watchlater.save
    end
    respond_with(@watchlater)
  end

  def edit
  end

  def create
    @watchlater = Watchlater.new(watchlater_params)
    @watchlater.save
    respond_with(@watchlater)
  end

  def update
    @watchlater.update(watchlater_params)
    respond_with(@watchlater)
  end

  def destroy
    @watchlater.destroy
    respond_with(@watchlater)
  end

  private
    def set_watchlater
      @watchlater = Watchlater.find(params[:id])
    end

    def watchlater_params
      params[:watchlater]
      params.require(:watchlater).permit(:episode_id, :user_id)
    end
end
