class FunkoPop < ApplicationRecord
    has_many :comments, through: :user
end
