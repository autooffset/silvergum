class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :customer_id,       null: false
      t.integer :provider_id,       null: false
      t.string  :access_key_id,     null: false
      t.string  :secret_access_key, null: false
      t.timestamps
    end

    add_index :credentials, :customer_id
    add_index :credentials, :provider_id
  end
end
