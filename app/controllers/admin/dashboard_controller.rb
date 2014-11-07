class Admin::DashboardController < ApplicationController
  include Pundit
  
  after_action :verify_authorized
  
  def index
    authorize User, :index?
  end
end
