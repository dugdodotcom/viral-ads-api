class Api::V1::ChoosesController < ApplicationController
  def index
    get_goods
    render json: @goods.pluck(:product_id)
  end

  def update
    choose = true
    get_goods
    good = @goods.where(product_id: params[:id])
    if good.length > 0
      good.delete_all
      choose = false
    else
      good = @goods.create(product_id: params[:id])
    end
    
    render json: @goods.pluck(:product_id)
  end

  private
  def get_goods
    @goods = current_resource_owner.products_users
  end
end
