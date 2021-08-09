class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tuor_find, only: [:show, :destroy]

  def index
    @tours = Tour.all

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
    @category = Category.new
    @categories = @tour.categories.includes(:tour)
    to_ary
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

  def to_ary
    dining_ary1 = Category.where(tour_id: @tour.id).pluck(:dining)
    @dining_ary2 = dining_ary1.compact

    dinner_wait_ary1 = Category.where(tour_id: @tour.id).pluck(:dinner_wait)
    @dinner_wait_ary2 = dinner_wait_ary1.compact

    dinner_preparation_ary1 = Category.where(tour_id: @tour.id).pluck(:dinner_preparation)
    @dinner_preparation_ary2 = dinner_preparation_ary1.compact

    bath_time_ary1 = Category.where(tour_id: @tour.id).pluck(:bath_time)
    @bath_time_ary2 = bath_time_ary1.compact

    bath_wait_ary1 = Category.where(tour_id: @tour.id).pluck(:bath_wait)
    @bath_wait_ary2 = bath_wait_ary1.compact

    escape_ary1 = Category.where(tour_id: @tour.id).pluck(:escape)
    @escape_ary2 = escape_ary1.compact
  end

end
