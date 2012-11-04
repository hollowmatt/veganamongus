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
require 'spec_helper'

describe Recipe do
  let(:user) { FactoryGirl.create(:user) }
  before { @recipe = FactoryGirl.create(:recipe, user_id: user.id) }

  subject { @recipe }

  it { should respond_to :name }
  it { should respond_to :user_id }
  it { should respond_to :prep_time }
  it { should respond_to :cook_time }
  it { should respond_to :servings }
  it { should respond_to :method }

  its(:user) { should == user }

  it { should be_valid }

  # Note: Decided it was valid to have the user_id accessible and optional,
  # don't want to delete a recipe if a user is deleted.
end



