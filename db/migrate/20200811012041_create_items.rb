class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :explain
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_duration_id
      t.integer :price
      t.timestamps
    end
  end
end
