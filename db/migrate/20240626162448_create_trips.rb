class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :destination_id
      t.string :acomodation_id
      t.integer :stay
      t.string :user_name
      t.boolean :published

      t.timestamps
    end
  end
end
