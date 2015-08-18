FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "Category sample #{n}"}
    description "Category sample description"
  end
end
