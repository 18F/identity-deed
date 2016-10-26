class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: Figaro.env.basic_auth_username, password: Figaro.env.basic_auth_password
end
