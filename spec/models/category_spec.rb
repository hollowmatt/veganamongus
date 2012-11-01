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
require 'spec_helper'

describe Category do
  before { @category = Category.new(name: "Breakfast", description: "Breakfast foods and such") }

  subject { @category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  #Test to ensure it has a name
  describe "name is absent" do
    before { @category.name = '' }
    it { should_not be_valid }
  end

  #Test to ensure it has a description
  describe "description is absent" do
    before { @category.description = '' }
    it { should_not be_valid }
  end

  #Test for uniqueness
  describe "duplicate name exists" do
    before do
      category_with_same_name = @category.dup
      category_with_same_name.save
    end
    it { should_not be_valid }
  end

end



