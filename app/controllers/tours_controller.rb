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
    # render 'hoge.js.erb'
    require "json"
    File.open('array.json') do |file|
      @json_data = JSON.load(file)
    end
    @dining_list = @json_data["dining"]
    # @d_wait = @json_data["dinner_wait"]
    # @d_prepare = @json_data["dinner_prepare"]
    # @bath = @json_data["bathing"]
    # @b_wait = @json_data["bath_wait"]
    # @esc = @json_data["escape"]
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
