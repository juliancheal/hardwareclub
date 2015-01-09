class StaticPagesController < ApplicationController
  
  def home
    @episodes = Episode.all.published.limit(4)
  end
  
  def about
  end
end
