class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :animal_name, :animal_type, :animal_health, :animal_age, :animal_image
end
