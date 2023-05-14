class Tag < ApplicationRecord
  has_many :tag_articles, dependent: :destroy
  has_many :articles, through: :tag_articles
end
