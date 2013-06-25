class Achievement < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :badge
  belongs_to :user
  
  
  
  
  
  def self.getbadges
    

    for car in Car.all
        

      if car.mileage >= 1000
        for badge_world in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ? ', car.user.id, 'around_the_world', car.mileage)
          car.user.badges << badge_world
        end
      end
                  
        for badge_electric in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ?', car.user.id, 'mileage_electric', car.mileage_electric)
          car.user.badges << badge_electric
        end
              
        for badge_mileage in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ?', car.user.id, 'mileage', car.mileage)
          car.user.badges << badge_mileage
        end
        
        for badge_ratio in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ?', car.user.id, 'mileage_ratio', car.mileage_ratio)
          car.user.badges << badge_ratio
        end

        
        car.score = car.user.badges.map {|badge| badge.points}.reduce(:+)
        car.save
         
    end
    

      
      
    
    
  end
  
  
end

