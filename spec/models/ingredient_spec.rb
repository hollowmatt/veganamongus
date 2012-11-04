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
require 'spec_helper'

describe Ingredient do
  let(:recipe) { FactoryGirl.create(:recipe) }
  before { @ingredient = recipe.ingredients.build(amount: 1.5, measure: "tsp", item: "ground cinnamon") }

  subject { @ingredient }

  it { should respond_to :amount }
  it { should respond_to :measure }
  it { should respond_to :item }
  it { should respond_to :recipe_id }
  its(:recipe) { should == recipe }

  it { should be_valid }

  describe "when recipe_id is not present" do
    before { @ingredient.recipe_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to recipe_id" do
      expect do
        Ingredient.new(recipe_id: recipe.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end



