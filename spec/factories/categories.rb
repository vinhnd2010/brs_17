FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "Category #{n}"}
    description Faker::Lorem.paragraphs(5).join("-")
  end

  factory :invalid_category, parent: :category do
    sequence(:name) {|n| "Category sample #{n}"}
    description "Category"
  end
end
