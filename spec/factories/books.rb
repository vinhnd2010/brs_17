FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book #{n}"}
    sequence(:author) {|n| "Superman-#{n}"}
    sequence(:description) {|n| "Book description #{n}"}
    publish_date "Fri, 14 Aug 2015 00:00:00 UTC +00:00"
    num_pages 100
    category
  end
end
