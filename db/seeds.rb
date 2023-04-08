# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# :first_name, :last_name, :email, :admin_image, :phone_number, :password)

# create a new admin
# t.string "first_name"
# t.string "last_name"
# t.string "email"
# t.string "admin_image"
# t.string "phone_number"
# t.string "password_digest"

# create a new admin



# Admin.create(first_name: "John",last_name: "Doe",email: "jpe@gmil.com",phone_number: "0790070535",admin_image: "https://i.imgur.com/4ZQZQ0F.jpg",password_digest: "123456")

Animal.create(animal_name: "Lion",animal_image: "https://i.imgur.com/4ZQZQ0F.jpg",animal_type: "Mammal",animal_health: "Healthy",animal_age: 5)

    