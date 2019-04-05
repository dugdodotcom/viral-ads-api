class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :doorkeeper_authorize!
  def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      yield resource if block_given?
      render json: current_user
  end

  private

  def respond_to_on_destroy
      head :no_content
  end
end
