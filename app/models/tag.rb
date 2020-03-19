class Tag < ApplicationRecord
    has_many :taggings
    has_many :funkopops, through: :taggings
  end
  