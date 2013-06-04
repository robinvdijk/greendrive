job_type :rake, "cd :path && PATH=/usr/local/bin:$PATH RAILS_ENV=:environment bundle exec rake :task :output"
set :environment, 'production' 


every 15.minutes do
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

