User.create!(name: "AdminBrs",
              email: "admin@gmail.com",
              password: "ABCabc123",
              password_confirmation: "ABCabc123")

Settings.seed_time.times do |n|
  name = Faker::Name.title
  Category.create! name: name
end

Settings.seed_time.times do |n|
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

Settings.seed_time.times do |n|
  name = Faker::Name.name
  email = "brs#{n+1}@gmail.com"
  password = "ABCabc123"
  User.create! name:  name,
               email: email,
               password: password,
               password_confirmation: password
end

Settings.seed_time.times do |n|
  content = Faker::Name.title
  score = Faker::Number.between 1,5
  user_id = Faker::Number.between 1, 100
  book_id = Faker::Number.between 1, 100
  Review.create! content: content,
               score: score,
               user_id: user_id,
               book_id: book_id
end

Settings.seed_time.times do |n|
  content = Faker::Name.title
  review_id = Faker::Number.between 1, 100
  user_id = Faker::Number.between 1, 100
  Comment.create! content:  content,
               review_id: review_id,
               user_id: user_id
end
