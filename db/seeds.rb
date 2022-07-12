# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "bobokhidze-01@mail.ru",
            name: "გიო{admin}",
            password: "giorguna123",
            password_confirmation: "giorguna123",
            role: User.roles[:admin])
User.create(email: "bobokhidze@gmail.com",
            name: "სიდი{user}",
            password: "giorguna123",
            password_confirmation: "giorguna123")
posts = []
comments = []

elapsed = Benchmark.measure do
  1000.times do |x|
    puts "Creating comment #{x}"
    post = Post.new(title: "Post number #{x}",
                       body: "This body is for post number #{x}",
                       user_id: User.first.id)
    posts.push(post)
    10.times do |y|
      puts "Creating comment #{y} for post #{x}"
      comment = post.comments.new(body: "Comment number #{y}",
                     user_id: User.second.id)
      comments.push(comment)
    end
  end
end

Post.import(posts)
Comment.import(comments)

puts "Elapsed time is #{elapsed.real} seconds"
