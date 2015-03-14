class RequestsController < ApplicationController
  respond_to :json

  # /traps/:trap_id/requests/:id.json
  def index
    @trap = Trap.find_by(name: params[:trap_id])
    @requests = @trap.requests
    if @trap && @requests
      render json: {trapName: @trap.name, requests: @requests}
    else
      render text: 'Malformed url.'
    end
  end

  # /traps/:trap_id/requests/:id
  def show
    @request = Request.find_by(id: params[:id])
    if @request
      respond_with @request
    else
      render text: 'Malformed url.'
    end
  end
end
