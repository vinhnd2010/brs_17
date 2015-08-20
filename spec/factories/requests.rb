FactoryGirl.define do
  factory :request do
    sequence(:book_name) {|n| "Book title request #{n}"}
    author "VinhND"
    pulisher "Framgia VN"
    status "wait"
    user

    factory :invalid_book_name_request do
      book_name ""
    end

    factory :invalid_author_request do
      author ""
    end
  end

  factory :invalid_request, parent: :request do
    sequence(:book_name) {|n| "Book title request #{n}"}
    author "VinhND"
    pulisher "Framgia VN"
    status "accept"
    user
  end
end
