class Achievement < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :badge
  belongs_to :user
  
  
  
  
  
  def self.getbadges
    
   a = Achievement.all
   ids = a.map {|achievements| achievements.user_id}
    
    for car in Car.all
        

        
          for badge_world in Badge.where('id not in (select badge_id from achievements where user_id = 1) AND subject = ? and value <= ? ', 'around_the_world', car.mileage)
            car.user.badges << badge_world
          end
          
             #      
        # for badge_electric in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ? ', 'mileage_electric', car.mileage_electric)
        #   car.user.badges << badge_electric
        # end
        #       
 #        for badge_mileage in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ?', 'mileage', car.mileage)
 #          car.user.badges << badge_mileage
 #        end
 #      
 #        for badge_ratio in Badge.where('id not in (select badge_id from achievements where user_id = ?) AND subject = ? and value <= ?', 'mileage_ratio', car.mileage_ratio)
 #          car.user.badges << badge_ratio
 #        end
 #         
    end
    
  end
  
  
end

