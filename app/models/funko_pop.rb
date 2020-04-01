class FunkoPop < ApplicationRecord
    belongs_to :user
    has_many :users, through: :comments
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings, dependent: :destroy
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    scope :ordered, -> { order('created_at DESC') }

    def tag_list
        self.tags.collect do |tag|
          tag.name
        end.join(", ")
    end
      
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end
    
    def self.users_funko_pops(user)
        where(user_id: user)
    end

    def self.search(search)

        funko_array = []
        if search
            funko_pop = self.find_by(title: search)
            #binding.pry
            if funko_pop
                funko_array << funko_pop
                return funko_array
            else
                self.all
            end
        else
            self.all
        end
    end

end
