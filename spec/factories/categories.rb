FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "Category #{n}"}
    description Faker::Lorem.paragraphs(5).join("-")
  end
end
