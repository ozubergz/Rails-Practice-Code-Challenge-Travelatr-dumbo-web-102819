class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.order(created_at: :desc).limit(5)
    end

    def most_liked_post
        self.posts.order(likes: :desc).first
    end

    def total_age
        self.bloggers.map(&:age).inject(0) { |s, n|
         s + n
        }
    end 
    
    def average_age
        age_count = self.bloggers.map(&:age).count
        if age_count != 0
            return total_age / age_count
        else
            return 0
        end
    end
end
