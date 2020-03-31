class User < ApplicationRecord
    has_many :comments, through: :funkopops
    has_many :funko_pops
    validates_presence_of :username
    validates_presence_of :email , unless: :github_uid?

    def github_uid?
        github_uid != nil
    end

    # if github_uid == nil
    #     validates_presence_of :email
    # end
        
    has_secure_password
end
