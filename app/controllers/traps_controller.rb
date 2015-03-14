class TrapsController < ApplicationController
  respond_to :json

  # /traps.json
  def index
    @traps = Trap.all.order(created_at: :desc)
    respond_with @traps
  end

end
