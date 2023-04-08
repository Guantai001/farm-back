class DairySellSerializer < ActiveModel::Serializer
  attributes :id, :sold_date, :sold_item, :sold_price
end
