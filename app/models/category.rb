# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#
class Category < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :description,
            presence: true

end


