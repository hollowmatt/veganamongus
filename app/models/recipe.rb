# == Schema Information
#
# Table name: recipes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  prep_time  :string(255)
#  cook_time  :string(255)
#  servings   :integer
#  method     :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  validates :name,
            presence: true
  validates :method,
            presence: true
  validates :category_id,
            presence: true

  attr_accessible :cook_time, :method, :name, :prep_time, :servings, :user, :category_id, :ingredients_attributes
end



