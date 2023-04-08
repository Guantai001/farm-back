class Admin < ApplicationRecord
    has_secure_password
    

    # VALIDATIONS on: :create only runs when creating a new admin
    validates :first_name, presence: true, on: :create
    validates :last_name, presence: true, on: :create
    validates :email, presence: true, uniqueness: true, on: :create
    validates :phone_number, presence: true, uniqueness: true, on: :create
    validates :password, presence: true, on: :create
    
    
end
