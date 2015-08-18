FactoryGirl.define do
  factory :request do
    sequence(:book_name) {|n| "Book title request #{n}"}
    author "VinhND"
    pulisher "Framgia VN"
    status "wait"
    user
  end
end
