class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :uid, presence: true
belongs_to :user
end
