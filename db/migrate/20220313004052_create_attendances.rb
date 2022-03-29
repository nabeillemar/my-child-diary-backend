class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.string :date
      t.string :check_in
      t.string :check_out
      t.string :lunch
      t.string :snack
      t.string :bathroom
      t.text :day_summary

      t.timestamps
    end
  end
end
