class City < ApplicationRecord
  has_many :posts,dependent: :destroy
  has_many :users,through: :posts

  def newest_posts
    self.posts.order("created_at DESC")
  end
end
