class Pin < ActiveRecord::Base
  belongs_to :board
  has_many :taggings
  has_many :tags, through: :taggings
end
