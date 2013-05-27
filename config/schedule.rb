set :output, "#{path}/log/cron.log"
set :environment, 'development' 


every 1.minutes do
  runner "Segment.cron"
end
