# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "bobokha@gmail.com",
            name: "სიდი{admin}",
            password: "giorguna123",
            password_confirmation: "giorguna123",
            role: User.roles[:admin])
User.create(email: "bobokhidze@gmail.com",
            name: "სიდი{user}",
            password: "giorguna123",
            password_confirmation: "giorguna123")


5.times do |x|
  post = Post.create(title: "Post number #{x}",
                     body: "This body is for post number #{x}",
                     user_id: User.first.id)
  5.times do |y|
    Comment.create(body: "Comment number #{y}",
                   user_id: User.second.id,
                   post_id: post.id)
  end
end