class TrapsController < ApplicationController
  respond_to :json

  def index
    @traps = Trap.all.order(created_at: :desc)
    render json: @traps
  end

  def show
    @trap = Trap.find_by(name: params[:trap_id])
    @requests = @trap.requests
    render json: @requests
  end

  def capture_request
    @trap = Trap.find_or_create_by(name: params[:trap_id])
    header = Hash.new
    request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
    @req = create_request(@trap, request.remote_ip, request.method, request.scheme, request.query_string,
                          request.query_parameters, request.cookies, header)
    render nothing: true
  end

  private
  def create_request (trap, remote_ip, request_method, scheme, query_string, query_params, cookies, headers)
    trap.requests.create(remote_ip: remote_ip, request_method: request_method,
                         scheme: scheme, query_string: query_string,
                         query_params: query_params, cookies: cookies, headers: headers)
  end
end
