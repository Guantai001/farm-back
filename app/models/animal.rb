class Animal < ApplicationRecord
    has_many :milks

    # VALIDATIONS on: :create only runs when creating a new animal
    validates :animal_name, presence: true, uniqueness: true, on: :create
    validates :animal_type, presence: true, on: :create
    validates :animal_health, presence: true, on: :create
    validates :animal_age, presence: true, on: :create
    validates :animal_image, presence: true, on: :create


end
