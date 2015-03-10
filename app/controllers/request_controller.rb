class RequestController < ApplicationController
  respond_to :json

  def show
    @request = Request.find_by(id: params[:id])
    if @request
      render json: @request.as_json
    end
  end
end
