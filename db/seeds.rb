# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(:username => 'John Appleseed', :email => '123@123.com', :password => '1234abcd', :password_confirmation => '1234abcd', :role => 'Funding Source')

