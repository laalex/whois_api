class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token
      t.string :api_key

      t.timestamps null: false
    end
  end
end
