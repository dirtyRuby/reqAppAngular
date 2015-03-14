class CaptureRequestsController < ApplicationController
  extend ActiveSupport::Concern
  include CaptureRequestsHelpers

  before_action :already_exists, only: :create
  skip_before_action :verify_authenticity_token

  #/:trap_id
  def create
    @trap = Trap.find_or_create_by(name: params[:trap_id])
    header = Hash.new
    request.headers.each { |key, value| header[key] = value.to_s unless value.is_a?(Hash) }
    @req = create_request(@trap, request.remote_ip, request.method, request.scheme, request.query_string,
                          request.query_parameters, request.cookies, header)
    WebsocketRails[:trap].trigger 'new', @trap unless already_exists
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
