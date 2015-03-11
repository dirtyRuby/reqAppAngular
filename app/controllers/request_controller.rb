class RequestController < ApplicationController
  respond_to :json

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
