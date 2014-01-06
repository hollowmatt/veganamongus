FactoryGirl.define do
  factory :category do
    name "The Category"
    description "Category Description"
  end

  factory :recipe do
    name "Food"
    user_id 1
    prep_time "little bit"
    cook_time "longer"
    servings 1
    category
  end

  factory :ingredient do
    amount 1.5
    measure "tsp"
    item "stuff"
    recipe
  end

end