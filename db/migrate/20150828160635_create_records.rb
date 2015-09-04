class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :dns
      t.text :response

      t.timestamps null: false
    end
  end
end
