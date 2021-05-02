class Api::V1::CategoriesController < ApplicationController
  # only logged in user
  before_action :specified_category, only: [:show, :destroy, :update]

  def create
    category = Category.new(create_category_params)
    category.save
    render_resource(category)
  end

  def index
    @categories = Category.where(deleted: false).order(id: :desc)
    render json: @categories
  end

  def show
    render_resource(@category)
  end

  def update
    @category.update(update_category_params)
    render_resource(@category)
  end

  def destroy
    @category.update(deleted: true)
    render_resource(@category)
  end

  private

  def specified_category
    @category = Category.find(params[:id])
  end

  def create_category_params
    params.require(:category).permit(
      :name,
    )
  end

  def update_category_params
    params.require(:category).permit(
      :name,
    )
  end
end
