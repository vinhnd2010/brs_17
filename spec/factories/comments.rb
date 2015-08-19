FactoryGirl.define do
  factory :comment do
    content "01234567890"
    user
    review
  end
end
