class Article < ApplicationRecord
  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles

  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
