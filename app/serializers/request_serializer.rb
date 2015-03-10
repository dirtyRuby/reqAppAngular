class RequestSerializer < ActiveModel::Serializer
  attributes :id, :remote_ip, :request_method,
             :scheme, :query_string, :query_params,
             :cookies, :headers, :created_at
end
