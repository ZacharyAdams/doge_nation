class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  belongs_to :user
  has_many :replies

  def self.search(search)
    if search
      Post.where('title ILIKE ?', "%#{search}%")
    else
      Post.all
    end
  end
end
