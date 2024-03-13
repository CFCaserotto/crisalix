class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.datetime :date, null: false
      t.time :time
      t.string :photo1
      t.string :photo2
      t.string :photo3

      t.timestamps
    end
  end
end
