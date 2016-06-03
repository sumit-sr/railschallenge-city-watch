class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :category
      t.text :description
      t.integer :no_of_van
      t.timestamps null: false
    end
  end
end
