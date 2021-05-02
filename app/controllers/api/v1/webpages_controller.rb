class Api::V1::WebpagesController < ApplicationController
  def create
    webpage = current_resource_owner.webpage
    if webpage
      webpage.update update_webpage_params
    else
      webpage = Webpage.new(create_webpage_params)
      webpage.save
    end
    render_resource(webpage)
  end

  def index
    webpage = current_resource_owner.webpage
    render_resource(webpage)
  end
  
  private
  def create_webpage_params
    params.require(:webpage).permit(
      :ig_handle,
      :page_name,
      :cover,
      :description,
      :video_link,
      :logo
    ).merge(user: current_resource_owner)
  end

  def update_webpage_params
    params.require(:webpage).permit(
      :ig_handle,
      :page_name,
      :cover,
      :description,
      :video_link,
      :logo
    )
  end
end
