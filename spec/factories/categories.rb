FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "Category #{n}"}
    sequence(:description) {|n| "Category description #{n}"}
  end
end
