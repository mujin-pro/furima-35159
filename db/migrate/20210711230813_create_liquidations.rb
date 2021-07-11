class CreateLiquidations < ActiveRecord::Migration[6.0]
  def change
    create_table :liquidations do |t|

      t.timestamps
    end
  end
end
