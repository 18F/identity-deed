password = Figaro.env.demo_user_password

john = {
  email: 'john.rahaghi@gsa.gov',
  password: password,
  password_confirmation: password
}

AdminUser.find_or_create_by!(email: john[:email]) do |user|
  user.password = user[:password]
  user.password_confirmation = user[:password_confirmation]
end

Flow.find_or_create_by!(title: 'Enrollment') do |flow|
  flow.description =  'New user registration / sign up'
end

Flow.find_or_create_by!(title: 'Account Management') do |flow|
  flow.description =  'Users can view and modify their account profile and settings'
end
