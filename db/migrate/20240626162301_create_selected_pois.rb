class CreateSelectedPois < ActiveRecord::Migration[7.1]
  def change
    create_table :selected_pois do |t|
      t.string :trip_id
      t.string :poi
      t.integer :day

      t.timestamps
    end
  end
end
