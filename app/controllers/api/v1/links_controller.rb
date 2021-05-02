class Api::V1::LinksController < ApplicationController
  def create
    link = current_resource_owner.update(create_link_params)
    render json: {success: true}
  end

  private

  def create_link_params
    params.require(:link).permit(
      links_attributes: %I[
        id
        url
        active
        product_id
        _destroy
      ]
    )
  end
end
