require 'csv'

class ProductsController < ApplicationController
  before_action :more_details
  def list
end

  def detail
    @product = @products.find {|p| p.id == params[:id].to_i}

  end

  def more_details
    @products=[]
    counter = 1

    CSV.foreach("faust_inventory.csv", headers: true) do |row|
      # fill the array
      next if row.to_h["quantity"].to_i <= 0
      product = Product.new
      product.id = counter
      product.pid = row.to_h["pid"]
      product.item = row.to_h["item"]
      product.img_file= row.to_h["img_file"]
      product.description=row.to_h["description"]
      product.price=row.to_h["price"].to_f
      product.condition=row.to_h["condition"]
      product.dimension_w=row.to_h["dimension_w"]
      product.dimension_l=row.to_h["dimension_l"]
      product.dimension_h=row.to_h["dimension_h"]
      product.quantity=row.to_h["quantity"]
      product.category=row.to_h["category"]
      
      @products << product
      counter+= 1
  end
  @products = @products.sort_by(&:category)
  
  end

end


