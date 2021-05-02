class Api::V1::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :doorkeeper_authorize!
  def all
    p request.env["omniauth.auth"]
    user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if user.persisted?
      sign_in(user)
      create_token = Doorkeeper::AccessToken.create!(
        application_id: nil,
        resource_owner_id: user.id,
        expires_in: nil,
        scopes: 'public'
      )
      redirect_to(ENV['APP_DOMAIN'] + ENV['FRONTEND_TOKEN'] + "?token=#{create_token.token}")
      # sign_in_and_redirect(user)
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

    def failure
      #handle you logic here..
      #and delegate to super.
      super
   end


  alias_method :instagram, :all
  alias_method :facebook, :all
end
