set :output, "log/cron.log"
# set :environment, "development"

every 1.day do
  rake "check_update:post"
end
