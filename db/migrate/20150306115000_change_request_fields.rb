class ChangeRequestFields < ActiveRecord::Migration
    def down
      change_column :requests, :headers, :string
      change_column :requests, :cookies, :string
      change_column :requests, :query_params, :string
    end

    def up
      change_column :requests, :headers, :binary
      change_column :requests, :cookies, :binary
      change_column :requests, :query_params, :binary
    end
end
