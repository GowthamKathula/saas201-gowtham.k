class Department < ApplicationRecord
	has_many :sections, dependent: :destroy
	has_many :students, dependent: :destroy
	validates :name, presence: true, uniqueness: true
	before_create :capitalize_dept
	def capitalize_dept
		self.name = self.name.upcase
	end
end
