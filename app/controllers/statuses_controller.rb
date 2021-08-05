class StatusesController < ApplicationController
  before_action :tuor_find

  def index
    @status = Status.new
    @messages = @room.messages.includes(:user)
  end

  def create
    @status = @tour.statuses.new(status_params)
    if @status.save
      redirect_to tour_path(@tour)
    end
  end

  private

  def tuor_find
    @tour = Tour.find(params[:tour_id])
  end

  def status_params
    params.require(:status).permit(:dining, :dinner_wait, :dinner_preparation, :bath_time, :bath_wait, :escape)  # マージメンバーID?
  end

end