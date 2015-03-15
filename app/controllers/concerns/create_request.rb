module CreateRequest
  extend ActiveSupport::Concern

  def create_request (trap, remote_ip, request_method, scheme, query_string, query_params, cookies, headers)
    trap.requests.create(remote_ip: remote_ip, request_method: request_method,
                         scheme: scheme, query_string: query_string,
                         query_params: query_params, cookies: cookies, headers: headers)
  end
end