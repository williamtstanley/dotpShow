class Category < ApplicationRecord
	has_many :episodes, dependent: :nullify
    validates :title, presence: true, uniqueness: true   
end
