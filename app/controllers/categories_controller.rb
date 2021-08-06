class CategoriesController < ApplicationController
    before_action :tuor_find

  # def index
    # @status = Status.new
    # @messages = @room.messages.includes(:user)
  # end

  def create
    @category = @tour.categories.new(category_params)
    if @category.save
      redirect_to tour_path(@tour)
    end

  end

  private

  def tuor_find
    @tour = Tour.find(params[:tour_id])
  end

  def category_params
    params.require(:category).permit(:dining, :dinner_wait, :dinner_preparation, :bath_time, :bath_wait, :escape)  # マージメンバーID?
  end
end
