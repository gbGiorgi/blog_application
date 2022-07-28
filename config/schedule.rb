set :output, "log/cron.log"

every 1.minute do
  runner "Post.check_update"
end
