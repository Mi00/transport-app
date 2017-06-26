class Car < ApplicationRecord
	has_many :rates
	has_many :fuels

	validates :car_number, presence: true

	before_save :upcase_field


	def upcase_field
		self.car_number.upcase!
	end
end
