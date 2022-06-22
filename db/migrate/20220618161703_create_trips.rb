class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
