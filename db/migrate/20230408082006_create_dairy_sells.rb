class CreateDairySells < ActiveRecord::Migration[6.1]
  def change
    create_table :dairy_sells do |t|
      t.string :sold_item
      t.integer :sold_price
      t.string :sold_date

      t.timestamps
    end
  end
end
