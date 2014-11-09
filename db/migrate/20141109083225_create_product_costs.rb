class CreateProductCosts < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW product_costs AS
        SELECT products.id AS product_id,
          products.name AS product_name,
          products.manufacture_cost,
          (products.manufacture_cost + sum(component_costs.cost)) AS product_manufacture_cost
        FROM products
          INNER JOIN product_components ON product_components.product_id = products.id
          INNER JOIN (
            SELECT components.id as component_id, (components.manufacture_cost + sum(cost)) AS cost from components
              INNER JOIN component_parts ON components.id = component_parts.component_id
              INNER JOIN parts ON parts.id = component_parts.part_id
              GROUP BY components.id
          ) AS component_costs ON component_costs.component_id = product_components.component_id
        GROUP BY products.id, products.name
        ORDER BY products.id
    SQL
  end

  def down
    execute "DROP VIEW IF EXISTS product_costs"
  end
end
