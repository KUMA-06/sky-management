class CategoriesController < ApplicationController
    before_action :tuor_find

  # def index
    # @status = Status.new
    # @messages = @room.messages.includes(:user)
  # end

  def create
    category_d1 = Category.where(dining: params[:category][:memberr]).or(Category.where(dinner_wait: params[:category][:memberr])).or(Category.where(dinner_preparation: params[:category][:memberr])).or(Category.where(bath_time: params[:category][:memberr])).or(Category.where(bath_wait: params[:category][:memberr])).or(Category.where(escape: params[:category][:memberr]))
    if category_d1.present?
      category_d2 = category_d1[0]
      category_d2.destroy
    end
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
    params.except(:memberr)
    params.require(:category).permit(:dining, :dinner_wait, :dinner_preparation, :bath_time, :bath_wait, :escape)
  end

end
