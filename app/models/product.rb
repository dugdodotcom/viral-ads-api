class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true
  has_many :links, dependent: :destroy
  has_many :carts_items
  accepts_nested_attributes_for :links, allow_destroy: true

  def as_json(_opts = {})
    {
      id: id,
      name: name,
      category_id: category_id,
      description: description,
      price: price,
      quantity: quantity,
      margin_per_sale: margin_per_sale,
      profit_per_visitor: profit_per_visitor,
      shipping_details: shipping_details,
      shipping_charges: shipping_charges,
      sizes: sizes,
      colour: colour,
      created_at: created_at,
      errors: errors,
      product_images_images: product_images.map do |x|
        {
          url: x.image.url(:thumb),
          name: x.image_file_name,
          id: x.id
        }
      end
    }
  end
end
