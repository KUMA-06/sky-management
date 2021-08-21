class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :tuor_find
  before_action :member_find, only: [:edit, :update, :destroy]

  def new
    @member = Member.new
  end

  def create
    @member = @tour.members.new(member_params)
    if @member.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @member.update(member_params)
      redirect_to tour_path(@tour)
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to tour_path(@tour)
  end

    private

  def member_params
    params.require(:member).permit(:group, :nickname).merge(tour_id: params[:tour_id])
  end

  def tuor_find
    @tour = Tour.find(params[:tour_id])
  end

  def member_find
    @member = Member.find(params[:id])
  end
end