class TrapsController < ApplicationController
  respond_to :json

  # /traps.json
  def index
    @traps = Trap.all.order(created_at: :desc)
    respond_with @traps
  end

  # /traps/:trap_id/requests.json
  def show
    @trap = Trap.find_by(name: params[:trap_id])
    @requests = @trap.requests
    if @trap && @requests
      render json: {trapName: @trap.name, requests: @requests}
    else
      render text: 'Malformed url.'
    end
  end

  # /traps/:trap_id
  def capture_request
    already_exist = false
    already_exist = true if Trap.find_by(name: params[:trap_id])
    @trap = Trap.find_or_create_by(name: params[:trap_id])
    header = Hash.new
    request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
    @req = create_request(@trap, request.remote_ip, request.method, request.scheme, request.query_string,
                          request.query_parameters, request.cookies, header.as_json)
    WebsocketRails[:trap].trigger 'new', @trap unless already_exist
    WebsocketRails[:request].trigger 'new', @req

    render nothing: true
  end

  private
  def create_request (trap, remote_ip, request_method, scheme, query_string, query_params, cookies, headers)
    trap.requests.create(remote_ip: remote_ip, request_method: request_method,
                         scheme: scheme, query_string: query_string,
                         query_params: query_params, cookies: cookies, headers: headers)
  end
end
