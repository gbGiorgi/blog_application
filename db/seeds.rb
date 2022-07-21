admin = User.first_or_create!(email: 'bobokhidze-01@mail.ru',
                             password: 'giorguna123',
                             password_confirmation: 'giorguna123',
                             name: "გიო {admin}",
                             role: User.roles[:admin])

commenter = User.first_or_create!(email: 'bobokhidze@mail.ru',
                             password: 'giroguna123',
                             password_confirmation: 'giorguna123',
                             name: "გიორგი",)
category = Category.first_or_create!(name:"Uncategorized", display_in_nav: true)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Post number #{x}",
                    body: "Body #{x} Words go here Idk",
                    user: admin,
                    comments_count: 5,
                    category: category)

    5.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}",
                          user: commenter)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"