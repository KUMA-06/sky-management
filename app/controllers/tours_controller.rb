class ToursController < ApplicationController
  def index
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

  private

  def tour_params
    params.require(:tour).permit(:place)
  end

end
