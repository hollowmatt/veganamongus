# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    name "MyString"
    user_id 1
    prep_time "MyString"
    cook_time "MyString"
    servings 1
    method "MyText"
    category_id 1
  end
end
