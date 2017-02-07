class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :episode, through: :taggings

  validates :title, uniqueness: true, presence: true
  
end
