class User < ApplicationRecord
	has_many :orders
  	has_many :restaurants, through: :orders
  	# has_many :drivers, through: :orders

  	has_secure_password

	validates :user_name, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
end
