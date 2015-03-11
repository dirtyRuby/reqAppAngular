class Request < ActiveRecord::Base
  serialize :headers
  serialize :cookies
  serialize :query_params

  belongs_to :trap
end
