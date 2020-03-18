class User < ApplicationRecord
    has_many :comments, through: :funkopops
    has_many :funko_pops
    validates_presence_of :username
    validates_presence_of :username, :email
    has_secure_password
end
