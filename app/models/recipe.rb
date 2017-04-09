class Recipe < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :text, presence: true

  has_many :components
  has_many :ingredients, through: :components

  default_scope { order(rating: :desc, name: :asc) }
end
