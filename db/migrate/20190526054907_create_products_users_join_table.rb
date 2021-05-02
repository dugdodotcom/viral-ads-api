class CreateProductsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :users
  end
end
