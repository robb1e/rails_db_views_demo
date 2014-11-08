class Product < ActiveRecord::Base
  has_many :product_components
  has_many :components, through: :product_components
end
