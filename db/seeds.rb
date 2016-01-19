# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yoga_studios = Unirest.get("https://data.cityofchicago.org/resource/uupf-x98q.json?$q=yoga").body

yoga_studios.drop(1)

yoga_studios.each do |studio|
  Studio.create(
    name: studio["doing_business_as_name"],
    address: studio["location"]["human_address"],
    latitude: studio["latitude"],
    longitude: studio["longitude"]
    )
end

puts 'Done!'
