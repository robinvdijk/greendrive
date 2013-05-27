set :output, "#{path}/log/cron.log"
set :environment, 'development' 


every 2.minutes do
  runner "Segment.cron"
end
