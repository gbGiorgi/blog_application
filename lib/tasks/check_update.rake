namespace :check_update do
  desc "check_update post"
  task post: :environment do
    Post.all.where(approve: true).each do |post|
      if post.created_at + 10.day < Time.now && post.likes.count.zero?
        post.update(approve: false)
        puts "Post where post.id = #{post.id} unapproved"
      end
    end
  end
end
