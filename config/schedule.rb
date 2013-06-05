set :output, "log/cron.log"

set :environment, 'production' 


every 2.minutes do
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

