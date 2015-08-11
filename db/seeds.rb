10.times do |n|
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(1)
  Category.create! name: name, description: description
end

categories = Category.order(:created_at)

categories.each do |category|
  5.times do |n|
    title = Faker::Name.title
    author = Faker::Name.name
    publish_date = Faker::Date.between 5.days.ago, Date.today
    num_pages = Faker::Number.between 50, 1000
    description = Faker::Lorem.paragraphs(5).join("-")
    category.books.create! title: title, author: author, publish_date: publish_date,
      num_pages: num_pages, description: description
  end
end

100.times do |n|
  name = Faker::Name.name
  email = "superman#{n+1}@gmail.com"
  password = "123456"
  User.create! name:  name,
               email: email,
               password: password,
               password_confirmation: password
end

books = Book.order(:created_at)

books.each do |book|
  10.times do |n|
    content = Faker::Name.title
    score = Faker::Number.between 1,5
    user_id = Faker::Number.between 1, 100
    book.reviews.create! content: content, score: score, user_id: user_id
  end
end

reviews = Review.order(:created_at)

reviews.each do |review|
  5.times do |n|
    content = Faker::Name.title
    user_id = Faker::Number.between 1, 100
    review.comments.create! content: content, user_id: user_id
  end
end
