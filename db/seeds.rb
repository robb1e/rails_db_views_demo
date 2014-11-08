(1..10000).each do |i|
  part = Part.create(name: "part_#{i}", cost: rand(1000))
  instance_variable_set "@part_#{i}", part
end

(1..1000).each do |i|
  component = Component.create(name: "component_#{i}", manufacture_cost: rand(10000))
  instance_variable_set "@component_#{i}", component
  lower = (i - 1) * 10 + 1
  upper = lower + 99
  (lower..upper).each do |j|
    part = instance_variable_get("@part_#{j}")
    ComponentPart.create component: component, part: part
  end
end

(1..10).each do |i|
  product = Product.create name: "product_#{i}", manufacture_cost: rand(100000)
  lower = (i - 1) * 10 + 1
  upper = lower + 99
  (lower..upper).each do |j|
    component = instance_variable_get("@component_#{j}")
    ProductComponent.create product: product, component: component
  end

end

