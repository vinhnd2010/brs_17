FactoryGirl.define do
  factory :review do
    user
    book
    content "dsfsdfsdf sdfdsfdsfdsafs"
    score [0,1,2,3,4,5].sample

    factory :content_too_short do
      content "aa"
      user
      book
      score [0,1,2,3,4,5].sample
    end
  end
end
