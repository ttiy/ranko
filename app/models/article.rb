class Article < ApplicationRecord
  belongs_to :user

  validates :body, length: {maximum: 300}
  validates :body, :emotion, presence: true
end
