class CreateDairyCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :dairy_costs do |t|
      t.string :cost_item
      t.integer :cost_price
      t.string :cost_date

      t.timestamps
    end
  end
end
