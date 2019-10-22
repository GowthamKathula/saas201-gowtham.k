class Section < ApplicationRecord
	belongs_to :department
	has_many :students, dependent: :destroy
	before_create :capitalize_sec
	def capitalize_sec
		self.name = self.name.upcase
	end
end
