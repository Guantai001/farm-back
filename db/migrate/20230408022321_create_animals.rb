class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :animal_name
      t.string :animal_image
      t.string :animal_type
      t.string :animal_health
      t.integer :animal_age

      t.timestamps
    end
  end
end
