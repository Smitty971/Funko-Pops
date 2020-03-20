class Tag < ApplicationRecord
    has_many :taggings
    has_many :funko_pops, through: :taggings
  end
  