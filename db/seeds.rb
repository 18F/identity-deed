# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ben = {
  email: 'benjamin_c_damman@omb.eop.gov',
  password: 'password',
  password_confirmation: 'password'
}

john = {
  email: 'john.rahaghi@gsa.gov',
  password: 'password',
  password_confirmation: 'password'
}

AdminUser.create!(ben)
AdminUser.create!(john)

Flow.create!(title: 'Enrollment', description: 'New user registration / sign up')
Flow.create!(title: 'Account Management', description: 'Users can view and modify their account profile and settings')
