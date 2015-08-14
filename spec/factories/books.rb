FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book title #{n}"}
    publish_date "2015-08-01"
    author "Mr.Vinh"
    description "Sample description book"
    num_pages 30
    category
  end
end
