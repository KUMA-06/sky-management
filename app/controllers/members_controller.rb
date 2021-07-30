class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :tuor_find

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

  def destroy
    @member = Member.find(params[:id])
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
end