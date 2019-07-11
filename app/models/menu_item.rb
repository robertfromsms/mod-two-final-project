class MenuItem < ApplicationRecord
	has_many :order_items
	has_many :orders, through: :order_items
	belongs_to :restaurant

	validates :price, presence: true
	validates :name, presence: true
end
