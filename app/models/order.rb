class Order < ApplicationRecord
	belongs_to :user
	# belongs_to :driver
	belongs_to :restaurant
	has_many :order_items
	has_many :menu_items, through: :order_items

	def make_order_items_all_successful?(hashy)
		hashy.each do |key, value|
			value.to_i.times do |i|
				orderitem = OrderItem.new(order_id: self.id, menu_item_id: MenuItem.find_by(name: key, restaurant_id: self.restaurant).id)
				unless orderitem.save
					self.destroy
					return false
				end
			end
		end
		return true
	end
end
