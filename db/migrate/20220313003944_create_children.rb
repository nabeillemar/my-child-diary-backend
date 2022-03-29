class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :child_name
      t.integer :age
      t.text :allergies
      t.string :guardian_name
      t.text :home_address
      t.string :phone_number

      t.timestamps
    end
  end
end
