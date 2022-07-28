set :output, "log/cron.log"

every 1.day do
  runner "Post.check_update"
end
