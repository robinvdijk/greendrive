FactoryGirl.define do |f|
  factory :user do 
    f.sequence(:user_name)      { |n| "karel#{n}" }
    f.sequence(:first_name)     { |n| "karel#{n}" }
    f.sequence(:last_name)      { |n| "karel#{n}" }
    f.sequence(:email)          { |n| "karel#{n}@karel.nl" }
    f.sequence(:licence_plate)  { |n| "81-TRR-#{n}" }
  end
end