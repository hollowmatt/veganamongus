# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    amount 1.5
    measure "MyString"
    item "MyString"
    recipe nil
  end
end
