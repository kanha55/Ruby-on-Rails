class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 },allow_blank: false
  belongs_to :user
  has_many :comments, dependent: :destroy
end
