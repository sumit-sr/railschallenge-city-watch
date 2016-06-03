class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders do |t|
      t.string :category
      t.string :name
      t.boolean :available, default: true
      t.boolean :on_duty, default: true
      t.timestamps null: false
    end
  end
end
