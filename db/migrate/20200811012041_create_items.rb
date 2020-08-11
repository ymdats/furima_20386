class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.text :image
      t.string :name
      t.string :explain
      t.integer :category
      t.integer :status
      t.integer :shipping_charge
      t.integer :shipping_area
      t.integer :shipping_duration
      t.integer :price
      t.timestamps
    end
  end
end
