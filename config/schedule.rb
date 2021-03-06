set :output, "log/cron.log"

set :environment, 'production' 
env :PATH, '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'


every 15.minute do
  runner "Segment.cron"
end

every :week do
  runner "Interval.week_cron"
end

every :month do
  runner "Interval.month_cron"
end

every :year do
  runner "Interval.year_cron"
end

