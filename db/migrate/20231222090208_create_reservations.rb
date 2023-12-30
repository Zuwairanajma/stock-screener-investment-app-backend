class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true
      t.string :location
      t.date :reserve_date

      t.timestamps
    end
  end
end
