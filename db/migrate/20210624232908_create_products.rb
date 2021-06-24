class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :name,                    null: false
      t.text :product_description,       null: false
      t.integer :product_category_id,    null: false
      t.integer :product_status_id,      null: false
      t.integer :delivery_charge_id,     null: false
      t.integer :delivery_source_id ,    null: false
      t.integer :days_up_to_delivery_id, null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
