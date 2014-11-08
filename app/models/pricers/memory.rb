class Pricers::Memory
  def run
    Product.all.each do |product|
      product_cost = 0
      product.components.each do |component|
        part_cost = 0
        component.parts.each do |part|
          part_cost += part.cost
        end
        product_cost += part_cost
        product_cost += component.manufacture_cost
      end
      product_cost += product.manufacture_cost

      puts "Product '#{product.name}' costs #{product_cost} to manufacture"
    end
  end
end
