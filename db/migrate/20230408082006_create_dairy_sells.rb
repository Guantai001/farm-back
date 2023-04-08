class CreateDairySells < ActiveRecord::Migration[6.1]
  def change
    create_table :dairy_sells do |t|
      t.string :sell_date
      t.integer :sell_kgs
      t.string :sell_item

      t.timestamps
    end
  end
end
