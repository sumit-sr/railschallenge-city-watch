class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies do |t|
      t.string :type
      t.text :description
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
