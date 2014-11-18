require "rails_helper"

describe ProductCost do

  before do
    part1 = Part.create(name: 'part_1', cost: 10)
    part2 = Part.create(name: 'part_2', cost: 20)
    part3 = Part.create(name: 'part_3', cost: 30)
    component1 = Component.create(name: 'component_1', manufacture_cost: 100)
    component2 = Component.create(name: 'component_2', manufacture_cost: 200)
    ComponentPart.create(part: part1, component: component1)
    ComponentPart.create(part: part2, component: component2)
    product1 = Product.create(name: 'product_1', manufacture_cost: 1000)
    product2 = Product.create(name: 'product_2', manufacture_cost: 2000)
    ProductComponent.create(product: product1, component: component1)
    ProductComponent.create(product: product1, component: component2)
    ProductComponent.create(product: product2, component: component1)
  end

  it 'calculates the cost' do
    product_cost = ProductCost.where(product_name: 'product_1').first

    expected_cost = 1000 + 100 + 200 + 10 + 20
    expect(product_cost.product_manufacture_cost).to eq(expected_cost)
  end
end
