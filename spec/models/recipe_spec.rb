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
#  methodology     :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
require 'spec_helper'

describe Recipe do
  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  before { @recipe = FactoryGirl.create(:recipe, user: user, category: category) }

  subject { @recipe }

  it { should respond_to :name }
  it { should respond_to :user }
  it { should respond_to :prep_time }
  it { should respond_to :cook_time }
  it { should respond_to :servings }
  it { should respond_to :method }
  it { should respond_to :category }

  its(:user) { should == user }

  it { should be_valid }

  describe "when name is not present" do
    before { @recipe.name = "" }
    it { should_not be_valid }
  end

  describe "when method is not present" do
    before { @recipe.methodology = "" }
    it { should_not be_valid }
  end

  describe "when category is not present" do
    before { @recipe.category = nil }
    it { should_not be_valid }
  end

  # Note: Decided it was valid to have the user_id accessible and optional,
  # don't want to delete a recipe if a user is deleted.

  describe "ingredient associations" do
    before { @recipe.save }
    let!(:ingredient_one) do
      @recipe.ingredients.build(amount: 1.5, measure: "tsp", item: "ground cinnamon")
    end
    let!(:ingredient_two) do
      @recipe.ingredients.build(amount: 1.5, measure: "tsp", item: "ground nutmeg")
    end

    it "should destroy associated ingredients" do
      ingredients = @recipe.ingredients.dup
      @recipe.destroy
      ingredients.should be_empty
      #ingredients.each do |ing|
      #  Ingredient.find_by_id(ing.id).should be_nil
      #end
    end
  end
end



