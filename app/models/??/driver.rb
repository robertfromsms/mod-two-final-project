class Driver < ApplicationRecord
	has_many :orders
  	has_many :restaurants, through: :orders
  	has_many :users, through: :orders

  	has_secure_password

	validates :driver_name, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
end
