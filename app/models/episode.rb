class Episode < ApplicationRecord

	belongs_to :category
	belongs_to :user

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true, uniqueness: {scope: :title}

	def format_date
		created_at.to_time.strftime('%b %d, %Y') 
	end
end
