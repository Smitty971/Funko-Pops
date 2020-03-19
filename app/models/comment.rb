class Comment < ApplicationRecord
    belongs_to :funko_pop

    validates :username, presence: true
    validates :description, presence: true
end
