class Api::V1::UsersController < ApplicationController
  respond_to    :json
  # only logged in user
  # before_action :authenticate_user!

  def me
    # make only logged in user can see himself/herself
    user = current_resource_owner
    # authorize! :read, user
    render json: user
  end
end
