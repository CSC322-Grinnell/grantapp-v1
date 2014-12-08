# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(:username => 'John Appleseed Admin',    :email => 'admin@123.com', :password => '1234abcd', :password_confirmation => '1234abcd', :role => 'Admin')
User.create!(:username => 'John Appleseed FS',       :email => 'fs@123.com', :password => '1234abcd', :password_confirmation => '1234abcd', :role => 'Funding Source')
User.create!(:username => 'John Appleseed Reviewer', :email => 'review@123.com', :password => '1234abcd', :password_confirmation => '1234abcd', :role => 'Reviewer')
User.create!(:username => 'John Appleseed App',      :email => 'app@123.com', :password => '1234abcd', :password_confirmation => '1234abcd', :role => 'Applicant')
