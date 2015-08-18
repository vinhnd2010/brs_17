FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book #{n}"}
    sequence(:author) {|n| "Superman-#{n}"}
    sequence(:description) {|n| "Book description #{n}"}
    publish_date "2015-17-08"
    number_page 100
    category
  end
end
