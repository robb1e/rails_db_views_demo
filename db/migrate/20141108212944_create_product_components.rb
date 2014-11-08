class CreateProductComponents < ActiveRecord::Migration
  def change
    create_table :product_components do |t|
      t.integer :product_id
      t.integer :component_id
    end
  end
end
