class AdminSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :phone_number, :admin_image, :password
end