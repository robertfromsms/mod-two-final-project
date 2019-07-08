class Restaurant < ApplicationRecord
	has_many :orders
  	has_many :users, through: :orders
  	# has_many :drivers, through: :orders
  	has_many :menu_items

  	has_secure_password

	validates :rest_name, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :address, presence: true, uniqueness: true
end
