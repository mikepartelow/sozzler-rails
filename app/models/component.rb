class Component < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :unit

  default_scope { order(index: :asc) }

  def to_s
    adjusted_quantity = quantity == '0/1' ? '' : quantity
    "#{adjusted_quantity} #{unit} #{ingredient}".strip
  end
end
