class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :admin_image
      t.string :phone_number
      t.string :password_digest

      t.timestamps
    end
  end
end
