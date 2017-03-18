class Overrides::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :protect_from_forgery
  protect_from_forgery with: :null_session

  skip_before_filter  :verify_authenticity_token
end