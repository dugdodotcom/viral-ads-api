class Api::V1::ProductsController < ApplicationController
  before_action :specified_product, only: [:show, :destroy, :update]

  def create
    product = Product.new(create_product_params)
    product.save
    render_resource(product)
  end

  def index
    @products = current_resource_owner.products.where(deleted: false).order(id: :desc)
    render json: @products
  end

  def global
    @products = Product.where(deleted: false).order(id: :desc)
    render json: @products
  end

  def show
    render_resource(@product)
  end

  def update
    @product.update(update_product_params)
    render_resource(@product)
  end

  def destroy
    @product.update(deleted: true)
    render_resource(@product)
  end

  private

  def specified_product
    @product = current_resource_owner.products.find(params[:id])
  end

  def create_product_params
    params.require(:product).permit(
      :category_id,
      :name,
      :description,
      :price,
      :quantity,
      :margin_per_sale,
      :profit_per_visitor,
      :shipping_details,
      :shipping_charges,
      :sizes,
      :colour,
      product_images_attributes: %I[
        id
        image
        _destroy
      ]
    ).merge(user: current_resource_owner)
  end

  def update_product_params
    params.require(:product).permit(
      :category_id,
      :name,
      :description,
      :price,
      :quantity,
      :margin_per_sale,
      :profit_per_visitor,
      :shipping_details,
      :shipping_charges,
      :sizes,
      :colour,
      product_images_attributes: %I[
        id
        image
        _destroy
      ]
    )
  end
end
