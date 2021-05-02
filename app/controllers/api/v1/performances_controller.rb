class Api::V1::PerformancesController < ApplicationController
  def sales_by_days
    sales = current_resource_owner.products
      .where(deleted: false)
      .joins(carts_items: [carts_list: [:cart]])
      .where("carts_items.deleted": false)
      .where("carts_lists.deleted": false)
      .where("carts.deleted": false).group("DATE(carts.created_at)").select("sum(carts_items.total_price)")
    p sales
    render json: sales
  end
end
