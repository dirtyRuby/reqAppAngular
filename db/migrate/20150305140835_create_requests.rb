class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.string :remote_ip
      t.string :request_method
      t.string :scheme
      t.string :query_string
      t.binary :query_params
      t.binary :cookies
      t.binary :headers
      t.integer :trap_id

      t.timestamps null: false
    end
  end

  def down
    drop_table :requests
  end
end
