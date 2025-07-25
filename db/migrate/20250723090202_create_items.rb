class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :price
      t.integer :shipping_fee_payer_id, null: false
      t.integer :shipping_region_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :status_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
