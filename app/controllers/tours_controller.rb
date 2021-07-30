class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tuor_find, only: [:show, :destroy]

  def index
    @tours = Tour.all
    dinner = []
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.create(tour_params)
    if @tour.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @members = @tour.members.includes(:tour)
  end

  def destroy
    @tour.destroy
    redirect_to root_path
  end

  private

  def tour_params
    params.require(:tour).permit(:place).merge(user_id: current_user.id)
  end

  def tuor_find
    @tour = Tour.find(params[:id])
  end

end
