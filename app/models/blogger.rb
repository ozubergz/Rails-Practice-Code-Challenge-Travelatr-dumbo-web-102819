class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.map(&:likes).inject(0) { |sum, num|
            sum + num
        }
    end

    def most_liked_post
        self.posts.order(likes: :desc).first
    end
end
