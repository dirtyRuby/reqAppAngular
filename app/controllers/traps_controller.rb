class TrapsController < ApplicationController


  def index
    @traps = Trap.all.order(created_at: :desc)
    render json: @traps
  end

  def show
    @trap = Trap.find_by(id: params[:id])
    render json: @trap
  end
end
