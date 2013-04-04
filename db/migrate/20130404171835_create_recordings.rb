class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.integer :band_id, null: false
      t.integer :single_id, null: false

      t.timestamps
    end
  end
end
