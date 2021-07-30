class MembersController < ApplicationController
  before_action :authenticate_user!
  before_action :tuor_find

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

    private

  def member_params
    params.require(:member).permit(:group, :nickname).merge(tour_id: params[:tour_id])
  end

  def tuor_find
    @tour = Tour.find(params[:tour_id])
  end
end