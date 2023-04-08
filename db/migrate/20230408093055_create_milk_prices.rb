class CreateMilkPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :milk_prices do |t|
      t.integer :milk_price

      t.timestamps
    end
  end
end
