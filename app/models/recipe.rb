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
  has_many :ingredients, dependent: :delete_all
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  attr_accessible :cook_time, :method, :name, :prep_time, :servings, :user_id
end



