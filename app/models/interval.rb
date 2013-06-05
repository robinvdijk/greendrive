class Interval < ActiveRecord::Base
  
  def self.week_cron
    interval = Interval.new
    interval.week
  end
  
  def self.month_cron
    interval = Interval.new
    interval.month
  end
  
  def self.year_cron
    interval = Interval.new
    interval.year
  end
    
  def week
    cars = Car.all
    
    cars.each do |car|
      car.last_week = car.mileage - car.last_week
      car.last_week_electric = car.mileage_electric - car.last_week_electric
      car.save
    end
  end
  
  def month
    cars = Car.all
    
    cars.each do |car|
      car.last_month = car.mileage - car.last_week
      car.last_month_electric = car.mileage_electric - car.last_month_electric
      car.save
    end
  end
  
  def year
    cars = Car.all
    
    cars.each do |car|
      car.last_year = car.mileage - car.last_year
      car.last_year_electric = car.mileage_electric - car.last_year_electric
      car.save
    end
  end
  
  
end


