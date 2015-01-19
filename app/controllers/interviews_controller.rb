class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @interviews = Interview.all
    respond_with(@interviews)
  end

  def show
    respond_with(@interview)
  end

  def new
    @interview = Interview.new
    respond_with(@interview)
  end

  def edit
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.save
    respond_with(@interview)
  end

  def update
    @interview.update(interview_params)
    respond_with(@interview)
  end

  def destroy
    @interview.destroy
    respond_with(@interview)
  end

  private
    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_params
      params[:interview]
    end
end
