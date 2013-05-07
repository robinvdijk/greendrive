Badge.where("field_v ? ?", operator, mileage)
# Haal alle badges op waar de field_v {greater then >} dan {mileage: 38292}
# SELECT * FROM badges WHERE field_v > 38292

mileage = 238102
Badge.where('value < ?', mileage).limit(1).order('value desc')

Badge
value: 2000 # tiers

User.first.badges

Badge.where('tier < ?', self.mileage_electric).limit(1).order('value desc')

Badge.create([
{ tier: 1000 },
{ tier: 2000 },
{ tier: 3000 }
])

Badge
has_many: :achievements
has_many: :users, through: :achievements

Koppeltabel ( Achievements )
belongs_to: :badge
belongs_to: :user

# badge_id:integer
# user_id:integer

User
has_many: :achievements
has_many: :badges, through: :achievements

# Join-query

# Users#show -> User.find(params[:id]).badges (eigenlijk dóór de achievements-tabel)
# Badges#show -> Badge.find(params[:id]).users

Badge
id: 1
tier: 1000

User
id: 1
name: 'Dennis'

Achievement
badge_id: 1
user_id: 1

User
id: 2
name: 'Christiaan'

Achievement
badge_id: 1
user_id: 2

# Segment#update
# User#find(params[:id])
# mileage_electric
# User.find(1).badges << Badge.where("tier < ?", mileage_electric)