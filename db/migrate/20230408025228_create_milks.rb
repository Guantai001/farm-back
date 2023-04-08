class CreateMilks < ActiveRecord::Migration[6.1]
  def change
    create_table :milks do |t|
      t.integer :milk_kgs
      t.string :milk_date
      t.integer :animal_id
      
      t.timestamps
    end
  end
end
