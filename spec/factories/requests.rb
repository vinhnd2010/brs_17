FactoryGirl.define do
  factory :request do
    sequence(:book_name) {|n| "Book title request #{n}"}
    author "VinhND"
    pulisher "Framgia VN"
    status "wait"
    user
  end

  factory :invalid_request, parent: :request do
    sequence(:book_name) {|n| "Book title request #{n}"}
    author "VinhND"
    pulisher "Framgia VN"
    status "accept"
    user
  end
end
