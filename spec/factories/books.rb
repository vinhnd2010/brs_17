FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book #{n}"}
    sequence(:author) {|n| "Superman-#{n}"}
    sequence(:description) {|n| "Book description #{n}"}
    publish_date "2015-08-17"
    num_pages 100
    category

    factory :title_blank do
      title ""
    end
  end
end
