class CaptureRequestsController < ApplicationController
  include AlreadyExists
  include CreateRequest

  before_action only: :create do
    @already_exists = already_exists(params[:trap_id])
  end
  skip_before_action :verify_authenticity_token, only: :create

  #/:trap_id
  def create
    @trap = Trap.find_or_create_by(name: params[:trap_id])
    header = Hash.new
    request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
    @req = create_request(@trap, request.remote_ip, request.method, request.scheme, request.query_string,
                          request.query_parameters, request.cookies, header)

    WebsocketRails[:trap].trigger 'new', @trap unless @already_exists
    WebsocketRails[:request].trigger 'new', @req

    render nothing: true
  end

end
