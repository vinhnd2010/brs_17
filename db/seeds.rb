20.times do |n|
  name = Faker::Name.title
  Category.create! name: name
end

100.times do |n|
  title = Faker::Name.title
  author = Faker::Name.name
  category_id = Faker::Number.between 1, 20
  publish_date = Faker::Date.between 5.days.ago, Date.today
  num_pages = Faker::Number.between 50, 1000
  Book.create! title: title,
               author: author,
               publish_date: publish_date,
               num_pages: num_pages,
               category_id: category_id
end

100.times do |n|
  name = Faker::Name.name
  email = "brs#{n+1}@gmail.com"
  password = "123456"
  User.create! name:  name,
               email: email,
               password: password,
               password_confirmation: password
end
