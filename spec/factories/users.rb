FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "test#{n}"}
    email {"#{name.downcase}@gmail.com"}
    password "123456"
    password_confirmation "123456"
  end

  factory :admin, parent: :user do
    sequence(:name) {|n| "Admin#{n}"}
    email {"#{name.downcase}@gmail.com"}
    password "123456"
    password_confirmation "123456"
    role User.roles[:admin]
  end
end
