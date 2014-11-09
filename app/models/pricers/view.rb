class Pricers::View
  def run
    ProductCost.all.each do |product_cost|
      puts "Product '#{product_cost.product_name}' costs #{product_cost.product_manufacture_cost} to manufacture"
    end
  end
end
