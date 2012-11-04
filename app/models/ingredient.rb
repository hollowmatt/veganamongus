# == Schema Information
#
# Table name: ingredients
#
#  id         :integer         not null, primary key
#  amount     :float
#  measure    :string(255)
#  item       :string(255)
#  recipe_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :amount, :item, :measure

  validates :recipe_id,
            presence: true
  validates :amount,
            presence: true
  validates :measure,
            presence: true
  validates :item,
            presence: true

  default_scope order: "ingredients.created_at ASC"

end



