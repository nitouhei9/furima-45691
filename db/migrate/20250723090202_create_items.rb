class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :price
      t.integer :shipping_fee_payer_id
      t.integer :shipping_region_id
      t.integer :shipping_day_id
      t.integer :status_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
