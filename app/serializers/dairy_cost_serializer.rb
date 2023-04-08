class DairyCostSerializer < ActiveModel::Serializer
  attributes :id,  :cost_date, :cost_item, :cost_price
end
